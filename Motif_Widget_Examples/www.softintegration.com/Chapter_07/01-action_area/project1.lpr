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

type
  TActionAreaItem = record
    label_: PChar;
    callback: TXtCallbackProc;
    Data: TXtPointer;
  end;
  PActionAreaItem = ^TActionAreaItem;



  procedure activate_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmAnyCallbackStruct;
    action_area, dflt: TWidget;
  begin
    WriteLn('activate');
    cbs := PXmAnyCallbackStruct(call_data);
    action_area := TWidget(client_data);

    XtVaGetValues(action_area, XmNdefaultButton, @dflt, nil);
    if dflt <> nil then begin
      XtCallActionProc(dflt, 'ArmAndActivate', cbs^.event, nil, 0);
    end;
  end;

  procedure ok_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    text_w: TWidget;
    cbs: PXmAnyCallbackStruct;
    Text: PChar;
  begin
    text_w := TWidget(client_data);
    //    cbs := PXmAnyCallbackStruct(call_data);
    Text := XmTextFieldGetString(text_w);
    WriteLn('String = ', Text);
    XtFree(Text);
  end;

  procedure clear_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    text_w: TWidget;
    cbs: PXmAnyCallbackStruct;
  begin
    text_w := TWidget(client_data);
    //    cbs := PXmAnyCallbackStruct(call_data);
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
    string_: TString;
  begin
    string_ := TString(client_data);
    WriteLn(string_);
  end;

  procedure DestroyWidget(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

  function CreateActionArea(parent: TWidget; actions: PActionAreaItem; num_actions: integer): TWidget;
  const
    TIGHTNESS = 20;
  var
    action_area, widget: TWidget;
    i, lAtt, rAtt: integer;
    h, Height: TDimension;
  begin
    action_area := XtVaCreateWidget('action_area', xmFormWidgetClass, parent,
      XmNfractionBase, TIGHTNESS * num_actions - 1,
      XmNleftOffset, 10,
      XmNrightOffset, 10,
      nil);
    for i := 0 to num_actions - 1 do begin
      if i <> 0 then  begin
        lAtt := XmATTACH_POSITION;
      end else begin
        lAtt := XmATTACH_FORM;
      end;
      if not (i = num_actions - 1) then begin
        rAtt := XmATTACH_POSITION;
      end else begin
        rAtt := XmATTACH_FORM;
      end;
      widget := XtVaCreateManagedWidget(actions[i].label_, xmPushButtonWidgetClass, action_area,
        XmNleftAttachment, lAtt,
        XmNleftPosition, TIGHTNESS * i,
        XmNtopAttachment, XmATTACH_FORM,
        XmNbottomAttachment, XmATTACH_FORM,
        XmNrightAttachment, rAtt,
        XmNrightPosition, TIGHTNESS * i + (TIGHTNESS - 1),
        XmNshowAsDefault, integer(i = 0),
        XmNdefaultButtonShadowThickness, 1,
        nil);
      if actions[i].callback <> nil then begin
        XtAddCallback(widget, XmNactivateCallback, actions[i].callback, actions[i].Data);
      end;
      if i = 0 then  begin
        XtVaGetValues(action_area, XmNmarginHeight, @h, nil);
        XtVaGetValues(widget, XmNheight, @Height, nil);
        Inc(Height, 2 * h);
        XtVaSetValues(action_area,
          XmNdefaultButton, widget,
          XmNpaneMaximum, Height,
          XmNpaneMinimum, Height,
          nil);
      end;
    end;

    XtManageChild(action_area);
    Result := action_area;
  end;

  procedure do_dialog(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  const
    Hilfe_Text: array[0..30] of char = 'Hier sollte eine Hilfe kommen !';

    action_items: array[0..3] of TActionAreaItem = (
      (label_: 'OK'; callback: @ok_pushed; Data: nil),
      (label_: 'Clear'; callback: @clear_pushed; Data: nil),
      (label_: 'Cancel'; callback: @close_dialog; Data: nil),
      (label_: 'Help'; callback: @help; Data: @Hilfe_Text));
  var
    dialog, pane, rc, text_w, action_a: TWidget;
    string_: TXmString;
  begin

    dialog := XtVaCreatePopupShell('dialog', xmDialogShellWidgetClass, XtParent(w),
      XmNtitle, 'Dialog Shell',
      XmNdeleteResponse, XmDESTROY, nil);

    action_items[2].Data := TXtPointer(dialog);

    pane := XtVaCreateWidget('pane', xmPanedWindowWidgetClass, dialog,
      XmNsashWidth, 1,
      XmNsashHeight, 1, nil);

    rc := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, pane, nil);
    string_ := XmStringCreateLocalized('Type Something:');
    XtVaCreateManagedWidget('label', xmLabelGadgetClass, rc,
      XmNlabelString, string_, nil);
    XmStringFree(string_);

    text_w := XtVaCreateManagedWidget('text-field', xmTextFieldWidgetClass, rc, nil);

    XtManageChild(rc);

    action_items[0].Data := TXtPointer(text_w);
    action_items[1].Data := TXtPointer(text_w);

    //        action_a:=CreateActionArea(pane,@action_items,XtNumber(action_items));
    action_a := CreateActionArea(pane, action_items, Length(action_items));
    XtAddCallback(text_w, XmNactivateCallback, @activate_cb, action_a);

    XtManageChild(pane);
    XtPopup(dialog, XtGrabNone);
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
