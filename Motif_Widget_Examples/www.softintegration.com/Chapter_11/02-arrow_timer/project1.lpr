program project1;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

uses
  heaptrc,
  Unix,
  Strings,
  ctypes,
  xlib,
  x,
  xresource,
  XmXm,
  XmXmStrDefs,
  XmPushB,
  XmPushBG,
  XmMainW,
  XmRowColumn,
  XmMessageB,
  XmSelectioB,
  XmDialogS,
  XmPanedW,
  XmLabelG,
  XmTextF,
  XmForm,
  XmBulletinB,
  XmList,
  XmScrolledW,
  XmDrawingA,
  XmArrowBG,

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

type
  PValueRange = ^TValueRange;

  TValueRange = record
    Value, min, max: integer;
  end;
var
  arrow_timer_id: TXtIntervalId;
  label1: TWidget;
  app: TXtAppContext;

  procedure change_value(client_data: TXtPointer; id: PXtIntervalId); cdecl;
  var
    incr: PtrInt;
    range: PValueRange;
    buf: string;
    i: integer;
  begin
    incr := PtrInt(client_data);

    XtVaGetValues(label1, XmNuserData, @range, nil);

    if (range^.Value + incr > range^.max) or (range^.Value + incr < range^.min) then begin
      Exit;
    end;

    Inc(range^.Value, incr);
    WriteStr(buf, range^.Value);
    XtVaSetValues(label1, XtVaTypedArg, XmNlabelString, XmRString, PChar(buf), Length(buf), nil);

    if PtrInt(id) = 1 then begin
      i := 500;
    end else begin
      i := 100;
    end;
    arrow_timer_id := XtAppAddTimeOut(app, i, @change_value, TXtPointer(incr));
  end;


  procedure start_stop(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    incr: PtrInt;
    cbs: PXmArrowButtonCallbackStruct;
  begin
    incr := PtrInt(client_data);
    cbs := PXmArrowButtonCallbackStruct(call_data);

    if cbs^.reason = XmCR_ARM then begin
      change_value(Pointer(incr), Pointer(1));
    end else if cbs^.reason = XmCR_DISARM then begin
      XtRemoveTimeOut(arrow_timer_id);
    end;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol, w: TWidget;
    range: TValueRange;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      //      XmNwidth, 320,
      //      XmNheight, 200,
      nil);

    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      XmNorientation, XmHORIZONTAL,
      nil);

    w := XtVaCreateManagedWidget('arrow_up', xmArrowButtonGadgetClass, rowcol,
      XmNarrowDirection, XmARROW_UP,
      nil);
    XtAddCallback(w, XmNarmCallback, @start_stop, Pointer(1));
    XtAddCallback(w, XmNdisarmCallback, @start_stop, Pointer(1));

    w := XtVaCreateManagedWidget('arrow_up', xmArrowButtonGadgetClass, rowcol,
      XmNarrowDirection, XmARROW_DOWN,
      nil);
    XtAddCallback(w, XmNarmCallback, @start_stop, Pointer(-1));
    XtAddCallback(w, XmNdisarmCallback, @start_stop, Pointer(-1));

    range.Value := 0;
    range.min := -100;
    range.max := 10;

    label1 := XtVaCreateManagedWidget('label', xmLabelGadgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, '0   0', 3,
      XmNuserData, @range,
      nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
