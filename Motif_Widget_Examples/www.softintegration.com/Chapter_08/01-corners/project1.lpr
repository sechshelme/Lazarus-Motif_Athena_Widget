program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  XmXm,
  XmXmStrDefs,
  XmPushB,
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

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

const
  corners: array of PChar = ('Top, Left', 'Top Right', 'Bottom Left', 'Bottom Right');

  procedure resize(w: TWidget; event: PXEvent; params: PString; num_params: PCardinal); cdecl;
  var
    children: TWidgetList;
    w_widht, w_height: TDimension;
    margin_w, margin_h: Integer;
    cevent: PXConfigureEvent;
    Width, Height: cint;
  begin
    WriteLn('resiz');

    cevent := PXConfigureEvent(event);
    Width := cevent^.Width;
    Height := cevent^.Height;

    XtVaGetValues(w,
      XmNchildren, @children,
      XmNmarginWidth, @margin_w,
      XmNmarginHeight, @margin_h,
      nil);

    WriteLn('w:', margin_w);
    WriteLn('h:', margin_h);
    WriteLn('w:', Width);
    WriteLn('h:', Height);

    XtVaSetValues(children[0],
    XmNbackground, random($FFFFFF),
    //   XmNx, margin_w, XmNy, margin_h,
//       XmNx, 50, XmNy, 50,
      nil);
    exit;

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

  procedure enter(w: TWidget; event: PXEvent; params: PString; num_params: PCardinal); cdecl;
  begin
    WriteLn('enter');
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

    bboard := XtVaCreateManagedWidget('bboard', xmBulletinBoardWidgetClass, toplevel, nil);

    SetLength(rec, 2);
    rec[0]._string := PChar('resize');
    rec[0].proc := @resize;
    rec[1]._string := PChar('enter');
    rec[1].proc := @enter;

    XtAppAddActions(app, @rec[0], 2);
    trans := XtParseTranslationTable('<ConfigureNotify>: resize() '#10' <EnterNotify>: enter()');
//    WriteLn(PtrUInt(trans));
    XtOverrideTranslations(bboard, trans);

    for i := 0 to Length(corners) - 1 do begin
      XtVaCreateManagedWidget(corners[i], xmPushButtonWidgetClass, bboard, nil);
    end;

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
