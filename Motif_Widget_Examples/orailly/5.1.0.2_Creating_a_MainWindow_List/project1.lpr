program project1;

uses
  x,
  xlib,
  Xm, XT;

  procedure button_pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Writeln('Hello Yourself!');
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, list_w: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_window', xmRowColumnWidgetClass, toplevel, nil);

    list_w := XmCreateScrolledList(main_w, 'main_list', nil, 0);
    XtVaSetValues(list_w,
      XtVaTypedArg, XmNitems, XmRString, 'Red, Yellow, Green, Blue, Orange, Maroon, Grey, Black, White', 0,
      XmNitemCount, 8,
      XmNvisibleItemCount, 5,
      nil);
    XtManageChild(list_w);

    XtVaSetValues(main_w,
      XmNworkWindow, XtParent(list_w),
      nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
