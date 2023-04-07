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

const
  YES = 1;
  NO = 2;

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

  function AskUsr(parent: TWidget; question:PChar): integer;
  const
    dialog: TWidget = nil;
  var
    answer, dlgBtn: integer;
    yes1, no1, text1: TXmString;
  begin
    if dialog = nil then  begin
      dialog := XmCreateQuestionDialog(parent, 'dialog', nil, 0);
      yes1 := XmStringCreateLocalized('Ja');
      no1 := XmStringCreateLocalized('Nein');

      XtVaSetValues(dialog,
      XmNdialogStyle,XmDIALOG_FULL_APPLICATION_MODAL,
        XmNokLabelString, yes1,
        XmNcancelLabelString, no1,        nil);

      XtSetSensitive(XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON), False);
      XtAddCallback(dialog, XmNokCallback, @response, @answer);
      XtAddCallback(dialog, XmNcancelCallback, @response, @answer);
      XmStringFree(yes1);
      XmStringFree(no1);
    end;
    answer := 0;
    text1 := XmStringCreateLocalized(question);
    XtVaSetValues(dialog,XmNmessageString,text1,nil);
    XmStringFree(text1);

    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
    while answer = 0 do begin
      XtAppProcessEvent(app, XtIMAll);
    end;

    XtPopdown(XtParent(dialog));

    Result := answer;
  end;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    question: PChar;
  begin
    question := PChar(client_data);

    if AskUsr(w, question) = YES then begin
      WriteLn('Ja');
    end else begin
      WriteLn('Nein');
    end;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, button: TWidget;
    label1: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    label1 := XmStringCreateLocalized('/bin/rm *');
    button := XtVaCreateManagedWidget('button', xmPushButtonWidgetClass, toplevel,
      XmNlabelString, label1, nil);
    XtAddCallback(button, XmNactivateCallback, @pushed, PChar('Remove Everything ?'));
    XmStringFree(label1);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
