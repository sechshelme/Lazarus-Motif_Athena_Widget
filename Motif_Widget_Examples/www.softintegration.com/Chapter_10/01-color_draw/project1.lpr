program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
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

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

const
  colors: array of PChar = (
    'Black', 'Red', 'Green', 'Blue', 'White', 'Navy', 'Orange', 'Yellow',
    'Pink', 'Magenta', 'Cyan', 'Brown', 'Grey', 'LimeGreen', 'Turquoise',
    'Violet', 'Wheat', 'Purple');

var
  gc: TGC;
  pixmap: TPixmap;

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

  procedure Exit1(w: TWidget; client_data: TXtPointer; call_data: TXtPointer);    cdecl;
  begin
         Halt(0);
  end;

  procedure draw(w: TWidget; event: PXEvent; params: PXtString;    num_params: PCardinal); cdecl;
  var
    bevent: PXButtonEvent;
  begin
      bevent:=PXButtonEvent(event);
      if num_params^ <> 1 then XtError('Wrong number of args!');
  end;

  procedure main(argc: longint; argv: PPChar);
  const
    translation: PChar = ':   draw(down)'#10 +
      ':     draw(up)  '#10 +
      ': draw(motion)';

  var
    actions:TXtActionsRec;
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

    XtAddCallback(pb, XmNactivateCallback, @Exit1,nil);

    pb := XtVaCreateManagedWidget('Clear', xmPushButtonGadgetClass, main_w,
      XmNleftAttachment, XmATTACH_WIDGET,
      XmNleftWidget, pb,
      XmNtopAttachment, XmATTACH_WIDGET,
      XmNtopWidget, rc,
      nil);

    sw:=XtVaCreateManagedWidget('scrolled_win',xmScrolledWindowWidgetClass,main_w,
       XmNwidth,300,
       XmNscrollingPolicy,XmAUTOMATIC,
       XmNscrollBarDisplayPolicy,XmAS_NEEDED,
       XmNtopAttachment, XmATTACH_FORM,
       XmNbottomAttachment, XmATTACH_FORM,
       XmNleftAttachment, XmATTACH_WIDGET,
       XmNleftWidget, rc,
       XmNrightAttachment, XmATTACH_FORM,
    nil);

    actions._string:='draw';
    actions.proc:=@draw;

    drawing_a:=XtVaCreateManagedWidget('drawing_a', xmDrawingAreaWidgetClass,sw,
       XmNtranslations, XtParseTranslationTable(translation),
       XmNunitType,Xm1000TH_INCHES,
       XmNwidth,5000,
       XmNheight,6000,
       XmNresizePolicy,XmNONE,
    nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
