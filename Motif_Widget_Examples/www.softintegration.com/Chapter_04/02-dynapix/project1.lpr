program project1;

uses
  heaptrc,
  Strings,
  xlib,
  x,
  XmXm,
  XmXmStrDefs,
  XmPushB,
  XmMainW,
  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

  procedure Press_Exit(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

  procedure file_cb(para1: TWidget; para2: TXtPointer; para3: TXtPointer); cdecl;
  begin

  end;

  procedure change_color(para1: TWidget; para2: TXtPointer; para3: TXtPointer); cdecl;
  begin

  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, menubar, menu, text_w, command_w, widget: TWidget;
    app: TXtAppContext;
    file1, quit1, edit1, help1, open1, black1, red1, green1, blue1: TXmString;
    args: array[0..4] of TArg;
  const
    collors: array[0..3] of PChar = ('Black', 'Red', 'Green', 'Blue');
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_window', xmMainWindowWidgetClass, toplevel, XmNscrollBarDisplayPolicy, XmAS_NEEDED, XmNscrollingPolicy, XmAUTOMATIC, nil);

    file1 := XmStringCreateLocalized('File');
    edit1 := XmStringCreateLocalized('Edit');
    help1 := XmStringCreateLocalized('Help');

    menubar := XmVaCreateSimpleMenuBar(main_w, 'menubar', XmVaCASCADEBUTTON, file1, 'F', XmVaCASCADEBUTTON, edit1, 'E', XmVaCASCADEBUTTON, help1, 'H', nil);
    XmStringFree(file1);
    XmStringFree(edit1);

    if widget = XtNameToWidget(menubar, 'buton_2') then begin
      XtVaSetValues(menubar, XmNmenuHelpWidget, widget, nil);
    end;

    open1 := XmStringCreateLocalized('Open...');
    quit1 := XmStringCreateLocalized('Quit');
    menu := XmVaCreateSimplePulldownMenu(menubar, 'file_menu', 0, @file_cb,
      XmVaPUSHBUTTON, open1, 'N', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, quit1, 'Q', nil, nil, nil);
    XmStringFree(open1);
    XmStringFree(quit1);

    black1 := XmStringCreateLocalized(collors[0]);
    red1 := XmStringCreateLocalized(collors[1]);
    green1 := XmStringCreateLocalized(collors[2]);
    blue1 := XmStringCreateLocalized(collors[3]);

    menu := XmVaCreateSimplePulldownMenu(menubar, 'edit_menu', 1, @change_color,
      XmVaRADIOBUTTON, black1, 'k', nil, nil,
      XmVaRADIOBUTTON, red1, 'R', nil, nil,
      XmVaRADIOBUTTON, green1, 'G', nil, nil,
      XmVaRADIOBUTTON, blue1, 'B', nil, nil,
      XmNradioBehavior, True,
      XmNradioAlwaysOne, True, nil);


    XmStringFree(black1);
    XmStringFree(red1);
    XmStringFree(green1);
    XmStringFree(blue1);



    XtManageChild(menubar);

    XtSetArg(args[0], XmNrows, 24);
    XtSetArg(args[1], XmNcolumns, 80);
    XtSetArg(args[2], XmNeditable, False);
    XtSetArg(args[3], XmNeditMode, XmMULTI_LINE_EDIT);

    text_w := XmCreateScrolledText(main_w, 'text_w', args, 4);
    XtManageChild(text_w);

    XtVaSetValues(menu, XmNuserData, text_w, nil);

    file1 := XmStringCreateLocalized('Command');
    command_w := XtVaCreateWidget('command_w', xmCommandWidgetClass, main_w, XmNpromptString, file1, nil);
    XtManageChild(command_w);
    XmStringFree(file1);

    //    XtAddCallback(command_w, XmNcommandEnteredCallback, @exec_cmd, text_w);

    XmMainWindowSetAreas(main_w, menubar, command_w, nil, nil, XtParent(text_w));
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
