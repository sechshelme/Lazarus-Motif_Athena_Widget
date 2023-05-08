program project1;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

uses
  heaptrc,
  Unix,
  BaseUnix,
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
  XmScale,
  XmFileSB,

  XmCommand,
  XmText,
  XTComposite,
  XTCore,
  XTIntrinsic;

var
  text_output: TWidget;

  procedure make_error(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    which: PtrUInt;
  begin
    which := PtrUInt(client_data);
    case which of
      0: begin
        XLookupColor(XtDisplay(text_output), 0, '', nil, nil);
      end;
      1: begin
        XtError('This is an XtError call!');
      end;
      2: begin
        XtWarning('This is an XtWarning.');
      end;
    end;
  end;

  function x_error(para1: PDisplay; para2: PXErrorEvent): cint; cdecl;
  var
    buf: string;
  begin
    SetLength(buf, 255);
    XGetErrorText(para1, para2^.error_code, PChar(buf), Length(buf));
    WriteLn('x Error: ', buf);
    Result:=0;
  end;

  procedure xt_error(para1: TXtString); cdecl;
  begin
    WriteLn('Xt Error: ', para1);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_window, rowcol, pb, scroll_box: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_window := XtVaCreateWidget('main_window', xmMainWindowWidgetClass, toplevel, nil);

    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, main_window, nil);

    pb := XtVaCreateManagedWidget('XLib Error', xmPushButtonGadgetClass, rowcol,
      nil);
    XtAddCallback(pb, XmNactivateCallback, @make_error, Pointer(0));


    pb := XtVaCreateManagedWidget('XT Error', xmPushButtonGadgetClass, rowcol,
      nil);
    XtAddCallback(pb, XmNactivateCallback, @make_error, Pointer(1));


    pb := XtVaCreateManagedWidget('XT Warning', xmPushButtonGadgetClass, rowcol,
      nil);
    XtAddCallback(pb, XmNactivateCallback, @make_error, Pointer(2));


    scroll_box := XtVaCreateManagedWidget('sb', xmScrolledWindowWidgetClass, rowcol,
      nil);

    text_output := XtVaCreateManagedWidget('text_edt', xmTextWidgetClass, scroll_box,
      XmNbackground, $FFFFFF,
      XmNrows, 6,
      XmNcolumns, 80,
      XmNeditable, False,
      XmNeditMode, XmMULTI_LINE_EDIT,
      XmNwordWrap, True,
      nil);

    XtAppSetErrorHandler(app, @xt_error);
    XtAppSetWarningHandler(app, @xt_error);

    XSetErrorHandler(@x_error);

    XmMainWindowSetAreas(main_window,nil,nil,nil,nil,rowcol);

    XtManageChild(rowcol);
    XtManageChild(main_window);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
