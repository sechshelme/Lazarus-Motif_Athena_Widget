program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

const
  ROWS = 8;
  COLS = 10;

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
    i, j: integer;
    buf: array[0..ROWS - 1, 0..COLS - 1] of string;

  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    parent := XtVaCreateManagedWidget('rowcolumn', xmRowColumnWidgetClass, toplevel,
      XmNpacking, XmPACK_COLUMN,
      XmNnumColumns, COLS,
      XmNorientation, XmVERTICAL,
      nil);

    for i := 0 to COLS - 1 do begin
      for j := 0 to ROWS - 1 do begin
        WriteStr(buf[j, i], i + 1, '-', j + 1);
        if (i = 0) or (j = 0) then begin
          XtVaCreateManagedWidget(@buf[j, i][1], xmLabelGadgetClass, parent, nil);
        end else begin
          btn := XtVaCreateManagedWidget('', xmPushButtonWidgetClass, parent, nil);
          XtAddCallback(btn, XmNactivateCallback, @Click_Button, @buf[j, i]);
        end;
      end;
    end;

    XtManageChild(parent);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
