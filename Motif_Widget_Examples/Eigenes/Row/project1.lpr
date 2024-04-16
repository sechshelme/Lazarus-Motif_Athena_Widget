program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

  procedure Click_Button(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    s: string;
  begin
    s := PString(client_data)^;
    WriteLn(s);

  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, parent, btn: TWidget;
    app: TXtAppContext;
    i: integer;

  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    parent := XtVaCreateManagedWidget('rowcolumn', xmRowColumnWidgetClass, toplevel,
      XmNpacking, XmPACK_COLUMN,
      XmNnumColumns, 3,
//      XmNmargin,200,
//      XmNhorizontalSpacing, 50,
      XmNspacing,50,
  //    XmNverticalSpacing, 5,
//      XmNorientation, XmVERTICAL,

      XmNbuttonCount,4,
      nil);

    for i := 0 to 13 do begin
      btn := XtVaCreateManagedWidget('button', xmPushButtonWidgetClass, parent,
      XmNmarginTop,20,
      XmNmarginBottom,20,
      XmNmarginLeft,50,
      XmNmarginRight,50,
      nil);
    end;

    XtManageChild(parent);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
