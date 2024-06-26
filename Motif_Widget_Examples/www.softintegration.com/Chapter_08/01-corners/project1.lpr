program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

const
  corners: array of PChar = ('Top, Left', 'Top Right', 'Bottom Left', 'Bottom Right');

  procedure resize(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  var
    children: TWidgetList;
    w_widht, w_height: TDimension;
    margin_w, margin_h: cshort;
    cevent: PXConfigureEvent;
    Width, Height: cint;
  begin
    cevent := PXConfigureEvent(event);
    Width := cevent^.Width;
    Height := cevent^.Height;

    XtVaGetValues(w,
      XmNchildren, @children,
      XmNmarginWidth, @margin_w,
      XmNmarginHeight, @margin_h,
      nil);

    XtVaSetValues(children[0],
      XmNx, margin_w, XmNy, margin_h,
      nil);

    XtVaGetValues(children[1], XmNwidth, @w_widht, nil);
    XtVaSetValues(children[1],
      XmNx, Width - margin_w - w_widht,
      XmNy, margin_h,
      nil);

    XtVaGetValues(children[2], XmNheight, @w_height, nil);
    XtVaSetValues(children[2],
      XmNx, margin_w,
      XmNy, Height - margin_h - w_height,
      nil);

    XtVaGetValues(children[3], XmNheight, @w_height, XmNwidth, @w_widht, nil);
    XtVaSetValues(children[3],
      XmNx, Width - margin_w - w_widht,
      XmNy, Height - margin_h - w_height,
      nil);
  end;

  procedure enter(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    XtVaSetValues(w, XmNbackground, $FF0000, nil);
    WriteLn('enter');
  end;

  procedure leave(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    XtVaSetValues(w, XmNbackground, $00FF00);
    WriteLn('leave');
  end;

  procedure test(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    WriteLn('test');
  end;

  procedure main(argc: longint; argv: PPChar);
  const
    rec: array of TXtActionsRec = nil;
  var
    toplevel, bboard: TWidget;
    app: TXtAppContext;
    i: integer;
    trans: TXtTranslations;

  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    bboard := XtVaCreateManagedWidget('bboard', xmBulletinBoardWidgetClass, toplevel, XmNx, 100, nil);

    SetLength(rec, 4);
    rec[0]._string := PChar('resize');
    rec[0].proc := @resize;
    rec[1]._string := PChar('enter');
    rec[1].proc := @enter;
    rec[2]._string := PChar('leave');
    rec[2].proc := @leave;
    rec[3]._string := PChar('test');
    rec[3].proc := @test;

    XtAppAddActions(app, @rec[0], Length(rec));
    trans := XtParseTranslationTable('<ConfigureNotify>: resize() '#10' <EnterNotify>: enter() '#10' <LeaveNotify>: leave() '#10' <Key>Return: test()');
    XtOverrideTranslations(bboard, trans);

    for i := 0 to Length(corners) - 1 do begin
      XtVaCreateManagedWidget(corners[i], xmPushButtonWidgetClass, bboard, nil, XmNtranslations, 'button1');
    end;

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
