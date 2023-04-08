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

  procedure callback(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    message: PChar;
    cbs: PXmAnyCallbackStruct;
    button: string;
  begin
    message := PChar(client_data);
    cbs := PXmAnyCallbackStruct(call_data);
    case cbs^.reason of
      XmCR_OK: begin
        button := 'OK';
      end;
      XmCR_CANCEL: begin
        button := 'Cancel';
      end;
      XmCR_HELP: begin
        button := 'Help';
      end;
    end;

    WriteLn(button, ' was selected: ', message);
    if cbs^.reason <> XmCR_HELP then begin
      XtPopdown(XtParent(w));
    end;
  end;

  procedure pused(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    args: array [0..4] of TArg;
    t: TXmString;
    message: PChar;
  const
    dialog: TWidget = nil;
  begin
    message := PChar(client_data);
    t := XmStringCreateLocalized(message);

    XtSetArg(args[0], XmNmessageString, t);

    if dialog = nil then begin
      XtSetArg(args[0], XmNautoUnmanage, False);
      dialog := XmCreateMessageDialog(w, 'notice', @args, 1);
      XtAddCallback(dialog, XmNokCallback, @callback, PChar('Hi'));
      XtAddCallback(dialog, XmNcancelCallback, @callback, PChar('Foo'));
      XtAddCallback(dialog, XmNhelpCallback, @callback, PChar('Bar'));
    end;
    XtVaSetValues(dialog, XmNmessageString, t, nil);
    XmStringFree(t);
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
    XtAddCallback(pb, XmNactivateCallback, @pused, PChar('Hello World'));

    pb := XtVaCreateManagedWidget('Goodbye', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(pb, XmNactivateCallback, @pused, PChar('Goodbye World'));

    XtManageChild(rc);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
