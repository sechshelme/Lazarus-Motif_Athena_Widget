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

  procedure exec_cmd(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  const
    BUFSIZ = 8192;
  var
    cmd: PChar;
    buf: array [0..BUFSIZ - 1] of char;
    pos1: TXmTextPosition;
    text_w: TWidget;
    cbs: PXmCommandCallbackStruct;
  begin
    text_w := TWidget(client_data);
    cbs := PXmCommandCallbackStruct(call_data);
    XmStringGetLtoR(cbs^.Value, XmFONTLIST_DEFAULT_TAG, @cmd);
    if (cmd = nil) or (cmd^ = #0) then begin
      writeln('fdgfgfsdg');
      if cmd <> nil then begin
        XtFree(cmd);
      end;
      Exit;
    end;
    //    XmTextReplace(text_w, 0, 0, cmd);
    cmd := strcat(cmd, PChar(#10));
    XmTextInsert(text_w, -1, cmd);

    Write(cmd);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    top, main_w, menubar, menu, text_w, command_w: TWidget;
    app: TXtAppContext;
    file1, quit1: TXmString;
    args: array[0..4] of TArg;
  begin
    XtSetLanguageProc(nil, nil, nil);

    top := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_w', xmMainWindowWidgetClass, top, XmNcommandWindowLocation, XmCOMMAND_BELOW_WORKSPACE, nil);

    file1 := XmStringCreateLocalized('File');
    menubar := XmVaCreateSimpleMenuBar(main_w, 'menubar', XmVaCASCADEBUTTON, file1, 'F', nil);
    XmStringFree(file1);

    quit1 := XmStringCreateLocalized('Quit');
    menu := XmVaCreateSimplePulldownMenu(menubar, 'file_menu', 0, @Press_Exit, XmVaPUSHBUTTON, quit1, 'Q', nil, nil, nil);
    XmStringFree(quit1);

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

    XtAddCallback(command_w, XmNcommandEnteredCallback, @exec_cmd, text_w);

    XmMainWindowSetAreas(main_w, menubar, command_w, nil, nil, XtParent(text_w));
    XtRealizeWidget(top);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
