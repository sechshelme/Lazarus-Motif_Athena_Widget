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
    toplevel, mainform,btn1, btn2, btn3, btn4, btn5, btn6, textform1: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    mainform := XtVaCreateWidget('mainform', xmFormWidgetClass, toplevel,
      nil);

    btn1 := XtVaCreateManagedWidget('Button1', xmPushButtonWidgetClass, mainform, nil);

    btn2 := XtVaCreateManagedWidget('Button2 ich bin lang', xmPushButtonWidgetClass, mainform,
    XmNleftAttachment, XmATTACH_WIDGET,
    XmNleftWidget, btn1,
    nil);

    btn3 := XtVaCreateManagedWidget('Button3', xmPushButtonWidgetClass, mainform,
    XmNleftAttachment, XmATTACH_WIDGET,
    XmNleftWidget, btn2,
    XmNrightAttachment,XmATTACH_FORM,
    nil);

    btn4 := XtVaCreateManagedWidget('Button4', xmPushButtonWidgetClass, mainform,
    XmNrightAttachment,XmATTACH_FORM,
    XmNbottomAttachment,XmATTACH_FORM,
    nil);

    btn5 := XtVaCreateManagedWidget('Button5', xmPushButtonWidgetClass, mainform,
    XmNrightAttachment,XmATTACH_WIDGET,
    XmNrightWidget, btn4,
    XmNbottomAttachment,XmATTACH_FORM,
    nil);

    btn6 := XtVaCreateManagedWidget('Btn6', xmPushButtonWidgetClass, mainform,
    XmNleftAttachment,XmATTACH_OPPOSITE_WIDGET,
    XmNleftWidget, btn1,
    XmNrightAttachment,XmATTACH_WIDGET,
    XmNrightWidget, btn5,
    XmNbottomAttachment,XmATTACH_FORM,
    nil);

    textform1 := XtVaCreateManagedWidget('text_form', xmTextWidgetClass, mainform,
    XmNbackground,$FFFFFF,
    XmNtopAttachment, XmATTACH_WIDGET,
    XmNtopWidget, btn2,
    XmNrightAttachment,XmATTACH_FORM,
    XmNleftAttachment, XmATTACH_WIDGET,
    XmNleftWidget, btn1,
    XmNbottomAttachment, XmATTACH_WIDGET,
    XmNbottomWidget, btn4,
    nil);

    XtManageChild(mainform);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
