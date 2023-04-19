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
    toplevel, pane: TWidget;
    app: TXtAppContext;

  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, XmNwidth, 320, nil);

    pane := XtVaCreateWidget('rowcolums', xmPanedWindowWidgetClass, toplevel, nil);

    XtVaCreateManagedWidget('Hello:', xmLabelGadgetClass, pane,
      XmNpaneMinimum, 25,
      XmNpaneMaximum, 45,
      nil);

    XtVaCreateManagedWidget('text', xmTextWidgetClass, pane,
      XmNrows, 5,
      XmNcolumns, 80,
      XmNpaneMinimum, 55,
      XmNeditMode, XmMULTI_LINE_EDIT,
      XmNbackground, $FFFFFF,
      XmNvalue, 'his is a test of the paned window widget.',
      nil);

    XtVaCreateManagedWidget('Goodby', xmLabelGadgetClass, pane,
      XmNpaneMinimum, 25,
      XmNpaneMaximum, 45,
      nil);

    XtManageChild(pane);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
