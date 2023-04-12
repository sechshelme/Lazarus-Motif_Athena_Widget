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

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

  procedure file_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    item_no: PtrUInt;
  begin
    item_no := PtrUInt(client_data);
    WriteLn('Item ', item_no + 1, ' (', XtName(w), ') selected'#10);
    if item_no = 2 then begin
      Halt;
    end;
  end;

  function GetTopShell(w: TWidget): TWidget;
  begin
    //    while (w <> nil) and not XtIsWMShell(w) do begin
    if w = nil then begin
      WriteLn('nil');
    end;
    //    while not (w <> nil) and not _XtCheckSubclassFlag(w, TXtEnum($40)) do begin
    while not (w <> nil) or not _XtCheckSubclassFlag(w, TXtEnum($40)) do begin
      WriteLn('dsfdfsd');
      w := XtParent(w);
    end;
    Result := w;
  end;

const
  info_width = 32;
  info_height = 32;
  info_bits: array[0..128 - 1] of byte = (
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $e0, $07, $00, $00, $f8, $1f, $00, $00, $7c, $3e, $00,
    $00, $3e, $7c, $00, $00, $3f, $fc, $00, $00, $7f, $fe, $00,
    $80, $ff, $ff, $01, $80, $1f, $fc, $01, $80, $3f, $fc, $01,
    $80, $3f, $fc, $01, $80, $3f, $fc, $01, $80, $3f, $fc, $01,
    $00, $3f, $fc, $00, $00, $1f, $f8, $00, $00, $fe, $7f, $00,
    $00, $fc, $3f, $00, $00, $f8, $1f, $00, $00, $e0, $07, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00);

  procedure help_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    help_dialog, pane, form, label_: TWidget;
    fg, bg: TPixel;
    pixmap: TPixmap;
  begin
    help_dialog := XtVaCreatePopupShell('Help', xmDialogShellWidgetClass, GetTopShell(w),
      XmNdeleteResponse, XmDESTROY, nil);

    pane := XtVaCreateWidget('pane', xmPanedWindowWidgetClass, help_dialog,
      XmNsashWidth, 1,
      XmNsashHeight, 1, nil);

    form := XtVaCreateWidget('form1', xmFormWidgetClass, pane, nil);
    XtVaGetValues(form,
      XmNforeground, @fg,
      XmNbackground, @bg, nil);

    pixmap := XCreatePixmapFromBitmapData(XtDisplay(form), RootWindowOfScreen(XtScreen(form)),
      @info_bits, info_width, info_height, fg, bg, DefaultDepthOfScreen(XtScreen(form)));

    label_:=XtVaCreateManagedWidget('label',xmLabelGadgetClass,form,
    XmNlabelType,XmPIXMAP,
    XmNlabelPixmap,pixmap,
    XmNleftAttachment,XmATTACH_FORM,
    XmNtopAttachment,XmATTACH_FORM,
    XmNbottomAttachment,XmATTACH_FORM,
    nil);

    XtPopup(help_dialog, XtGrabNone);

  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_w, rc, menubar, w: TWidget;
    cascade_btns: PWidget = nil;
    app: TXtAppContext;
    str1, str2, str3: TXmString;
    num_btns: integer;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateWidget('main_w', xmMainWindowWidgetClass, toplevel, nil);

    str1 := XmStringCreateLocalized('File');
    str2 := XmStringCreateLocalized('Help');

    menubar := XmVaCreateSimpleMenuBar(main_w, 'main_w',
      XmVaCASCADEBUTTON, str1, 'F',
      XmVaCASCADEBUTTON, str2, 'H',
      nil);

    XmStringFree(str1);
    XmStringFree(str2);

    str1 := XmStringCreateLocalized('New');
    str2 := XmStringCreateLocalized('Open');
    str3 := XmStringCreateLocalized('Quit');

    XmVaCreateSimplePulldownMenu(menubar, 'file_menu', 0, @file_cb,
      XmVaPUSHBUTTON, str1, 'N', nil, nil,
      XmVaPUSHBUTTON, str2, 'O', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, str3, 'Q', nil, nil,
      nil);

    XmStringFree(str1);
    XmStringFree(str2);
    XmStringFree(str3);

    str1 := XmStringCreateLocalized('On Context');
    str2 := XmStringCreateLocalized('On Window');
    str3 := XmStringCreateLocalized('Index');

    w := XmVaCreateSimplePulldownMenu(menubar, 'help_menu', 1, @help_cb,
      XmVaPUSHBUTTON, str1, 'C', nil, nil,
      XmVaPUSHBUTTON, str2, 'W', nil, nil,
      XmVaPUSHBUTTON, str3, 'I', nil, nil,
      nil);

    XmStringFree(str1);
    XmStringFree(str2);
    XmStringFree(str3);

    XtVaGetValues(menubar,
      XmNchildren, @cascade_btns,
      XmNnumChildren, @num_btns,
      nil);
    XtVaSetValues(menubar,
      XmNmenuHelpWidget, cascade_btns[num_btns - 1],
      nil);
    XtManageChild(menubar);

    rc := XtVaCreateWidget('rc', xmRowColumnWidgetClass, main_w, nil);
    str1 := XmStringCreateLtoR(#10'  This is an Empty'#10'Sample Control Area'#10, XmFONTLIST_DEFAULT_TAG);
    XtVaCreateManagedWidget('label', xmLabelGadgetClass, rc,
      XmNlabelString, str1,
      nil);

    XmStringFree(str1);
    XtManageChild(rc);
    XtManageChild(main_w);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
