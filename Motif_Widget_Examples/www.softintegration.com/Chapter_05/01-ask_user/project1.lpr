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
  touch_foo: TQandA = (label_: 'Create'; question: 'Create /tmp/foo ?'; yes: 'Yes'; no: 'No'; dflt: YES; cmd: 'touch /tmp/foo');
  rm_foo: TQandA = (label_: 'Remove'; question: 'Remove /tmp/foo ?'; yes: 'Yes'; no: 'No'; dflt: NO; cmd: 'rm /tmp/foo');

  function AskUsr(parent: TWidget; question, ans1, ans2: PChar; default_ans: integer): integer;
  const
    dialog: TWidget = nil;
  begin
    if dialog <> nil then  begin
      dialog := XmCreateQuestionDialog(parent, 'dialog', nil, 0);
    end;
  end;

  procedure pushed(widget: TWidget; para2: TXtPointer; para3: TXtPointer); cdecl;
  var
    quest: PQandA;
  begin
    quest := PQandA(para2);
    if AskUsr(widget, quest^.question, quest^.yes, quest^.no, quest^.dflt) = YES then begin
      WriteLn('Executing: ', quest^.cmd);
      fpSystem(quest^.cmd);

    end else begin
      WriteLn('Not executing: ', quest^.cmd);
    end;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcolumn, button: TWidget;
    app: TXtAppContext;
    label1: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rowcolumn := XtVaCreateManagedWidget('rowcolum', xmRowColumnWidgetClass, toplevel, XmNrowColumnType, XmHORIZONTAL, nil);
    //    rowcolumn := XtVaCreateManagedWidget('rowcolum', xmRowColumnWidgetClass, toplevel,XmNrowColumnType,XmWORK_AREA,XmNspacing,50, nil);
    //rowcolumn := XtVaCreateManagedWidget('rowcolum', xmRowColumnWidgetClass, toplevel,XmNrowColumnType,XmWORK_AREA,XmNresizeWidth,False, nil);

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

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
