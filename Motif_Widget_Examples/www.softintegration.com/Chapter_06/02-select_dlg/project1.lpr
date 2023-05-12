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

type
  PListItem = ^  TListItem;

  TListItem = record
    label_: PChar;
    strings: array of PChar;
  end;


const
  days_items: TListItem = (label_: 'Tage'; strings: ('Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag'));
  monath_items: TListItem = (label_: 'Monate'; strings: ('Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember'));

  procedure DestroyWidget(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    XtDestroyWidget(w);
  end;

  function PostDialog(parent: TWidget; dialog_type: integer; msg: PChar): TWidget;
  var
    dialog: TWidget;
    Text: TXmString;
  begin
    dialog := XmCreateMessageDialog(parent, 'dialog', nil, 0);
    Text := XmStringCreateLocalized(msg);
    XtVaSetValues(dialog,
      XmNdialogType, dialog_type,
      XmNmessageString, Text, nil);
    XmStringFree(Text);
    XtUnmanageChild(XmMessageBoxGetChild(dialog, XmDIALOG_CANCEL_BUTTON));
    XtSetSensitive(XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON), False);
    XtAddCallback(dialog, XmNokCallback, @DestroyWidget, nil);
    XtManageChild(dialog);
    Result := dialog;
  end;

  procedure dialog_callback(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmSelectionBoxCallbackStruct;
    msg: string;
    prompt, Value: PChar;
    dialog_type: integer;
  begin
    cbs := PXmSelectionBoxCallbackStruct(call_data);
    case cbs^.reason of
      XmCR_OK: begin
        prompt := 'selection: ';
        dialog_type := XmDIALOG_MESSAGE;
      end;
      XmCR_NO_MATCH: begin
        prompt := 'Not a valid selection: ';
        dialog_type := XmDIALOG_ERROR;
      end else begin
        prompt := 'Unknown selection: ';
        dialog_type := XmDIALOG_ERROR;
      end;
    end;
    XmStringGetLtoR(cbs^.Value, XmFONTLIST_DEFAULT_TAG, @Value);
    WriteStr(msg, prompt, Value, #0);
    XtFree(Value);
    PostDialog(XtParent(XtParent(w)), dialog_type, @msg[1]);
    if cbs^.reason <> XmCR_NO_MATCH then begin
      XtPopdown(XtParent(w));
      XtDestroyWidget(w);
    end;
  end;

  procedure dialog_apply_callback(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmSelectionBoxCallbackStruct;
    Value: PChar;
  begin
    cbs := PXmSelectionBoxCallbackStruct(call_data);
    XmStringGetLtoR(cbs^.Value, XmFONTLIST_DEFAULT_TAG, @Value);
    WriteLn('Apply gedrückt !');
    WriteLn('Monat: ', Value);
    XtFree(Value);
  end;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    items: PListItem;
    str: PXmString;
    i: integer;
    t: TXmString;
    dialog: TWidget;
    len: SizeInt;
  begin
    items := PListItem(client_data);
    len := Length(items^.strings);
    str := PXmString(XtMalloc(len * SizeOf(TXmString)));

    t := XmStringCreateLocalized(items^.label_);
    for i := 0 to len - 1 do begin
      str[i] := XmStringCreateLocalized(items^.strings[i]);
    end;
    dialog := XmCreateSelectionDialog(w, 'selection', nil, 0);
    XtVaSetValues(dialog,
      XmNlistLabelString, t,
      XmNlistItems, str,
      XmNlistItemCount, len,
      XmNmustMatch, True, nil);
    XtSetSensitive(XmSelectionBoxGetChild(dialog, XmDIALOG_HELP_BUTTON), False);
    XtAddCallback(dialog, XmNokCallback, @dialog_callback, nil);
    XtAddCallback(dialog, XmNapplyCallback, @dialog_apply_callback, nil);
    XtAddCallback(dialog, XmNnoMatchCallback, @dialog_callback, nil);
    XmStringFree(t);
    for i := 0 to len - 1 do begin
      XmStringFree(str[i]);
    end;

    XtManageChild(dialog);

    XtPopup(XtParent(dialog), XtGrabNone);
  end;

  procedure Quit(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    halt;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, button, rc: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rc := XtVaCreateWidget('rowcolumn', xmRowColumnWidgetClass, toplevel, nil);

    button := XtVaCreateManagedWidget(monath_items.label_, xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button, XmNactivateCallback, @pushed, @monath_items);

    button := XtVaCreateManagedWidget(days_items.label_, xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button, XmNactivateCallback, @pushed, @days_items);

    button := XtVaCreateManagedWidget('Beenden', xmPushButtonWidgetClass, rc, nil);
    XtAddCallback(button, XmNactivateCallback, @Quit, nil);

    XtManageChild(rc);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
