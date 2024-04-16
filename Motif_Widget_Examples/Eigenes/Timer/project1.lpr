program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

var
  app: TXtAppContext;
  timer_id: TXtIntervalId;
  btn_start, btn_stop: TWidget;


  procedure call_timer(para1: TXtPointer; para2: PXtIntervalId); cdecl;
  begin
    WriteLn('fertig');
    XtVaSetValues(btn_start,
      XmNsensitive, True,
      nil);
    XtVaSetValues(btn_stop,
      XmNsensitive, False,
      nil);
  end;

  procedure Timer_Start(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    timer_id := XtAppAddTimeOut(app, 3000, @call_timer, nil);
    WriteLn(timer_id);
    XtVaSetValues(btn_start,
      XmNsensitive, False,
      nil);
    XtVaSetValues(btn_stop,
      XmNsensitive, True,
      nil);
  end;

  procedure Timer_Stop(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    XtRemoveTimeOut(timer_id);
    XtVaSetValues(btn_start,
      XmNsensitive, True,
      nil);
    XtVaSetValues(btn_stop,
      XmNsensitive, False,
      nil);
  end;

  procedure main(argc: longint; argv: PPChar);
  const
    Count = 8;
  var
    toplevel, rc: TWidget;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rc := XtVaCreateManagedWidget('rc', xmRowColumnWidgetClass, toplevel,
      XmNorientation, XmHORIZONTAL,
      XmNpacking, XmPACK_COLUMN,
      XmNnumColumns, Count,
      nil);

    btn_start := XtVaCreateManagedWidget('Start Timer', xmPushButtonWidgetClass, rc,
      XmNbackground, $FF8888,
      XmNmarginHeight, 100,
      XmNmarginWidth, 160,
      nil);
    XtAddCallback(btn_start, XmNactivateCallback, @Timer_Start, nil);

    btn_stop := XtVaCreateManagedWidget('Stop Timer', xmPushButtonWidgetClass, rc,
      XmNbackground, $88FF88,
      XmNmarginHeight, 100,
      XmNmarginWidth, 160,
      //XmNtraversalOn,False,
      XmNsensitive, False,
      nil);
    XtAddCallback(btn_stop, XmNactivateCallback, @Timer_Stop, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
