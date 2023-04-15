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

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;


  procedure DestroyApp(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;


  procedure DestroyWidget(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    XtDestroyWidget(w);
  end;

  procedure read_name(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    push_button: TWidget;
    n: integer;
    Text: PChar;
    cbs: PXmSelectionBoxCallbackStruct;
  begin
    push_button := TWidget(client_data);
    WriteLn('push  ', PtrInt(push_button));
    WriteLn('data  ', PtrInt(client_data));
    //    cbs := PXmSelectionBoxCallbackStruct(call_data);
    XtVaGetValues(w, XmNuserData, @n, nil);
    WriteLn('push  ', PtrInt(push_button));
    WriteLn('data  ', PtrInt(client_data));

    exit;

    if n = 0 then begin
      XtVaSetValues(client_data, XmNlabelString, cbs^.Value, nil);
      //      XtVaSetValues(push_button, XmNlabelString, cbs^.Value, nil);
    end else begin
      XmStringGetLtoR(cbs^.Value, XmFONTLIST_DEFAULT_TAG, @Text);

      XtVaSetValues(client_data,
        XtVaTypedArg, XmNforeground,
        //        XmRString, Text, strlen(Text) + 1,
        XmRString, Text, 0,
        nil);
      //XtVaSetValues(push_button,
      //  XtVaTypedArg, XmNforeground,
      //  XmRString, Text, strlen(Text),
      //  nil);
      XtFree(Text);
    end;
  end;

  procedure togggle_callback(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    dialog: TWidget;
    n: PtrInt;
    cbs: PXmToggleButtonCallbackStruct;
    str1: TXmString;
  begin
    dialog := XtParent(XtParent(w));
    n := PtrInt(client_data);
    cbs := PXmToggleButtonCallbackStruct(call_data);
    if cbs^.set_ = 0 then begin
      Exit;
    end;
    if n = 0 then begin
      str1 := XmStringCreateLocalized('Enter New Button Name:');
    end else begin
      str1 := XmStringCreateLocalized('Enter text Color:');
    end;
    XtVaSetValues(dialog, XmNselectionLabelString, str1,
      XmNuserData, n,
      nil);
    XmStringFree(str1);
  end;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    t, btn1, btn2: TXmString;
    args: array[0..4] of TArg;
    dialog, toggle_box, EditWidget: TWidget;
  begin
    t := XmStringCreateLocalized('Enter New Button Name:');
    XtSetArg(args[0], XmNselectionLabelString, t);
    XtSetArg(args[1], XmNautoUnmanage, False);
    XtSetArg(args[2], XmNuserData, 0);
    dialog := XmCreatePromptDialog(w, 'notice_popup', args, 3);
    XmStringFree(t);

    XtAddCallback(dialog, XmNokCallback, @read_name, w);
    XtAddCallback(dialog, XmNcancelCallback, @DestroyWidget, nil);

    XtUnmanageChild(XmSelectionBoxGetChild(dialog, XmDIALOG_HELP_BUTTON));
    EditWidget := XmSelectionBoxGetChild(dialog, XmDIALOG_TEXT);
    XtVaSetValues(EditWidget,
      XtVaTypedArg, XmNbackground, XmRString, 'cyan', 0,
      XtVaTypedArg, XmNforeground, XmRString, 'blue', 0, nil);

    btn1 := XmStringCreateLocalized('Change Name');
    btn2 := XmStringCreateLocalized('Change Color');

    //toggle_box := XmVaCreateSimpleRadioBox(dialog, 'radio_box', 0, @togggle_callback,
    //  XmVaRADIOBUTTON, btn1, 0, nil, nil,
    //  XmVaRADIOBUTTON, btn2, 0, nil, nil,
    //  nil);
    //XmStringFree(btn1);
    //XmStringFree(btn2);
    //XtManageChild(toggle_box);

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
    read_name(toplevel, Pointer(1234), nil);


    rc := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel, nil);

    button1 := XtVaCreateManagedWidget('PushMe 1', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button1, XmNactivateCallback, @pushed, nil);

    button1 := XtVaCreateManagedWidget('PushMe 2', xmPushButtonWidgetClass, rc, nil);
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
