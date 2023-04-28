program project1;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

uses
  heaptrc,
  Unix,
  Strings,
  ctypes,
  xlib,
  x,
  xresource,
  XmXm,
  XmXmStrDefs,
  XmPushB,
  XmPushBG,
  XmMainW,
  XmRowColumn,
  XmMessageB,
  XmSelectioB,
  XmDialogS,
  XmPanedW,
  XmLabelG,
  XmTextF,
  XmForm,
  XmBulletinB,
  XmList,
  XmScrolledW,
  XmDrawingA,
  XmArrowBG,
  XmToggleB,

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

  procedure toggled(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    state: PXmToggleButtonCallbackStruct;
    s: string;
  begin
    state := PXmToggleButtonCallbackStruct(call_data);
    if state^.set_ <> 0 then begin
      s := 'Left';
    end else begin
      s := 'Right';
    end;
    WriteLn(XtName(w), ': ', s);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol, toggle: TWidget;
    app: TXtAppContext;
    fg, bg: TPixel;
    on_, off_: TPixmap;
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

    // /usr/include/X11/bitmaps/Left
    on_ := XmGetPixmap(XtScreen(rowcol), 'Left', fg, bg);
    off_ := XmGetPixmap(XtScreen(rowcol), 'Right', fg, bg);

    if (on_ = XmUNSPECIFIED_PIXMAP) or (off_ = XmUNSPECIFIED_PIXMAP) then begin
      WriteLn('Couldn''t load pixmaps');
      Halt(1);
    end;

    toggle := XtVaCreateManagedWidget('toggle 1', xmToggleButtonWidgetClass, rowcol,
      XmNlabelType, XmPIXMAP,
      XmNlabelPixmap, off_,
      XmNselectPixmap, on_,
      nil);
    XtAddCallback(toggle, XmNvalueChangedCallback, @toggled, nil);

    toggle := XtVaCreateManagedWidget('toggle 2', xmToggleButtonWidgetClass, rowcol,
      XmNlabelType, XmPIXMAP,
      XmNlabelPixmap, off_,
      XmNselectPixmap, on_,
      nil);
    XtAddCallback(toggle, XmNvalueChangedCallback, @toggled, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
