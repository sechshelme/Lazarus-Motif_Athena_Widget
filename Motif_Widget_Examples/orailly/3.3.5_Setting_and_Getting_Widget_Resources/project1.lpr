program project1;

uses
  XmPushB,
  XmXm,
  XmXmStrDefs,
  XmRowColumn,
  XmLabel,
  XTComposite,
  XTIntrinsic;

  procedure button_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Writeln('Hello Yourself!');
  end;

const
  fallback: array of PChar = (
    'Demos*background: gray',
    'Demos*pushme.fontList: -*-courier-medium-r-*--12-*',
    '*pushme.width:   250',
    '*pushme.height:  100',
    '*rc.label.foreground: red',
    nil);

  procedure main(argc: longint; argv: PPChar);
  const
    labels: array of PChar = ('A Label', 'Another Label', 'Yet a third');
  var
    toplevel, button, rc, widget: TWidget;
    app: TXtAppContext;
    label1, xm_label: TXmString;
    args: array [0..4] of TArg;
    i: integer;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, PPChar(fallback), nil);

    rc := XtVaCreateWidget('rc', xmRowColumnWidgetClass, toplevel, nil);

    label1 := XmStringCreateLocalized('Push here to say hello');
    button := XtVaCreateManagedWidget('pushme', xmPushButtonWidgetClass, rc, XmNlabelString, label1,
      XtVaTypedArg, XmNbackground, XmRString, 'red', strlen('red') + 1,
      nil);
    XmStringFree(label1);

    XtSetArg(args[0], XmNwidth, 50);
    XtSetArg(args[1], XmNheight, 50);

    for i := 0 to Length(labels) - 1 do begin
      xm_label := XmStringCreateLocalized(labels[i]);
      XtSetArg(args[2], XmNlabelString, xm_label);
      widget := XtCreateManagedWidget('label', xmLabelWidgetClass, rc, args, 3);
      XmStringFree(xm_label);
    end;

    XtManageChild(rc);

    XtAddCallback(button, XmNactivateCallback, @button_pushed, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
