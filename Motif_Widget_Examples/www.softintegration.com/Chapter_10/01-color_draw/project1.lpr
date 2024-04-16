program project1;

uses
  heaptrc,
  Unix,
  Strings,
  ctypes,
  xlib,
  x,
  Xm, XT;

const
  colors: array of PChar = (
    'Black', 'Red', 'Green', 'Blue', 'White', 'Navy', 'Orange', 'Yellow',
    'Pink', 'Magenta', 'Cyan', 'Brown', 'Grey', 'LimeGreen', 'Turquoise',
    'Violet', 'Wheat', 'Purple');

var
  gc: TGC;
  pixmap: TPixmap;
  Width, Height: TDimension;

  procedure set_color(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    color: PChar;
    dpy: PDisplay;
    cmap: TColormap;
    col, unused: TXColor;
    s: string;
  begin
    color := PChar(client_data);
    dpy := XtDisplay(w);
    cmap := DefaultColormapOfScreen(XtScreen(w));

    if XAllocNamedColor(dpy, cmap, color, @col, @unused) = 0 then begin
      WriteStr(s, 'Can''t alloc ', color);
      XtWarning(PChar(s));
    end;
    //    WriteLn(color);
    XSetForeground(dpy, gc, col.pixel);
  end;

  procedure Exit1(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt(0);
  end;

  procedure draw(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  var
    bevent: PXButtonEvent;
  const
    x: TPosition = 0;
    y: TPosition = 0;
  begin
    bevent := PXButtonEvent(event);
    if num_params^ <> 1 then begin
      XtError('Wrong number of args!');
    end;

    if strcomp(params[0], 'down') <> 0 then begin
      XDrawLine(bevent^.display, bevent^.window, gc, x, y, bevent^.x, bevent^.y);
      XDrawLine(bevent^.display, pixmap, gc, x, y, bevent^.x, bevent^.y);
    end;
    x := bevent^.x;
    y := bevent^.y;
  end;

  procedure redraw(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmDrawingAreaCallbackStruct;
  begin
    cbs := PXmDrawingAreaCallbackStruct(call_data);
    XCopyArea(cbs^.event^.xexpose.display, pixmap, cbs^.window, gc, 0, 0, Width, Height, 0, 0);
  end;

  procedure clear_it(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmPushButtonCallbackStruct;
    drawing_a: TWidget;
  begin
    drawing_a := TWidget(client_data);
    cbs := PXmPushButtonCallbackStruct(call_data);

    XSetForeground(XtDisplay(drawing_a), gc, WhitePixelOfScreen(XtScreen(drawing_a)));

    XFillRectangle(XtDisplay(drawing_a), pixmap, gc, 0, 0, Width, Height);
    XSetForeground(XtDisplay(drawing_a), gc, BlackPixelOfScreen(XtScreen(drawing_a)));
    XCopyArea(cbs^.event^.xbutton.display, pixmap, XtWindow(drawing_a), gc, 0, 0, Width, Height, 0, 0);
  end;

  // https://www.oreilly.com/library/view/volume-6a-motif/9780596000431/chapter-146.html

  procedure main(argc: longint; argv: PPChar);
  const
    translation: PChar =
      '<Btn1Down>:   draw(down)'#10 +
      '<Btn1Up>:     draw(up)  '#10 +
      '<Btn1Motion>: draw(motion)';

  var
    actions: TXtActionsRec;
    toplevel, main_w, rc, pb, sw, drawing_a: TWidget;
    app: TXtAppContext;
    gcv: TXGCValues;
    i: integer;
    xmdraw: TWidgetClass;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_w', xmFormWidgetClass, toplevel, nil);

    gcv.foreground := WhitePixelOfScreen(XtScreen(main_w));
    gc := XCreateGC(XtDisplay(main_w), RootWindowOfScreen(XtScreen(main_w)), GCForeground, @gcv);

    rc := XtVaCreateWidget('rc', xmRowColumnWidgetClass, main_w,
      XmNnumColumns, 3,
      XmNpacking, XmPACK_COLUMN,
      XmNleftAttachment, XmATTACH_FORM,
      XmNtopAttachment, XmATTACH_FORM,
      nil);

    for i := 0 to Length(colors) - 1 do begin
      pixmap := XCreatePixmap(XtDisplay(rc), RootWindowOfScreen(XtScreen(rc)), 16, 16, DefaultDepthOfScreen(XtScreen(rc)));
      set_color(rc, colors[i], nil);

      XFillRectangle(XtDisplay(main_w), pixmap, gc, 0, 0, 16, 16);

      pb := XtVaCreateManagedWidget(colors[i], xmPushButtonWidgetClass, rc,
        XmNlabelType, XmPIXMAP,
        XmNlabelPixmap, pixmap,
        nil);
      XtAddCallback(pb, XmNactivateCallback, @set_color, colors[i]);
    end;
    XtManageChild(rc);

    pb := XtVaCreateManagedWidget('Quit', xmPushButtonGadgetClass, main_w,
      XmNleftAttachment, XmATTACH_FORM,
      XmNtopAttachment, XmATTACH_WIDGET,
      XmNtopWidget, rc,
      nil);

    XtAddCallback(pb, XmNactivateCallback, @Exit1, nil);

    pb := XtVaCreateManagedWidget('Clear', xmPushButtonGadgetClass, main_w,
      XmNleftAttachment, XmATTACH_WIDGET,
      XmNleftWidget, pb,
      XmNtopAttachment, XmATTACH_WIDGET,
      XmNtopWidget, rc,
      nil);

    sw := XtVaCreateManagedWidget('scrolled_win', xmScrolledWindowWidgetClass, main_w,
      XmNwidth, 300,
      XmNscrollingPolicy, XmAUTOMATIC,
      XmNscrollBarDisplayPolicy, XmAS_NEEDED,
      XmNtopAttachment, XmATTACH_FORM,
      XmNbottomAttachment, XmATTACH_FORM,
      XmNleftAttachment, XmATTACH_WIDGET,
      XmNleftWidget, rc,
      XmNrightAttachment, XmATTACH_FORM,
      nil);

    actions._string := 'draw';
    actions.proc := @draw;
    XtAppAddActions(app, @actions, 1);

    drawing_a := XtVaCreateManagedWidget('drawing_a', xmDrawingAreaWidgetClass, sw,
      XmNtranslations, XtParseTranslationTable(translation),
      XmNunitType, Xm1000TH_INCHES,
      XmNwidth, 5000,
      XmNheight, 6000,
      XmNresizePolicy, XmNONE,
      nil);

    XtAddCallback(drawing_a, XmNexposeCallback, @redraw, nil);
    XtAddCallback(pb, XmNactivateCallback, @clear_it, drawing_a);

    XtVaSetValues(drawing_a, XmNunitType, XmPIXELS, nil);
    XtVaGetValues(drawing_a, XmNwidth, @Width, XmNheight, @Height, nil);

    pixmap := XCreatePixmap(XtDisplay(drawing_a), RootWindowOfScreen(XtScreen(drawing_a)), Width, Height, DefaultDepthOfScreen(XtScreen(drawing_a)));

    set_color(drawing_a, PChar('White'), nil);

    XFillRectangle(XtDisplay(drawing_a), pixmap, gc, 0, 0, Width, Height);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
