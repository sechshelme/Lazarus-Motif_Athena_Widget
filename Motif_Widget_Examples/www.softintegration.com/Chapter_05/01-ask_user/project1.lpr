program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

type
  PQandA = ^TQandA;

  TQandA = record
    label_, question, yes, no: PChar;
    dflt: integer;
    cmd: PChar;
  end;

const
  YES = 1;
  NO = 2;
  touch_foo: TQandA = (label_: 'Create'; question: 'Create /tmp/foo ?'; yes: 'Ja'; no: 'Nein'; dflt: YES; cmd: 'touch /tmp/foo');
  rm_foo: TQandA = (label_: 'Remove'; question: 'Remove /tmp/foo ?'; yes: 'Ja'; no: 'Nein'; dflt: NO; cmd: 'rm /tmp/foo');

var
  app: TXtAppContext;

  procedure response(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    answer: PInteger;
    cbs: PXmAnyCallbackStruct;
  begin
    answer := PInteger(client_data);
    cbs := PXmAnyCallbackStruct(call_data);
    case cbs^.reason of
      XmCR_OK: begin
        answer^ := YES;
      end;
      XmCR_CANCEL: begin
        answer^ := NO;
      end;
    end;
  end;

  function AskUsr(parent: TWidget; question, ans1, ans2: PChar; default_ans: integer): integer;
  const
    dialog: TWidget = nil;
  var
    answer, dlgBtn: integer;
    text1, yes1, no1, help1: TXmString;
  begin
    if dialog = nil then  begin
      dialog := XmCreateQuestionDialog(parent, 'dialog', nil, 0);
      XtVaSetValues(dialog, XmNdialogStyle, XmDIALOG_FULL_APPLICATION_MODAL, nil);
      XtSetSensitive(XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON), False);
      XtAddCallback(dialog, XmNokCallback, @response, @answer);
      XtAddCallback(dialog, XmNcancelCallback, @response, @answer);
    end;
    answer := 0;
    text1 := XmStringCreateLocalized(question);
    yes1 := XmStringCreateLocalized(ans1);
    no1 := XmStringCreateLocalized(ans2);
    help1 := XmStringCreateLocalized('Hilfe...');
    if default_ans = YES then  begin
      dlgBtn := XmDIALOG_OK_BUTTON;
    end else begin
      dlgBtn := XmDIALOG_CANCEL_BUTTON;
    end;
    XtVaSetValues(dialog,
      XmNmessageString, text1,
      XmNokLabelString, yes1,
      XmNcancelLabelString, no1,
      XmNhelpLabelString, help1,
      XmNdefaultButtonType, dlgBtn, nil);
    XmStringFree(text1);
    XmStringFree(yes1);
    XmStringFree(no1);
    XmStringFree(help1);
    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
    while answer = 0 do begin
      XtAppProcessEvent(app, XtIMAll);
    end;

    XtPopdown(XtParent(dialog));
    XSync(XtDisplay(dialog), 0);
    XmUpdateDisplay(parent);

    Result := answer;
  end;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    quest: PQandA;
  begin
    quest := PQandA(client_data);
    if AskUsr(w, quest^.question, quest^.yes, quest^.no, quest^.dflt) = YES then begin
      WriteLn('Executing: ', quest^.cmd);
      fpSystem(quest^.cmd);
    end else begin
      WriteLn('Not executing: ', quest^.cmd);
    end;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcolumn, button: TWidget;
    label1: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rowcolumn := XtVaCreateManagedWidget('rowcolum', xmRowColumnWidgetClass, toplevel, nil);

    label1 := XmStringCreateLocalized(touch_foo.label_);
    button := XtVaCreateManagedWidget('button', xmPushButtonWidgetClass, rowcolumn,
      XmNlabelString, label1, nil);
    XtAddCallback(button, XmNactivateCallback, @pushed, @touch_foo);
    XmStringFree(label1);

    label1 := XmStringCreateLocalized(rm_foo.label_);
    button := XtVaCreateManagedWidget('button', xmPushButtonWidgetClass, rowcolumn,
      XmNlabelString, label1, nil);
    XtAddCallback(button, XmNactivateCallback, @pushed, @rm_foo);
    XmStringFree(label1);

    XtManageChild(rowcolumn);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
