program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

  procedure Exit_(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt(0);
  end;

  procedure activate(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    WriteLn('OK was pressed.');
  end;

  procedure popup(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    args: array [0..4] of TArg;
    xm_string: TXmString;
    dialog: TWidget;
    Text: PChar;
  begin
    Text := PChar(client_data);
    xm_string := XmStringCreateLocalized(Text);

    XtSetArg(args[0], XmNmessageString, xm_string);

    dialog := XmCreateInformationDialog(w, 'info', @args, 1);

    XmStringFree(xm_string);

    XtAddCallback(dialog, XmNokCallback, @activate, nil);

    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, pb, rc: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rc := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel, nil);

    pb := XtVaCreateManagedWidget('Hello', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(pb, XmNactivateCallback, @popup, PChar('Hello World'));

    pb := XtVaCreateManagedWidget('Goodbye', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(pb, XmNactivateCallback, @Exit_, nil);

    XtManageChild(rc);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
