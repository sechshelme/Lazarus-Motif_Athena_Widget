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
  XmSelectioB,
  XmDialogS,
  XmPanedW,
  XmLabelG,
  XmTextF,
  XmForm,

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

  procedure file_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer
    ); cdecl;
  begin

  end;

  procedure help_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer
    ); cdecl;
  begin

  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, rc, menubar, w: TWidget;
    cascade_btns: PWidget = nil;
    app: TXtAppContext;
    str1, str2, str3: TXmString;
    num_btns: integer;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateWidget('main_w', xmMainWindowWidgetClass, toplevel, nil);

    str1 := XmStringCreateLocalized('File');
    str2 := XmStringCreateLocalized('Help');

    menubar := XmVaCreateSimpleMenuBar(main_w, 'main_w',
      XmVaCASCADEBUTTON, str1, 'F',
      XmVaCASCADEBUTTON, str2, 'H',
      nil);

    XmStringFree(str1);
    XmStringFree(str2);

    str1 := XmStringCreateLocalized('New');
    str2 := XmStringCreateLocalized('Open');
    str3 := XmStringCreateLocalized('Quit');

    XmVaCreateSimplePulldownMenu(menubar, 'file_menu', 0, @file_cb,
      XmVaPUSHBUTTON, str1, 'N', nil, nil,
      XmVaPUSHBUTTON, str2, 'O', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, str3, 'Q', nil, nil,
      nil);

    XmStringFree(str1);
    XmStringFree(str2);
    XmStringFree(str3);

    str1 := XmStringCreateLocalized('On Context');
    str2 := XmStringCreateLocalized('On Window');
    str3 := XmStringCreateLocalized('Index');

    w := XmVaCreateSimplePulldownMenu(menubar, 'help_menu', 1, @help_cb,
      XmVaPUSHBUTTON, str1, 'C', nil, nil,
      XmVaPUSHBUTTON, str2, 'W', nil, nil,
      XmVaPUSHBUTTON, str3, 'I', nil, nil,
      nil);

    XmStringFree(str1);
    XmStringFree(str2);
    XmStringFree(str3);

    XtVaGetValues(menubar,
      XmNchildren, @cascade_btns,
      XmNnumChildren, @num_btns,
      nil);
    XtVaSetValues(menubar,
      XmNmenuHelpWidget, cascade_btns[num_btns - 1],
      nil);
    XtManageChild(menubar);

    rc := XtVaCreateWidget('rc', xmRowColumnWidgetClass, main_w, nil);
    str1 := XmStringCreateLtoR(#10'  This is an Empty'#10'Sample Control Area'#10, XmFONTLIST_DEFAULT_TAG);
    XtVaCreateManagedWidget('label', xmLabelGadgetClass, rc,
      XmNlabelString, str1,
      nil);

    XmStringFree(str1);
    XtManageChild(rc);
    XtManageChild(main_w);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
