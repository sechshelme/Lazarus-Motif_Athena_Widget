program project1;

uses
  heaptrc,
  Strings,
  ctypes,
  xlib,
  x,
  Xm, XT;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, list_w: TWidget;
    app: TXtAppContext;
  const
    ListData = 'Montag, Dienstag, Mittwoch, Donnerstag, Freitag, Samstag, Sonntag';
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_window', xmMainWindowWidgetClass, toplevel, nil);

    list_w := XmCreateScrolledList(main_w, 'main_list', nil, 0);

    XtVaSetValues(list_w,
      XtVaTypedArg, XmNitems,
      XmRString, ListData, 53,
      XmNitemCount, 7,
      XmNvisibleItemCount, 5, nil);

    XtManageChild(list_w);

    XtVaSetValues(main_w, XmNworkWindow, XtParent(list_w), nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
