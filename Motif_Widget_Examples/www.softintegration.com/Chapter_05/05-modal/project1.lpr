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

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

  procedure dlg_callback(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    XtPopdown(XtParent(w));
  end;

  procedure pused(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    args: array [0..4] of TArg;
    t, ok: TXmString;
    modality: cuchar;
  const
    dialog: TWidget = nil;
  begin
    modality := PtrInt(client_data);

    if dialog = nil then begin
      ok := XmStringCreateLocalized('OK');
      XtSetArg(args[0], XmNautoUnmanage, False);
      XtSetArg(args[1], XmNcancelLabelString, ok);
      dialog := XmCreateInformationDialog(w, 'notice', args, 2);
      XtAddCallback(dialog, XmNcancelCallback, @dlg_callback, nil);
      XtUnmanageChild(XmMessageBoxGetChild(dialog, XmDIALOG_OK_BUTTON));
      XtUnmanageChild(XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON));
    end;
    t := XmStringCreateLocalized('You must reply to this message now!');
    XtVaSetValues(dialog,
      XmNmessageString, t,
      XmNdialogStyle, modality, nil);
    XmStringFree(t);
    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, button, rowcolumn: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rowcolumn := XtCreateManagedWidget('rowcolumn', xmRowColumnWidgetClass, toplevel, nil, 0);

    button := XtCreateManagedWidget('Application Modal', xmPushButtonWidgetClass, rowcolumn, nil, 0);
    XtAddCallback(button, XmNactivateCallback, @pused, TXtPointer(XmDIALOG_FULL_APPLICATION_MODAL));

    button := XtCreateManagedWidget('system Modal', xmPushButtonWidgetClass, rowcolumn, nil, 0);
    XtAddCallback(button, XmNactivateCallback, @pused, TXtPointer(XmDIALOG_SYSTEM_MODAL));

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
