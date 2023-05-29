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

  procedure file_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin

  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, menubar, menu_file: TWidget;
    app: TXtAppContext;
    file_s, edit_s, help_s, open_s, save_s, quit_s, quit_acc_s: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_window', xmRowColumnWidgetClass, toplevel, nil);

    file_s := XmStringCreateLocalized('File');
    edit_s := XmStringCreateLocalized('Edit');
    help_s := XmStringCreateLocalized('Help');

    menubar := XmVaCreateSimpleMenuBar(main_w, 'menubar',
      XmVaCASCADEBUTTON, file_s, 'F',
      XmVaCASCADEBUTTON, edit_s, 'E',
      XmVaCASCADEBUTTON, help_s, 'H',
      nil);

    XmStringFree(file_s);
    XmStringFree(edit_s);
    XmStringFree(help_s);

    open_s := XmStringCreateLocalized('Open...');
    save_s := XmStringCreateLocalized('Save...');
    quit_s := XmStringCreateLocalized('Quit');
    quit_acc_s := XmStringCreateLocalized('Ctrl-C');

    menu_file := XmVaCreateSimplePulldownMenu(menubar, 'file_menu', 0, @file_cb,
      XmVaPUSHBUTTON, open_s, 'O', nil, nil,
      XmVaPUSHBUTTON, save_s, 'S', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, quit_acc_s, 'Q', 'Ctrl<Key>c', quit_acc_s,
      nil);

    XmStringFree(open_s);
    XmStringFree(save_s);
    XmStringFree(quit_s);
    XmStringFree(quit_acc_s);

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
