program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

  procedure pushed(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmPushButtonCallbackStruct;
    buf: array[0..1] of char;
    str1: TXmString;
  begin
    cbs := PXmPushButtonCallbackStruct(call_data);
    if (cbs^.event^.xbutton.state and ShiftMask) <> 0 then begin
      buf[0] := 'O'; // Bei Shift-Taste
    end else begin
      buf[0] := 'X';
    end;
    buf[1] := #0;
    str1 := XmStringCreateLocalized(buf);
    XtVaSetValues(w, XmNlabelString, str1, nil);
    XmStringFree(str1);
  end;

  procedure main(argc: longint; argv: PPChar);
  const
    MARGINE = 5;
  var
    parent, toplevel, w: TWidget;
    app: TXtAppContext;
    x, y: integer;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    parent := XtVaCreateManagedWidget('mainform', xmFormWidgetClass, toplevel,
      XmNfractionBase, 3,
      nil);

    for x := 0 to 2 do begin
      for y := 0 to 2 do begin
        w := XtVaCreateManagedWidget('   ', xmPushButtonWidgetClass, parent,

          XmNbottomOffset, MARGINE,
          XmNleftOffset, MARGINE,
          XmNtopOffset, MARGINE,
          XmNrightOffset, MARGINE,

          XmNtopAttachment, XmATTACH_POSITION,
          XmNtopPosition, y,
          XmNleftAttachment, XmATTACH_POSITION,
          XmNleftPosition, x,
          XmNrightAttachment, XmATTACH_POSITION,
          XmNrightPosition, x + 1,
          XmNbottomAttachment, XmATTACH_POSITION,
          XmNbottomPosition, y + 1,
          nil);
        XtAddCallback(w, XmNactivateCallback, @pushed, nil);
      end;
    end;

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
