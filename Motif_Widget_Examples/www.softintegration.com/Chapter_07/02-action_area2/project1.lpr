program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

type
  TActionAreaItem = record
    label_: PChar;
    callback: TXtCallbackProc;
    Data: TXtPointer;
  end;
  PActionAreaItem = ^TActionAreaItem;

  procedure ok_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    text_w: TWidget;
    Text: PChar;
  begin
    text_w := TWidget(client_data);
    Text := XmTextFieldGetString(text_w);
    WriteLn('String = ', Text);
    XtFree(Text);
  end;

  procedure clear_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    text_w: TWidget;
  begin
    text_w := TWidget(client_data);
    XmTextFieldSetString(text_w, '');
  end;

  procedure close_dialog(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    shell: TWidget;
  begin
    shell := TWidget(client_data);
    XtDestroyWidget(shell);
  end;

  procedure help(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    string_: PChar;
  begin
    string_ := PChar(client_data);
    WriteLn(string_);
  end;

  procedure DestroyWidget(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

  procedure CreateActionArea(dialog: TWidget; actions: PActionAreaItem; num_actions: integer);
  const
    TIGHTNESS = 20;
  var
    widget: TWidget;
    i: integer;
  begin
    for i := 0 to num_actions - 1 do begin
      widget := XtVaCreateManagedWidget(actions[i].label_, xmPushButtonWidgetClass, dialog,
        XmNshowAsDefault, integer(i = 0),
        XmNdefaultButtonShadowThickness, 1,
        nil);
      if actions[i].callback <> nil then begin
        XtAddCallback(widget, XmNactivateCallback, actions[i].callback, actions[i].Data);
      end;
      if i = 0 then  begin
        XtVaSetValues(dialog,
          XmNdefaultButton, widget,
          nil);
      end;
    end;
  end;

  procedure do_dialog(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  const
    Hilfe_Text: array[0..30] of char = 'Hier sollte eine Hilfe kommen !';

    action_items: array of TActionAreaItem = (
      (label_: 'OK'; callback: @ok_pushed; Data: nil),
      (label_: 'Clear'; callback: @clear_pushed; Data: nil),
      (label_: 'Cancel'; callback: @close_dialog; Data: nil),
      (label_: 'Help'; callback: @help; Data: @Hilfe_Text));
  var
    dialog, rc, text_w: TWidget;
    string_: TXmString;
    args: array[0..4] of TArg;
  begin

    string_ := XmStringCreateLocalized('Dialog Shell');
    XtSetArg(args[0], XmNdialogTitle, string_);
    XtSetArg(args[1], XmNautoUnmanage, False);
    dialog := XmCreateTemplateDialog(XtParent(w), 'dialog', args, 2);
    XmStringFree(string_);

    action_items[2].Data := TXtPointer(dialog);

    rc := XtVaCreateWidget('control_area', xmRowColumnWidgetClass, dialog, nil);
    string_ := XmStringCreateLocalized('Type Something:');
    XtVaCreateManagedWidget('label', xmLabelGadgetClass, rc,
      XmNlabelString, string_, nil);
    XmStringFree(string_);

    text_w := XtVaCreateManagedWidget('text-field', xmTextFieldWidgetClass, rc, nil);

    XtManageChild(rc);

    action_items[0].Data := TXtPointer(text_w);
    action_items[1].Data := TXtPointer(text_w);

    //        CreateActionArea(dialog,@action_items[0],XtNumber(action_items));
    CreateActionArea(dialog, @action_items[0], Length(action_items));

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

    button := XtVaCreateManagedWidget('Push Me', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button, XmNactivateCallback, @do_dialog, nil);

    button := XtVaCreateManagedWidget('Quit', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button, XmNactivateCallback, @DestroyWidget, nil);

    XtManageChild(rc);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
