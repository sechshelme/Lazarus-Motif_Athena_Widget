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

  procedure cut_paste(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
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

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol_v, main_w, menubar: TWidget;
    app: TXtAppContext;
    label1, cut1, copy1, clear1, paste1: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    main_w := XtVaCreateWidget('main_w', xmMainWindowWidgetClass, toplevel, nil);

    label1 := XmStringCreateLocalized('Edit');
    menubar := XmVaCreateSimpleMenuBar(main_w, 'menubar', XmVaCASCADEBUTTON, label1, 'E', nil);
    XmStringFree(label1);

    cut1 := XmStringCreateLocalized('Cut');
    copy1 := XmStringCreateLocalized('Copy');
    clear1 := XmStringCreateLocalized('Clear');
    paste1 := XmStringCreateLocalized('Paste');

    XmVaCreateSimplePulldownMenu(menubar, 'edit_menu', 0, @cut_paste,
      XmVaPUSHBUTTON, cut1, 't', nil, nil,
      XmVaPUSHBUTTON, copy1, 'C', nil, nil,
      XmVaPUSHBUTTON, paste1, 'l', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, clear1, 'P', nil, nil,
      nil);

    XmStringFree(cut1);
    XmStringFree(copy1);
    XmStringFree(clear1);
    XmStringFree(paste1);

    XtManageChild(menubar);

    rowcol_v := XtVaCreateManagedWidget('rowcol_v', xmRowColumnWidgetClass, main_w,
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
      XmNwordWrap,True,
      nil);
    XtManageChild(text_w);

    XtManageChild(rowcol_v);
    XtManageChild(main_w);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
