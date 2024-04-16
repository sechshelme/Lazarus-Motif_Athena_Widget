program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;


  procedure DestroyApp(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

  procedure dlg_callback(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmAnyCallbackStruct;
  begin
    cbs := PXmAnyCallbackStruct(call_data);
    case cbs^.reason of
    XmCR_OK, XmCR_CANCEL: begin
      WriteLn('ok or cancel');
      XtPopdown(XtParent(w));
    end;
    XmCR_ACTIVATE: begin
      WriteLn('activate');
      XtPopdown(XtParent(XtParent(w)));
    end;
    XmCR_HELP: begin
      WriteLn('Help selected');
    end;
    end;
  end;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    m, yes, no: TXmString;
    args: array[0..4] of TArg;
    dialog, no_button: TWidget;
  begin
    m := XmStringCreateLocalized('Do you want to update your changes?');
    yes := XmStringCreateLocalized('Yes');
    no := XmStringCreateLocalized('No');
    XtSetArg(args[0], XmNautoUnmanage, False);
    XtSetArg(args[1], XmNmessageString, m);
    XtSetArg(args[2], XmNokLabelString, yes);
    dialog := XmCreateQuestionDialog(w, 'notice', args, 3);
    XtAddCallback (dialog, XmNokCallback, @dlg_callback, nil);
    XtAddCallback (dialog, XmNcancelCallback, @dlg_callback, nil);
    XtAddCallback (dialog, XmNhelpCallback, @dlg_callback, nil);
    XmStringFree(m);
    XmStringFree(yes);

    no_button := XtVaCreateManagedWidget('no', xmPushButtonWidgetClass, dialog,
      XmNlabelString, no, nil);
    XmStringFree(no);
    XtAddCallback(no_button, XmNactivateCallback, @dlg_callback, w);

    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, button1, rc: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rc := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel, nil);

    button1 := XtVaCreateManagedWidget('Button', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button1, XmNactivateCallback, @pushed, nil);

    button1 := XtVaCreateManagedWidget('Quit', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button1, XmNactivateCallback, @DestroyApp, nil);

    XtManageChild(rc);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
