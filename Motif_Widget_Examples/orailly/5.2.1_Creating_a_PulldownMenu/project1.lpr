program project1;

uses
  ctypes,
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

  function CreateToggleMenu(menubar: TWidget; nr: cint): TWidget;
  var
    b1, b2, b3, b4: TXmString;
  begin
    b1 := XmStringCreateLocalized('Toggle 1');
    b2 := XmStringCreateLocalized('Toggle 2');
    b3 := XmStringCreateLocalized('Toggle 3');
    b4 := XmStringCreateLocalized('Toggle 4');
    Result := XmVaCreateSimplePulldownMenu(menubar, 'file_menu', nr, @file_cb,
      XmVaTOGGLEBUTTON, b1, '1', nil, nil,
      XmVaTOGGLEBUTTON, b2, '2', nil, nil,
      XmVaTOGGLEBUTTON, b3, '3', nil, nil,
      XmVaTOGGLEBUTTON, b4, '4', nil, nil,
      nil);

    XmStringFree(b1);
    XmStringFree(b2);
    XmStringFree(b3);
    XmStringFree(b4);
  end;

  function CreateCheckMenu(menubar: TWidget; nr: cint): TWidget;
  var
    b1, b2, b3, b4: TXmString;
  begin
    b1 := XmStringCreateLocalized('Check 1');
    b2 := XmStringCreateLocalized('Check 2');
    b3 := XmStringCreateLocalized('Check 3');
    b4 := XmStringCreateLocalized('Check 4');
    Result := XmVaCreateSimplePulldownMenu(menubar, 'file_menu', nr, @file_cb,
      XmVaCHECKBUTTON, b1, '1', nil, nil,
      XmVaCHECKBUTTON, b2, '2', nil, nil,
      XmVaCHECKBUTTON, b3, '3', nil, nil,
      XmVaCHECKBUTTON, b4, '4', nil, nil,
      nil);

    XmStringFree(b1);
    XmStringFree(b2);
    XmStringFree(b3);
    XmStringFree(b4);
  end;

  function CreateRadioMenu(menubar: TWidget; nr: cint): TWidget;
  var
    b1, b2, b3, b4: TXmString;
  begin
    b1 := XmStringCreateLocalized('Radio 1');
    b2 := XmStringCreateLocalized('Radio 2');
    b3 := XmStringCreateLocalized('Radio 3');
    b4 := XmStringCreateLocalized('Radio 4');
    Result := XmVaCreateSimplePulldownMenu(menubar, 'file_menu', nr, @file_cb,
      XmVaRADIOBUTTON, b1, '1', nil, nil,
      XmVaRADIOBUTTON, b2, '2', nil, nil,
      XmVaRADIOBUTTON, b3, '3', nil, nil,
      XmVaRADIOBUTTON, b4, '4', nil, nil,
      nil);

    XmStringFree(b1);
    XmStringFree(b2);
    XmStringFree(b3);
    XmStringFree(b4);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, menubar, menu_file, menu_toggle, menu_Check,
      menu_Radio: TWidget;
    app: TXtAppContext;
    file_s, edit_s, help_s, open_s, save_s, quit_s, quit_acc_s,
    toggle_s, check_s, radion_s: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_window', xmRowColumnWidgetClass, toplevel, nil);

    file_s := XmStringCreateLocalized('File');
    edit_s := XmStringCreateLocalized('Edit');
    toggle_s := XmStringCreateLocalized('Toggle');
    check_s := XmStringCreateLocalized('Check');
    radion_s := XmStringCreateLocalized('Radio');
    help_s := XmStringCreateLocalized('Help');

    menubar := XmVaCreateSimpleMenuBar(main_w, 'menubar',
      XmVaCASCADEBUTTON, file_s, 'F',
      XmVaCASCADEBUTTON, edit_s, 'E',
      XmVaCASCADEBUTTON, toggle_s, 'T',
      XmVaCASCADEBUTTON, check_s, 'C',
      XmVaCASCADEBUTTON, radion_s, 'R',
      XmVaCASCADEBUTTON, help_s, 'H',
      nil);

    XmStringFree(file_s);
    XmStringFree(edit_s);
    XmStringFree(toggle_s);
    XmStringFree(check_s);
    XmStringFree(radion_s);
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

    menu_toggle := CreateToggleMenu(menubar, 2);
    menu_Check := CreateCheckMenu(menubar, 3);
    menu_Radio := CreateRadioMenu(menubar, 4);

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
