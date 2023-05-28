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
  XmMainW,
  XmRowColumn,
  XmMessageB,
  XmSelectioB,
  XmDialogS,
  XmPanedW,
  XmLabelG,
  XmTextF,
  XmForm,
  XmFrame,
  XmBulletinB,

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, mainform, btn1, btn2, btn3: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    mainform := XtVaCreateWidget('mainform', xmFormWidgetClass, toplevel,
      XmNfractionBase, 4,
      nil);

    btn1 := XtVaCreateManagedWidget('Button1', xmPushButtonWidgetClass, mainform,
      XmNleftAttachment, XmATTACH_POSITION,
      XmNleftPosition, 1,
      XmNrightAttachment, XmATTACH_POSITION,
      XmNrightPosition, 2,
      nil);

    btn2 := XtVaCreateManagedWidget('Button2', xmPushButtonWidgetClass, mainform,
      XmNtopAttachment, XmATTACH_WIDGET,
      XmNtopWidget, btn1,
      XmNleftAttachment, XmATTACH_POSITION,
      XmNleftPosition, 2,
      nil);

    btn3 := XtVaCreateManagedWidget('Button3', xmPushButtonWidgetClass, mainform,
      XmNtopAttachment, XmATTACH_WIDGET,
      XmNtopWidget, btn2,
      XmNleftAttachment, XmATTACH_POSITION,
      XmNleftPosition, 2,
      XmNbottomAttachment, XmATTACH_POSITION,
      XmNbottomPosition, 4,
      XmNrightAttachment, XmATTACH_FORM,
      nil);

    XtManageChild(mainform);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
