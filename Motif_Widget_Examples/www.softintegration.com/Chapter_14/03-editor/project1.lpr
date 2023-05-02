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

  XmCommand,
  XmText,
  XTComposite,
  XTCore,
  XTIntrinsic;

var
  text_output, text_w: TWidget;

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

    WriteLn(reason);
    case reason of
      0: begin
        result1 := XmTextCut(text_w, when);
      end;
      1: begin
        result1 := XmTextCopy(text_w, when);
      end;
      2: begin
        result1 := XmTextPaste(text_w);
        XmTextClearSelection(text_w, when);
      end;
      3: begin
        XmTextClearSelection(text_w, when);
      end;
    end;
    if result1 = False then begin
      XmTextSetString(text_output, 'There is not selction.');
    end else begin
      XmTextSetString(text_output, nil);
    end;
  end;

  procedure file_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer
    ); cdecl;
  begin

  end;

  procedure search_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer
    ); cdecl;
  begin

  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol_v, main_window, menubar: TWidget;
    app: TXtAppContext;
    file_m, cut_m, copy_m, clear_m, paste_m, edit_m, search_m, open_m,
    save_m, exit_m, exit_acc_m, next_m, find_m, replace_m: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
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
      XmVaPUSHBUTTON, exit_m, 'x', 'Ctrlc', exit_acc_m,
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
      XmVaPUSHBUTTON, cut_m, 't', nil, nil,
      XmVaPUSHBUTTON, copy_m, 'C', nil, nil,
      XmVaPUSHBUTTON, paste_m, 'P', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, clear_m, 'l', nil, nil,
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

    // ------------------------

    rowcol_v := XtVaCreateManagedWidget('rowcol_v', xmRowColumnWidgetClass, main_window,
      nil);

    text_output := XtVaCreateManagedWidget('text_output', xmTextWidgetClass, rowcol_v,
      XmNeditable, False,
      XmNcursorPositionVisible, False,
      XmNshadowThickness, 0,
      XmNhighlightThickness, 0,
      XmNbackground, $DDDDDD,
      nil);

    text_w := XmCreateScrolledText(rowcol_v, 'text_w', nil, 0);
    XtVaSetValues(text_w,
      XmNbackground, $FFFFFF,
      XmNrows, 10,
      XmNcolumns, 80,
      XmNeditMode, XmMULTI_LINE_EDIT,
      XmNscrollHorizontal, False,
      XmNwordWrap, True,
      nil);
    XtManageChild(text_w);

    XtManageChild(rowcol_v);
    XtManageChild(main_window);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
