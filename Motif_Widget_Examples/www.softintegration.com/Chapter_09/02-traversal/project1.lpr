program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

  procedure travers(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmTraverseObscuredCallbackStruct;
  begin
    cbs := PXmTraverseObscuredCallbackStruct(call_data);
    XmScrollVisible(w, cbs^.traversal_destination, 100, 100);
    WriteLn('1234');
  end;

  procedure Btn_press(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    nr: PtrInt;
  begin
    nr := PtrInt(client_data);
    WriteLn('Button: ', nr, ' gedrückt');
  end;

  procedure main(argc: longint; argv: PPChar);
  const
    Count = 16;
  var
    app: TXtAppContext;
    toplevel, sw, rc, btn: TWidget;
    i: PtrInt;
    Name: string;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    sw := XtVaCreateManagedWidget('scrolled_w', xmScrolledWindowWidgetClass, toplevel,
      XmNscrollingPolicy, XmAUTOMATIC,
      nil);

    XtAddCallback(sw, XmNtraverseObscuredCallback, @travers, nil);

    rc := XtVaCreateWidget('rc', xmRowColumnWidgetClass, sw,
      XmNorientation, XmHORIZONTAL,
      XmNpacking, XmPACK_COLUMN,
      XmNnumColumns, Count,
      nil);

    for i := 0 to Count - 1 do begin
      WriteStr(Name, 'Toggle ', i);
      XtVaCreateManagedWidget(PChar(Name), xmToggleButtonWidgetClass, rc, nil);
      WriteStr(Name, 'TButton ', i);
      btn := XtVaCreateManagedWidget(PChar(Name), xmPushButtonWidgetClass, rc, nil);
      XtAddCallback(btn, XmNactivateCallback, @Btn_press, Pointer(i));
    end;

    XtManageChild(rc);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
