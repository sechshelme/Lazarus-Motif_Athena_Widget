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

  procedure ok_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    message: PChar;
  begin
    message := PChar(client_data);
    WriteLn('OK was selected: ', message);
    XtDestroyWidget(w);
  end;

  procedure cancel_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    message: PChar;
  begin
    message := PChar(client_data);
    WriteLn('Cancel was selected: ', message);
    XtDestroyWidget(w);
  end;

  procedure help_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    WriteLn('Help was selected');
  end;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    args: array [0..4] of TArg;
    m, t: TXmString;
    dialog: TWidget;
  begin
    m := XmStringCreateLocalized('This is a message.');
    t := XmStringCreateLocalized('Message.');

    XtSetArg(args[0], XmNautoUnmanage, False);
    XtSetArg(args[1], XmNmessageString, m);
    XtSetArg(args[2], XmNdialogTitle, t);

    dialog := XmCreateMessageDialog(w, 'notice', @args, 3);

    XtAddCallback(dialog, XmNokCallback, @ok_pushed, PChar('Hi'));
    XtAddCallback(dialog, XmNcancelCallback, @cancel_pushed, PChar('Foo'));
    XtAddCallback(dialog, XmNhelpCallback, @help_pushed, nil);

    XmStringFree(m);
    XmStringFree(t);

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
    XtAddCallback(pb, XmNactivateCallback, @pushed, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
