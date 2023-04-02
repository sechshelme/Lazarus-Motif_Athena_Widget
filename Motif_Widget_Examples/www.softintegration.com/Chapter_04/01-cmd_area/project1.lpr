program project1;

uses
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
    Writeln('Hello Yourself!');
  end;

  procedure main(argc:Longint;argv:PPChar);
  var
    top, main_w, menubar, menu, text_w: TWidget;
    app: TXtAppContext;
    file1, quit1: TXmString;
    args: array[0..4] of TArg;
  begin
    XtSetLanguageProc(nil, nil, nil);

    top := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_w', xmMainWindowWidgetClass, top, XmNcommandWindowLocation, XmCOMMAND_BELOW_WORKSPACE, nil);

    file1 := XmStringCreateLocalized('File');
    menubar:=XmVaCreateSimpleMenuBar(main_w,'menubar',XmVaCASCADEBUTTON,file1,'F',nil);
    XmStringFree(file1);

    quit1 := XmStringCreateLocalized('Quit');
    menu:=XmVaCreateSimpleMenuBar(menubar,'file_menu',0,@Press_Exit,XmVaPUSHBUTTON,quit1 ,'Q',nil,nil,nil);
    XmStringFree(quit1);

    XtManageChild(menubar);

    XtSetArg(args[0],XmNrows,24);
    XtSetArg(args[1],XmNcolumns,80);
    XtSetArg(args[2],XmNeditable,False);
    XtSetArg(args[3],XmNeditMode,XmMULTI_LINE_EDIT);

    text_w:=XmCreateScrolledText(main_w,'text_w',args,4);
    XtManageChild(text_w);

    //////// Hier fehlt was !



    XtRealizeWidget(top);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
