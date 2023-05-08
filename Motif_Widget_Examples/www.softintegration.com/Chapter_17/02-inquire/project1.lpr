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
  XmScale,
  xmCutPaste,

  XmCommand,
  XmText,
  XTComposite,
  XTCore,
  XTIntrinsic;

  function strncat(dest, src: PChar; size: clong): PChar; cdecl; external libX11;
  function strncpy(dest, src: PChar; size: clong): PChar; cdecl; external libX11;

var
  toplevel: TWidget;

  procedure add_fmt(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    dpy: PDisplay;
    win: TWindow;
    label1: TXmString;
    status: cint;
    item_id, data_id: culong;
    ten: cint = 10;
  begin
    dpy := XtDisplay(toplevel);
    win := XtWindow(toplevel);

    label1 := XmStringCreateLocalized('integer');

    if XmClipboardRegisterFormat(dpy, 'INTEGER', 32) = ClipboardFail then begin
      XtWarning('an''t register INTEGER');
      Exit;
    end;

    repeat
      status := XmClipboardStartCopy(dpy, win, label1, CurrentTime, nil, nil, @item_id);
    until status <> ClipboardLocked;

    XmStringFree(label1);

    repeat
      status := XmClipboardCopy(dpy, win, item_id, 'INTEGER', PChar(@ten), SizeOf(cint), 0, @data_id);
    until status <> ClipboardLocked;

    repeat
      status := XmClipboardEndCopy(dpy, win, item_id);
    until status <> ClipboardLocked;
  end;

  procedure check_fmts(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    dpy: PDisplay;
    win: TWindow;
    status, i: integer;
    Count: longint;
    maxlen: DWord;
    len: integer = 0;
    fmt_str: string = '';
  begin
    dpy := XtDisplay(toplevel);
    win := XtWindow(toplevel);

    repeat
      status := XmClipboardInquireCount(dpy, win, @Count, @maxlen);
    until status <> XmClipboardLocked;

    WriteLn('#-formats: ', Count, ', strlen of longest format name: ', maxlen);
    SetLength(fmt_str, maxlen + 1);

    for i := 1 to Count do begin
      repeat
        status := XmClipboardInquireCount(dpy, win, @Count, @maxlen);    // Wieso ???????????????
        status := XmClipboardInquireFormat(dpy, win, i, PChar(fmt_str), maxlen, @len);
      until status <> XmClipboardLocked;
      SetLength(fmt_str, len + 1);
      fmt_str[len + 1] := #0;
      WriteLn('len: ', len: 3, '  string: ', fmt_str);
    end;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    rowcol, btn: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      nil);

    btn := XtVaCreateManagedWidget('button1', xmPushButtonWidgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, 'Add Format', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @add_fmt, nil);

    btn := XtVaCreateManagedWidget('button2', xmPushButtonWidgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, 'Check Know Formats', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @check_fmts, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
