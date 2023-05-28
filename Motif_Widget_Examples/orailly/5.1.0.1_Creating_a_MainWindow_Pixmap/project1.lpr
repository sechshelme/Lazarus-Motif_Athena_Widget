program project1;

uses
  x,
  xlib,
  XmPushB,
  XmXm,
  XmXmStrDefs,
  XmRowColumn,
  XmLabel,
  XmMainW,
  XTComposite,
  XTIntrinsic;

  procedure button_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Writeln('Hello Yourself!');
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, label1: TWidget;
    app: TXtAppContext;
    scr: PScreen;
    pixmap: TPixmap;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_window', xmRowColumnWidgetClass, toplevel, nil);

    scr := XtScreen(toplevel);
    pixmap := XmGetPixmap(scr, 'escherknot', XBlackPixelOfScreen(scr), XWhitePixelOfScreen(scr));

    if pixmap = XmUNSPECIFIED_PIXMAP then begin
      WriteLn('Kann Bitmap nicht laden !');
    end;

    label1 := XtVaCreateManagedWidget('label', xmLabelWidgetClass, main_w,
      XmNlabelType, XmPIXMAP,
      XmNlabelPixmap, pixmap,
      nil);

    XtVaSetValues(main_w,
      XmNworkWindow, label1,
      nil);


    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
