program project1;
uses
  XmXmStrDefs,
  XmPushB,
  XmSelectioB,
  XTComposite,
  XTIntrinsic;

  procedure read_name(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    push_button: TWidget;
    n: PtrUInt; // Es muss zwingend ein an die Plattform angepasster Wert sein !
  begin
    push_button := TWidget(client_data);
    WriteLn('push  ', PtrInt(push_button));
    WriteLn('data  ', PtrInt(client_data));
    XtVaGetValues(w, XmNuserData, @n, nil);
    WriteLn('push  ', PtrInt(push_button));
    WriteLn('data  ', PtrInt(client_data));
    WriteLn('User data: ', n);
  end;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    dialog: TWidget;
  begin
    dialog := XmCreatePromptDialog(w, 'notice_popup', nil, 0);
    XtVaSetValues(dialog, XmNuserData, 321, nil);
    XtAddCallback(dialog, XmNokCallback, @read_name, w); // Mit Fehler

    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
  end;

var
  toplevel, button1: TWidget;
  app: TXtAppContext;
begin
  toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, XmNwidth,320, XmNheight,200,nil);

  read_name(toplevel, Pointer(1234), nil); // Kein Fehler

  button1 := XtVaCreateManagedWidget('PushMe 1', xmPushButtonWidgetClass, toplevel, nil);
  XtAddCallback(button1, XmNactivateCallback, @pushed, nil);

  XtRealizeWidget(toplevel);
  XtAppMainLoop(app);
end.
