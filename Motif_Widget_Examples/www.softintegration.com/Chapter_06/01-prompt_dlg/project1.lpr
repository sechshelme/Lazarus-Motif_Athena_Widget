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

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

  procedure DestroyWidget(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    XtDestroyWidget(w);
  end;

  procedure read_name(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    push_button: TWidget;
    cbs: PXmSelectionBoxCallbackStruct;
    t: TXmString;
  begin
    push_button := TWidget(client_data);
    cbs := PXmSelectionBoxCallbackStruct(call_data);
    XtVaSetValues(push_button, XmNlabelString, cbs^.Value, nil);

    XtDestroyWidget(w);
  end;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    t: TXmString;
    args: array[0..4] of TArg;
    dialog: TWidget;
  begin
    t := XmStringCreateLocalized('Enter New Button Name:');
    XtSetArg(args[0], XmNselectionLabelString, t);
    XtSetArg(args[1], XmNautoUnmanage, False);
    dialog := XmCreatePromptDialog(w, 'prompt', args, 2);
    XmStringFree(t);

    XtAddCallback(dialog, XmNokCallback, @read_name, w);
    XtAddCallback(dialog, XmNcancelCallback, @DestroyWidget, nil);

    XtSetSensitive(XmSelectionBoxGetChild(dialog, XmDIALOG_HELP_BUTTON), False);
    XtManageChild(dialog);

    XtPopup(XtParent(dialog), XtGrabNone);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, button, rc: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rc := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel, nil);

    button := XtVaCreateManagedWidget('PushMe 1', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button, XmNactivateCallback, @pushed, nil);

    button := XtVaCreateManagedWidget('PushMe 2', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button, XmNactivateCallback, @pushed, nil);

    XtManageChild(rc);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
