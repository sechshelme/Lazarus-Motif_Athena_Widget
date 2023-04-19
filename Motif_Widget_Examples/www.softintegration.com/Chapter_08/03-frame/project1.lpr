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
    toplevel, rowcol, frame: TWidget;
    app: TXtAppContext;

  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, XmNwidth, 320, nil);

    rowcol := XtVaCreateWidget('rowcolums', xmRowColumnWidgetClass, toplevel, XmNspace, 5, nil);

    XtVaCreateManagedWidget('Frame Types:', xmLabelGadgetClass, rowcol, nil);

    frame := XtVaCreateManagedWidget('frame1', xmFrameWidgetClass, rowcol,
      XmNshadowType, XmSHADOW_IN,
      nil);
    XtVaCreateManagedWidget('XmSHADOW_IN', xmLabelGadgetClass, frame, nil);
    XtVaCreateManagedWidget('XmALIGNMENT_CENTER',
      xmLabelGadgetClass, frame,
      XmNchildType, XmFRAME_TITLE_CHILD,
      XmNchildVerticalAlignment, XmALIGNMENT_CENTER,
      nil);

    frame := XtVaCreateManagedWidget('frame2', xmFrameWidgetClass, rowcol,
      XmNshadowType, XmSHADOW_OUT,
      nil);
    XtVaCreateManagedWidget('XmSHADOW_OUT', xmLabelGadgetClass, frame, nil);
    XtVaCreateManagedWidget('XmALIGNMENT_BASELINE_TOP',
      xmLabelGadgetClass, frame,
      XmNchildType, XmFRAME_TITLE_CHILD,
      XmNchildVerticalAlignment, XmALIGNMENT_BASELINE_TOP,
      nil);

    frame := XtVaCreateManagedWidget('frame3', xmFrameWidgetClass, rowcol,
      XmNshadowType, XmSHADOW_ETCHED_IN,
      nil);
    XtVaCreateManagedWidget('XmSHADOW_ETCHED_IN', xmLabelGadgetClass, frame, nil);
    XtVaCreateManagedWidget('XmALIGNMENT_WIDGET_TOP',
      xmLabelGadgetClass, frame,
      XmNchildType, XmFRAME_TITLE_CHILD,
      XmNchildVerticalAlignment, XmALIGNMENT_WIDGET_TOP,
      nil);

    frame := XtVaCreateManagedWidget('frame4', xmFrameWidgetClass, rowcol,
      XmNshadowType, XmSHADOW_ETCHED_OUT,
      nil);
    XtVaCreateManagedWidget('XmSHADOW_ETCHED_OUT', xmLabelGadgetClass, frame, nil);
    XtVaCreateManagedWidget('XmALIGNMENT_WIDGET_BOTTOM',
      xmLabelGadgetClass, frame,
      XmNchildType, XmFRAME_TITLE_CHILD,
      XmNchildVerticalAlignment, XmALIGNMENT_WIDGET_BOTTOM,
      nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
