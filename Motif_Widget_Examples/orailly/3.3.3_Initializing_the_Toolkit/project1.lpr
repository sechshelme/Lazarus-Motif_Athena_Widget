program project1;

uses
  Xm, XT;

  procedure button_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Writeln('Hello Yourself!');
  end;

const
  fallback: array of PChar = (
    'Demos*background: gray',
    'Demos*pushme.fontList: -*-courier-medium-r-*--12-*',
 //   'Demos*XmText.fontList: -*-courier-medium-r-*--12-*',
    nil);

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, button: TWidget;
    app: TXtAppContext;
    label1: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, PPChar(fallback), nil);

    label1 := XmStringCreateLocalized('Push here to say hello');
    button := XtVaCreateManagedWidget('pushme', xmPushButtonWidgetClass, toplevel, XmNlabelString, label1, nil);
    XmStringFree(label1);

    XtAddCallback(button, XmNactivateCallback, @button_pushed, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
