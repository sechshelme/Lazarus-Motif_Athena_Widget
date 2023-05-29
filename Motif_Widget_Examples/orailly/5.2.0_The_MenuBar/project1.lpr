program project1;

uses
  x,
  xlib,
  XmPushB,
  XmXm,
  XmXmStrDefs,
  XmRowColumn,
  XmLabel,
  XmMainW,
  XmList,
  XTComposite,
  XTIntrinsic;

  procedure button_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Writeln('Hello Yourself!');
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, menubar: TWidget;
    app: TXtAppContext;
    file_s, edit_s, help_s: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_window', xmRowColumnWidgetClass, toplevel, nil);

    file_s:=XmStringCreateLocalized('File');
    edit_s:=XmStringCreateLocalized('Edit');
    help_s:=XmStringCreateLocalized('Help');

    menubar:=XmVaCreateSimpleMenuBar(main_w,'menubar',
    XmVaCASCADEBUTTON,file_s,'F',
    XmVaCASCADEBUTTON,edit_s,'E',
    XmVaCASCADEBUTTON,help_s,'H',
    nil);

    XmStringFree(file_s);
    XmStringFree(edit_s);
    XmStringFree(help_s);


    XtManageChild(menubar);

    XtVaSetValues(main_w,
//      XmNworkWindow, XtParent(list_w),
      nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
