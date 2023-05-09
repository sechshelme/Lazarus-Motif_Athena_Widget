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

  procedure cut_to_clipboard(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  const
    cnt: cint = 0;
  var
    buf: string;
    dpy: PDisplay;
    window: TWindow;
    Data: PChar;
    clip_label: TXmString;
    item_id: longint = 0;
    data_id: cint = 0;
    status: longint;
  begin
    dpy := XtDisplayOfObject(w);
    window := XtWindowOfObject(w);
    Data := PChar(client_data);

    Inc(cnt);
    WriteStr(buf, Data, ' ', cnt);
    WriteLn('Putting ', buf, ' on chlipboard');

    clip_label := XmStringCreateLocalized('cut_to_clipboard');

    repeat
      status := XmClipboardStartCopy(dpy, window, clip_label, CurrentTime, nil, nil, @item_id);
    until status = ClipboardSuccess;

    repeat
      status := XmClipboardCopy(dpy, window, item_id, 'STRING', PChar(buf), Length(buf) + 1, 0, @data_id);
    until status = ClipboardSuccess;

    repeat
      status := XmClipboardEndCopy(dpy, window, item_id);
    until status = ClipboardSuccess;
  end;

  procedure undo(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    XmClipboardUndoCopy(XtDisplayOfObject(w), XtWindowOfObject(w));
  end;

  procedure retrieve_from_clipboard(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    dpy: PDisplay;
    window: TWindow;
    status: cint;
    buf: array[0..19] of char;
  begin
    dpy := XtDisplayOfObject(w);
    window := XtWindowOfObject(w);
    XmClipboardStartRetrieve(dpy, window, CurrentTime);
    repeat
      status := XmClipboardRetrieve(dpy, window, 'STRING', @buf, Length(buf), nil, nil);
      Write('Status = ');
      case status of
        ClipboardSuccess: begin
          WriteLn('success');
        end;
        ClipboardLocked: begin
          WriteLn('success');
        end;
        ClipboardNoData: begin
          WriteLn('success');
        end;
        ClipboardTruncate: begin
          WriteLn('success');
        end;
        ClipboardFail: begin
          WriteLn('success');
        end;
        else begin
          WriteLn('Bad Format');
        end;
      end;
    until status = ClipboardSuccess;
    XmClipboardEndRetrieve(dpy, window);
  end;


  procedure main(argc: longint; argv: PPChar);
  var
    rowcol, btn, toplevel: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    rowcol := XtVaCreateManagedWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      nil);

    btn := XtVaCreateManagedWidget('button1', xmPushButtonWidgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, 'Cut to Clipboard', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @cut_to_clipboard, PChar('data'));

    btn := XtVaCreateManagedWidget('button2', xmPushButtonWidgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, 'Undo Cut', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @undo, nil);

    btn := XtVaCreateManagedWidget('button2', xmPushButtonWidgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, 'Retrieve From Clipboard', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @retrieve_from_clipboard, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
