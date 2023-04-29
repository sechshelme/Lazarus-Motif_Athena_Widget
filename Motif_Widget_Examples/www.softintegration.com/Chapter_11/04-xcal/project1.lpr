program project1;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

uses
  SysUtils,
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
  XmToggleB,
  XmFrame,

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

const
  months: array of PChar = ('Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember');
var
  year: integer;

  procedure press_quit(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

  function ArgvToXmStringTable(argc: longint; argv: PPChar): TXmStringTable;
  var
    c_new: TXmStringTable=nil;
  begin
    c_new := TXmStringTable(XtMalloc((argc + 1) * SizeOf(TXmString)));
    if c_new = nil then begin
      WriteLn('Fehler');
      Result := nil;
      Exit;
    end;
    c_new[argc] := nil;
    while (argc > 0) do begin
      Dec(argc);
      c_new[argc] := XmStringCreate(argv[argc], 'tag2');
    end;
    Result := c_new;
  end;

  procedure FreeXmStringTable(argv: TXmStringTable);
  var
    i: integer = 0;
  begin
    while argv[i] <> nil do begin
      XmStringFree(argv[i]);
      Inc(i);
    end;
        XtFree(PChar( argv));
  end;

  procedure set_month(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    label1: TWidget;
    list_cbs: PXmListCallbackStruct;
    s, txt: string;
    f: Text;
    str1: TXmString;
  begin
    label1 := TWidget(client_data);
    list_cbs := PXmListCallbackStruct(call_data);
    WriteStr(txt, 'cal ', list_cbs^.item_position, ' ', year);

    if POpen(f, txt, 'r') <> 0 then begin
      WriteLn('Fehler mit "cal"');
    end;

    txt := '';
    while not EOF(f) do begin
      ReadLn(f, s);
      txt := txt + #10 + s;
    end;
    PClose(f);

    str1 := XmStringCreateLtoR(PChar(txt), 'tag1');
    XtVaSetValues(label1, XmNlabelString, str1, nil);
    XmStringFree(str1);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol, frame, label1, w, quit_btn: TWidget;
    app: TXtAppContext;
    font: PXFontStruct;
    entry: TXmFontListEntry;
    fontlist: TXmFontList;
    dpy: PDisplay;
    month_no, i: integer;
    strs: TXmStringTable;

  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    dpy := XtDisplay(toplevel);

    //    font := XLoadQueryFont(dpy, '-*-courier-bold-r-*--18-*');
    // font := XLoadQueryFont(dpy, '-misc-fixed-bold-r-normal--13-100-100-100-c-80-iso8859-1');
    font := XLoadQueryFont(dpy, '9x15');
    entry := XmFontListEntryCreate('tag1', XmFONT_IS_FONT, font);
    fontlist := XmFontListAppendEntry(nil, entry);

    //    font := XLoadQueryFont(dpy, '-*-courier-medium-r-*--18-*');
    font := XLoadQueryFont(dpy, '9x15bold');
    entry := XmFontListEntryCreate('tag2', XmFONT_IS_FONT, font);
    fontlist := XmFontListAppendEntry(fontlist, entry);

    XtFree(entry);

    if argc > 1 then begin
      month_no := 1;
      year := StrToInt(argv[1]);
    end else begin
      year := 2022;
      month_no := 11;
    end;

    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      XmNorientation, XmHORIZONTAL,
      nil);

    frame := XtVaCreateManagedWidget('frame', xmFrameWidgetClass, rowcol,
      nil);

    label1 := XtVaCreateManagedWidget('month', xmLabelGadgetClass, frame,
      XmNalignment, XmALIGNMENT_BEGINNING,
      XmNfontList, fontlist,
      nil);

    strs := ArgvToXmStringTable(Length(months), PPChar(months));

    w := XmCreateScrolledList(rowcol, 'list', nil, 0);
    XtVaSetValues(w,
      XmNitemCount, Length(months),
      XmNitems, strs,
      XmNfontList, fontlist,
      nil);

    FreeXmStringtable(strs);
    //    XmFontListFree(fontlist);

    XtAddCallback(w, XmNbrowseSelectionCallback, @set_month, label1);
    XtManageChild(w);
    XmListSelectPos(w, month_no, True);

    quit_btn := XtVaCreateManagedWidget('quit', xmPushButtonWidgetClass, rowcol,
      XmNalignment, XmALIGNMENT_BEGINNING,
      nil);

    XtAddCallback(quit_btn, XmNactivateCallback, @press_quit, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
