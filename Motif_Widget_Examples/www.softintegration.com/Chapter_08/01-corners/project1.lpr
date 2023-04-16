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
    margine_w, margine_h: cshort;
    cevent: PXConfigureEvent;
    Width, Height: cint;
  begin
    cevent := PXConfigureEvent(event);
    Width := cevent^.Width;
    Height := cevent^.Height;

    XtVaGetValues(w,
      XmNchildren, @children,
      XmNmarginWidth, @margine_w,
      XmNmarginHeight, @margine_h,
      nil);

    XtVaSetValues(children[0],
      XmNx, margine_w, XmNy, margine_h,
      nil);

    XtVaGetValues(children[1], XmNwidth, @w_widht, nil);
    XtVaSetValues(children[1],
      XmNx, Width - margine_w - w_widht,
      XmNy, margine_h,
      nil);

    XtVaGetValues(children[2], XmNheight, @w_height, nil);
    XtVaSetValues(children[2],
      XmNx, margine_w,
      XmNy, Height - margine_h - w_height,
      nil);

    XtVaGetValues(children[3], XmNheight, @w_height, XmNwidth, @w_widht, nil);
    XtVaSetValues(children[3],
      XmNx, Width - margine_w - w_widht,
      XmNy, Height - margine_h - w_height,
      nil);
  end;

  procedure enter(w: TWidget; event: PXEvent; params: PString;    num_params: PCardinal); cdecl;
  begin
    WriteLn('enter');
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, bboard: TWidget;
    app: TXtAppContext;
    rec: array[0..1] of TXtActionsRec;
    i: integer;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    bboard := XtVaCreateManagedWidget('bboard', xmBulletinBoardWidgetClass, toplevel, nil);

    rec[0]._string := PChar('resize');
    rec[0].proc := @resize;
    rec[1]._string := PChar('enter');
    rec[1].proc := @enter;

    XtAppAddActions(app, @rec, 2);
    XtOverrideTranslations(bboard, XtParseTranslationTable('<Configure>: resize() '#10' <EnterWindow>: enter()'));

    for i := 0 to Length(corners) - 1 do begin
      XtVaCreateManagedWidget(corners[i], xmPushButtonWidgetClass, bboard, nil);
    end;

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
