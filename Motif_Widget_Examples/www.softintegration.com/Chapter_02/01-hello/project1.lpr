program project1;

uses
  xlib,
  x,
  XmPushB,
  XmXm,
  XmXmStrDefs,
  XTIntrinsic;

  procedure button_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Writeln('Hello Yourself!');
  end;

  procedure main;
  var
    toplevel, button: TWidget;
    app: TXtAppContext;
    label1: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Hello', nil, 0, @argc, argv, nil, nil);

    label1 := XmStringCreateLocalized('Push here to say hello');
    button := XtVaCreateManagedWidget('pushme', xmPushButtonWidgetClass, toplevel, XmNlabelString, label1, nil);
    XmStringFree(label1);

    XtAddCallback(button, XmNactivateCallback, @button_pushed, nil);


    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main;
end.
