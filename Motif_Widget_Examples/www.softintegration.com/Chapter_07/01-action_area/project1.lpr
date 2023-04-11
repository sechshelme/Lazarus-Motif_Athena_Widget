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
    callback: Pointer;
    data: TXtPointer;
  end;
  PActionAreaItem=^TActionAreaItem;



procedure activate_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
begin

end;

procedure ok_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
begin

end;

procedure clear_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
begin

end;

  procedure close_dialog(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin

  end;

  procedure help(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin

  end;

  procedure DestroyWidget(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

function CreateActionArea(paren: TWidget; actions:PActionAreaItem; num_actions:Integer):TWidget;
begin

end;

  procedure do_dialog(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    dialog, pane, rc, text_w, action_a: TWidget;
    string_: TXmString;
  const
    action_items: array[0..3] of TActionAreaItem = (
      (label_: 'OK'; callback: @ok_pushed; Data: nil),
      (label_: 'Clear'; callback: @clear_pushed; Data: nil),
      (label_: 'Cancel'; callback: @close_dialog; Data: nil),
      (label_: 'Help'; callback: @help; Data: nil));
  begin

    dialog := XtVaCreatePopupShell('dialog', xmDialogShellWidgetClass, XtParent(w),
      XmNtitle, 'Dialog Shell',
      XmNdeleteResponse, XmDESTROY, nil);

    action_items[2].data:=TXtPointer(dialog);

    pane:=XtVaCreateWidget('pane',xmPanedWindowWidgetClass,dialog,
    XmNsashWidth,1,
    XmNsashHeight,1,nil);

        rc := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, pane, nil);
        string_:=XmStringCreateLocalized('Type Something:');
        XtVaCreateManagedWidget('label',xmLabelGadgetClass,rc,
        XmNlabelString,string_,nil);
        XmStringFree(string_);

        text_w:=XtVaCreateManagedWidget('text-field',xmTextFieldWidgetClass,rc,nil);

        XtManageChild(rc);

        action_items[0].data:=TXtPointer(text_w);
        action_items[1].data:=TXtPointer(text_w);

//        action_a:=CreateActionArea(pane,@action_items,XtNumber(action_items));
        action_a:=CreateActionArea(pane,action_items,Length(action_items));

        XtAddCallback(text_w,XmNactivateCallback,@activate_cb, action_a);

        XtManageChild(pane);
        XtPopup(dialog,XtGrabNone);
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
