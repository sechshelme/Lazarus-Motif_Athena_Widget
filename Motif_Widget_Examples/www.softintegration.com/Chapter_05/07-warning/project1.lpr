program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

  procedure WarningMsg(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    args: array [0..4] of TArg;
    ok_str, cancel_str, Text: TXmString;
    msg: PChar;
  const
    dialog: TWidget = nil;
  begin
    msg := PChar(client_data);

    ok_str:=nil;
    XtSetArg(args[0], XmNmessageString, ok_str);

    if dialog = nil then begin
      dialog := XmCreateWarningDialog(w, 'Warnung', nil, 0);
    end;

    Text := XmStringCreateLtoR(msg, XmFONTLIST_DEFAULT_TAG);
    ok_str := XmStringCreateLocalized('Jas');
    cancel_str := XmStringCreateLocalized('Nein');

    XtVaSetValues(dialog,
      XmNmessageString, Text,
      XmNokLabelString, ok_str,
      XmNcancelLabelString, cancel_str,
      XmNdefaultButtonType, XmDIALOG_CANCEL_BUTTON,
      nil);

    XmStringFree(Text);
    XmStringFree(ok_str);
    XmStringFree(cancel_str);

    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, pb: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    pb := XtVaCreateManagedWidget('Button', xmPushButtonWidgetClass, toplevel, nil);
    XtAddCallback(pb, XmNactivateCallback, @WarningMsg, PChar('Do you really want to delete all files?'));

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
