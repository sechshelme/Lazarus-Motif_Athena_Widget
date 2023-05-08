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

  procedure copy_by_name(w: TWidget; data_id: Plongint; private_id: Plongint; reason: Plongint); cdecl;
  const
    cnt: integer = 0;
  var
    rea, buf: string;
    dpy: PDisplay;
    win: TWindow;
    status: longint;
  begin
    dpy := XtDisplay(toplevel);
    win := XtWindow(toplevel);
    if reason^ = XmCR_CLIPBOARD_DATA_REQUEST then begin
      rea := 'request';
    end else begin
      rea := 'delete';
    end;
    WriteLn('Copy by name called');
    WriteLn('reason: ', rea, ' private_id: ', private_id^, ' data_id: ', data_id^);

    if reason^ = XmCR_CLIPBOARD_DATA_REQUEST then begin
      Inc(cnt);
      WriteStr(buf, 'stuff-', cnt);
      repeat
        status := XmClipboardCopyByName(dpy, win, data_id^, PChar(buf), Length(buf), culong(private_id^ = cnt));
      until status = ClipboardSuccess;
    end;
  end;

  procedure to_clipbd(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    clip_label: TXmString;
    dpy: PDisplay;
    win: TWindow;
    status, item_id: longint;
  begin
    dpy := XtDisplay(toplevel);
    win := XtWindow(toplevel);
    clip_label := XmStringCreateLocalized('to_clipbd');
    repeat
      status := XmClipboardBeginCopy(dpy, win, clip_label, w, @copy_by_name, @item_id);
    until status <> ClipboardLocked;

    repeat
      status := XmClipboardCopy(dpy, win, item_id, 'STRING', nil, 8, 0, nil);
    until status <> ClipboardLocked;

    repeat
      status := XmClipboardEndCopy(dpy, win, item_id);
    until status <> ClipboardLocked;
  end;

  procedure from_clipd(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    dpy: PDisplay;
    win: TWindow;
    buf: array[0..31] of Char;
    status: culong;
    Data: PChar;
    total_bytes: integer;
    received: DWord;
  begin
    dpy := XtDisplay(toplevel);
    win := XtWindow(toplevel);

    repeat
      status := XmClipboardStartRetrieve(dpy, win, CurrentTime);
    until status <> ClipboardLocked;

    Data := XtMalloc(1);
    total_bytes := 1;

    repeat
      buf[0] :=#0 ;
      status := XmClipboardRetrieve(dpy, win, 'STRING', @buf, SizeOf(buf), @received, nil);
      if status = ClipboardNoData then begin
        WriteLn('Clipboard leer');
      end;
      WriteLn('Anzahl Zeichen im Puffer: ',received);

      if not (Data = XtRealloc(Data, total_bytes + received)) then begin
        WriteLn('Can''t allocate space for data');
        Exit;
      end;

      strncpy(@Data[total_bytes - 1], PChar(buf), received);
      Inc(total_bytes, received);
    until status <> ClipboardTruncate;

    Data[total_bytes - 1] := #0;
    if status = ClipboardSuccess then begin
      WriteLn('Retrieved ', Data, ' from clipboard (', total_bytes, ' bytes');
    end;

    status := XmClipboardEndRetrieve(dpy, win);
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
      XtVaTypedArg, XmNlabelString, XmRString, 'Copy To Clipboard', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @to_clipbd, nil);

    btn := XtVaCreateManagedWidget('button2', xmPushButtonWidgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, 'Retrieve From Clipboard', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @from_clipd, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
