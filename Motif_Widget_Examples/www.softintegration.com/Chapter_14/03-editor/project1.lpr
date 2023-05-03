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

const
  FILE_OPEN = 0;
  FILE_SAVE = 1;
  FILE_EXIT = 2;

  EDIT_CUT = 0;
  EDIT_COPY = 1;
  EDIT_PASTE = 2;
  EDIT_CLEAR = 3;

  SEARCH_FIND_NEXT = 0;
  SEARCH_SHOW_ALL = 1;
  SEARCH_REPLACE = 2;
  SEARCH_CLEAR = 3;

var
  text_output, text_edit, search_text, replace_text: TWidget;

  procedure edit_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    reason: PtrInt;
    result1: boolean = True;
    event: PXEvent;
    when: TTime;
  begin
    reason := PtrInt(client_data);
    event := PXmPushButtonCallbackStruct(call_data)^.event;
    XmTextSetString(text_output, nil);

    if event <> nil then begin
      if reason in [EDIT_CUT, EDIT_COPY, EDIT_CLEAR] then begin
        case event^._type of
          ButtonRelease: begin
            when := event^.xbutton.time;
          end;
          KeyRelease: begin
            when := event^.xkey.time;
          end;
          else begin
            when := CurrentTime;
          end;
        end;
      end;
    end;

    case reason of
      0: begin
        result1 := XmTextCut(text_edit, when);
      end;
      1: begin
        result1 := XmTextCopy(text_edit, when);
      end;
      2: begin
        result1 := XmTextPaste(text_edit);
        XmTextClearSelection(text_edit, when);
      end;
      3: begin
        XmTextClearSelection(text_edit, when);
      end;
    end;
    if result1 = False then begin
      XmTextSetString(text_output, 'There is not selction.');
    end;
  end;

  procedure file_select_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmFileSelectionBoxCallbackStruct;
    reason: PtrInt;
    filename: PChar = nil;
    fd: cint;
    buf: string;
    text1: PChar;
    len: TXmTextPosition;
  begin
    reason := PtrInt(client_data);
    cbs := PXmFileSelectionBoxCallbackStruct(call_data);

    if not XmStringGetLtoR(cbs^.Value, XmFONTLIST_DEFAULT_TAG, @filename) then begin
      Exit;
    end;

    if filename^ = #0 then begin
      XtFree(filename);
      XBell(XtDisplay(text_edit), 50);
      XmTextSetString(text_output, 'Choose a file.');
      Exit;
    end;

    if reason = FILE_SAVE then begin
      fd := FpOpen(filename, O_WrOnly or O_Creat);
      if fd <= 0 then begin
        WriteStr(buf, 'Can''t save to ', filename);
        XmTextSetString(text_output, PChar(buf));
      end;
      text1 := XmTextGetString(text_edit);
      len := XmTextGetLastPosition(text_edit);
      if FpWrite(fd, text1, len) <> len then begin
        WriteLn('Fehler beim speichern !');
      end;
    end;

    FpClose(fd);
  end;

  procedure popdown_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    XtUnmanageChild(w);
  end;

  procedure file_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  const
    open_dialog: TWidget = nil;
    save_dialog: TWidget = nil;
  var
    reason: PtrInt;
    dialog: TWidget = nil;
    button1, title1: TXmString;
  begin
    reason := PtrInt(client_data);
    if reason = FILE_EXIT then begin
      Halt(0);
    end;

    XmTextSetString(text_output, nil);

    if (reason = FILE_OPEN) and (open_dialog <> nil) then begin
      dialog := open_dialog;
    end else begin
      dialog := save_dialog;
    end;

    if dialog <> nil then begin
      XtManageChild(dialog);
      XMapRaised(XtDisplay(dialog), XtWindow(XtParent(dialog)));
      Exit;
    end;

    dialog := XmCreateFileSelectionDialog(text_edit, 'Files', nil, 0);
    XtVaSetValues(dialog,
      XtVaTypedArg, XmNdirectory, XmRString, PChar('/home'), 0,
      XtVaTypedArg, XmNdirMask, XmRString, PChar('*.txt'), 0,
      nil);

    XtAddCallback(dialog, XmNcancelCallback, @popdown_cb, nil);
    XtAddCallback(dialog, XmNokCallback, @file_select_cb, TXtPointer(reason));

    if reason = FILE_OPEN then begin
      button1 := XmStringCreateLocalized('Oeffnen');
      title1 := XmStringCreateLocalized('Datei oeffnen');
      open_dialog := dialog;
    end else begin
      button1 := XmStringCreateLocalized('Speichern');
      title1 := XmStringCreateLocalized('Datei speichern');
      save_dialog := dialog;
    end;
    XtVaSetValues(dialog,
      XmNokLabelString, button1,
      XmNdialogTitle, title1,
      nil);
    XmStringFree(button1);
    XmStringFree(title1);
    XtManageChild(dialog);
  end;

  procedure search_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    search_pat: PChar = nil;
    s: PChar = nil;
    p, new_pat: PChar;
    //    buf: array[0..255] of char;
    buf: string;
    reason: PtrInt;
    pos1: TXmTextPosition;
    nfound: integer = 0;
    search_len, pattern_len: SizeInt;
    found: TBoolean;
  begin
    reason := PtrInt(client_data);

    XmTextSetString(text_output, nil);

    if reason = SEARCH_CLEAR then begin
      pos1 := XmTextGetLastPosition(text_edit);
      XmTextSetHighlight(text_edit, 0, pos1, XmHIGHLIGHT_NORMAL);
      Exit;
    end;

    s := XmTextGetString(text_edit);
    if (s = nil) or (s^ = #0) then begin
      XmTextSetString(text_output, 'No text to search.');
      Exit;
    end;

    search_pat := XmTextGetString(search_text);
    if (search_pat = nil) or (search_pat^ = #0) then begin
      XmTextSetString(text_output, 'Specify a search pattern.');
      XtFree(s);
      Exit;
    end;

    new_pat := XmTextGetString(replace_text);
    search_len := strlen(search_pat);
    pattern_len := strlen(new_pat);

    if reason = SEARCH_FIND_NEXT then begin
      pos1 := XmTextGetCursorPosition(text_edit) + 1;
      found := XmTextFindString(text_edit, pos1, search_pat, XmTEXT_FORWARD, @pos1);
      if not found then begin
        found := XmTextFindString(text_edit, 0, search_pat, XmTEXT_FORWARD, @pos1);
      end;
      if found then begin
        Inc(nfound);
      end;
    end else begin
      repeat
        found := XmTextFindString(text_edit, pos1, search_pat, XmTEXT_FORWARD, @pos1);
        if found then begin
          Inc(nfound);
          if reason = SEARCH_SHOW_ALL then begin
            XmTextSetHighlight(text_edit, pos1, pos1 + search_len, XmHIGHLIGHT_SELECTED);
          end else begin
            XmTextReplace(text_edit, pos1, pos1 + search_len, new_pat);
          end;
          Inc(pos1);
        end;
      until not found;
    end;

    if nfound = 0 then begin
      XmTextSetString(text_output, 'Pattern not found.');
    end else begin
      case reason of
        SEARCH_FIND_NEXT: begin
          WriteStr(buf, 'Pattern found at position ', pos1);
          XmTextSetInsertionPosition(text_edit, pos1);
        end;
        SEARCH_SHOW_ALL: begin
          WriteStr(buf, 'Found ', nfound, ' occurrences.');
        end;
        SEARCH_REPLACE: begin
          WriteStr(buf, 'Made ', nfound, ' replacements.');
        end;
      end;
      XmTextSetString(text_output, PChar(buf));
    end;
    XtFree(s);
    XtFree(search_pat);
    XtFree(new_pat);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, main_window, menubar, form, search_panel, scroll_box: TWidget;
    app_context: TXtAppContext;
    file_m, cut_m, copy_m, clear_m, paste_m, edit_m, search_m, open_m,
    save_m, exit_m, exit_acc_m, next_m, find_m, replace_m: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app_context, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    main_window := XtVaCreateWidget('main_window', xmMainWindowWidgetClass, toplevel, nil);

    file_m := XmStringCreateLocalized('Datei');
    edit_m := XmStringCreateLocalized('Bearbeiten');
    search_m := XmStringCreateLocalized('Suchen');
    menubar := XmVaCreateSimpleMenuBar(main_window, 'menubar',
      XmVaCASCADEBUTTON, file_m, 'D',
      XmVaCASCADEBUTTON, edit_m, 'B',
      XmVaCASCADEBUTTON, search_m, 'S',
      nil);
    XmStringFree(file_m);
    XmStringFree(edit_m);
    XmStringFree(search_m);

    open_m := XmStringCreateLocalized('Oeffnen...');
    save_m := XmStringCreateLocalized('Speichern...');
    exit_m := XmStringCreateLocalized('Beenden');
    exit_acc_m := XmStringCreateLocalized('Ctrl+C');
    XmVaCreateSimplePulldownMenu(menubar, 'file_menu', 0, @file_cb,
      XmVaPUSHBUTTON, open_m, 'O', nil, nil,
      XmVaPUSHBUTTON, save_m, 'S', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, exit_m, 'B', 'Ctrlx', exit_acc_m,
      nil);
    XmStringFree(open_m);
    XmStringFree(save_m);
    XmStringFree(exit_m);
    XmStringFree(exit_acc_m);

    cut_m := XmStringCreateLocalized('Ausschneiden');
    copy_m := XmStringCreateLocalized('Kopieren');
    paste_m := XmStringCreateLocalized('Einuegen');
    clear_m := XmStringCreateLocalized('Loeschen');
    XmVaCreateSimplePulldownMenu(menubar, 'edit_menu', 1, @edit_cb,
      XmVaPUSHBUTTON, cut_m, 'A', nil, nil,
      XmVaPUSHBUTTON, copy_m, 'K', nil, nil,
      XmVaPUSHBUTTON, paste_m, 'E', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, clear_m, 'L', nil, nil,
      nil);
    XmStringFree(cut_m);
    XmStringFree(copy_m);
    XmStringFree(paste_m);

    next_m := XmStringCreateLocalized('Naechste');
    find_m := XmStringCreateLocalized('Finden');
    replace_m := XmStringCreateLocalized('Ersetzen');
    XmVaCreateSimplePulldownMenu(menubar, 'search_menu', 2, @search_cb,
      XmVaPUSHBUTTON, next_m, 'N', nil, nil,
      XmVaPUSHBUTTON, find_m, 'A', nil, nil,
      XmVaPUSHBUTTON, replace_m, 'R', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, clear_m, 'C', nil, nil,
      nil);
    XmStringFree(next_m);
    XmStringFree(find_m);
    XmStringFree(clear_m);
    XmStringFree(replace_m);

    XtManageChild(menubar);

    form := XtVaCreateWidget('form', xmFormWidgetClass, main_window, nil);

    search_panel := XtVaCreateWidget('search_panel', xmRowColumnWidgetClass, form,
      XmNorientation, XmHORIZONTAL,
      XmNpacking, XmPACK_TIGHT,
      XmNtopAttachment, XmATTACH_FORM,
      XmNleftAttachment, XmATTACH_FORM,
      XmNrightAttachment, XmATTACH_FORM,
      nil);

    XtVaCreateManagedWidget('Search Pattern:', xmLabelGadgetClass, search_panel, nil);
    search_text := XtVaCreateManagedWidget('search_text', xmTextFieldWidgetClass, search_panel,
      XmNbackground, $FFFFFF,
      nil);
    XtVaCreateManagedWidget('     Replace Pattern:', xmLabelGadgetClass, search_panel, nil);
    replace_text := XtVaCreateManagedWidget('replace_text', xmTextFieldWidgetClass, search_panel,
      XmNbackground, $FFFFFF,
      nil);

    XtManageChild(search_panel);

    text_output := XtVaCreateManagedWidget('text_output', xmTextFieldWidgetClass, form,
      XmNeditable, False,
      XmNcursorPositionVisible, False,
      XmNshadowThickness, 0,
      XmNleftAttachment, XmATTACH_FORM,
      XmNrightAttachment, XmATTACH_FORM,
      XmNbottomAttachment, XmATTACH_FORM,
      nil);

    scroll_box := XtVaCreateManagedWidget('sb', xmScrolledWindowWidgetClass, form,
      XmNtopAttachment, XmATTACH_WIDGET,
      XmNtopWidget, search_panel,
      XmNleftAttachment, XmATTACH_FORM,
      XmNrightAttachment, XmATTACH_FORM,
      XmNbottomAttachment, XmATTACH_WIDGET,
      XmNbottomWidget, text_output,
      nil);

    text_edit := XtVaCreateManagedWidget('text_edt', xmTextWidgetClass, scroll_box,
      XmNbackground, $FFFFFF,
      XmNrows, 10,
      XmNcolumns, 80,
      XmNeditMode, XmMULTI_LINE_EDIT,
      nil);

    XtManageChild(form);
    XtManageChild(main_window);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app_context);
  end;

begin
  main(argc, argv);
end.
