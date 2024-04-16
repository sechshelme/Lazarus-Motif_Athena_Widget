program project1;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

uses
  heaptrc,
  Unix,
  unixtype,
  Strings,
  ctypes,
  xlib,
  x,
  xresource,
  Xm, XT;

type
  TExecItem = record
    drawn_w: TWidget;
    pixmap_file: PChar;
    exec_argv: array[0..5] of PChar;
    pid: cint;
  end;

const
  MAIL_PROG = '/bin/mail';
  prog_list: array of TExecItem = (
    (drawn_w: nil; pixmap_file: 'terminal'; exec_argv: ('xterm', MAIL_PROG, nil, nil, nil, nil); pid: 0),
    (drawn_w: nil; pixmap_file: 'flagup'; exec_argv: ('xterm', '-e', nil, nil, nil, nil); pid: 0),
    (drawn_w: nil; pixmap_file: 'calculator'; exec_argv: ('xcalc', nil, nil, nil, nil, nil); pid: 0),
    (drawn_w: nil; pixmap_file: 'xlogo64'; exec_argv: ('foo', nil, nil, nil, nil, nil); pid: 0));
var
  gc: TGC;

  procedure redraw_button(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    pixmap: TPixmap;
    root: TWindow;
    srcx, srcy: cint;
    pix_w, pix_h: cuint;
    cbs: PXmDrawnButtonCallbackStruct;
    destx: cint = 0;
    desty: cint = 0;
    bdr_w, w_width, w_heigth, border, drawsize: TDimension;
    hlthich, shthick: cshort;
  begin
    cbs := PXmDrawnButtonCallbackStruct(call_data);
    pixmap := TPixmap(client_data);

    XGetGeometry(XtDisplay(w), pixmap, @root, @srcx, @srcy, @pix_w, @pix_h, @srcx, @srcy);

    XtVaGetValues(w,
      XmNwidth, @w_width,
      XmNheight, @w_heigth,
      XmNborderWidth, @bdr_w,
      XmNhighlightThickness, @hlthich,
      XmNshadowThickness, @shthick,
      nil);

    border := bdr_w + hlthich + shthick;
    drawsize := w_width - 2 * border;

    if drawsize > pix_w then begin
      srcx := 0;
      destx := (drawsize - pix_w) div 2 + border;
    end else begin
      srcx := (pix_w - drawsize) div 2;
      pix_w := drawsize;
      destx := border;
    end;

    if drawsize > pix_h then begin
      srcy := 0;
      desty := (drawsize - pix_h) div 2 + border;
    end else begin
      srcy := (pix_h - drawsize) div 2;
      pix_h := drawsize;
      desty := border;
    end;

    XCopyArea(XtDisplay(w), pixmap, cbs^.window, gc, srcx, srcy, pix_w, pix_h, destx, desty);
  end;

  procedure exec_prog(w: TWidget; client_data: TXtPointer; call_data: TXtPointer
    ); cdecl;
  begin

  end;

  procedure main(argc: longint; argv: PPChar);
  var
    rowcol, toplevel: TWidget;
    app: TXtAppContext;
    fg, bg: TPixel;
    i: integer;
    pixmap: TPixmap;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      XmNorientation, XmHORIZONTAL,
      nil);
    XtVaGetValues(rowcol,
      XmNforeground, @fg,
      XmNbackground, @bg,
      nil);

    gc := XCreateGC(XtDisplay(rowcol), RootWindowOfScreen(XtScreen(rowcol)), 0, nil);
    XSetForeground(XtDisplay(rowcol), gc, fg);
    XSetBackground(XtDisplay(rowcol), gc, bg);

    for i := 0 to Length(prog_list) - 1 do begin
      pixmap := XmGetPixmap(XtScreen(rowcol), prog_list[i].pixmap_file, fg, bg);
      if pixmap = 0 then begin
        WriteLn('error');
      end;
      prog_list[i].drawn_w := XtVaCreateManagedWidget('dbutton', xmDrawnButtonWidgetClass, rowcol,
        XmNwidth, 64,
        XmNheight, 64,
        XmNpushButtonEnabled, True,
        XmNshadowType, XmSHADOW_ETCHED_OUT,
        nil);
      XtAddCallback(prog_list[i].drawn_w, XmNactivateCallback, @exec_prog, @prog_list[i]);

      XtAddCallback(prog_list[i].drawn_w, XmNexposeCallback, @redraw_button, TXtPointer(pixmap));
      XtAddCallback(prog_list[i].drawn_w, XmNrealizeCallback, @redraw_button, TXtPointer(pixmap));
    end;

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
