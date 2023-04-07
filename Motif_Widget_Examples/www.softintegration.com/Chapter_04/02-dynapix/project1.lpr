program project1;

uses
  heaptrc,
  Strings,
  ctypes,
  xlib,
  x,
  XmXm,
  XmXmStrDefs,
  XmPushB,
  XmMainW,
  XmCommand,
  XmText,
  XmLabel,
  XmMessageB,
  XmFileSB,
  XTComposite,
  XTIntrinsic;

const
  colors: array[0..3] of PChar = ('Black', 'Red', 'Green', 'Blue');
var
  cur_color: culong;
  toplevel, label1: TWidget;
  cur_bitmap: array[0..1023] of char = 'xlogo64';


  procedure load_pimap(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmFileSelectionBoxCallbackStruct;
    file1: PChar;
    pixmap, old: TPixmap;
  begin
    cbs := PXmFileSelectionBoxCallbackStruct(call_data);
    if cbs <> nil then begin
      if not XmStringGetLtoR(cbs^.Value, XmFONTLIST_DEFAULT_TAG, @file1) then begin
        WriteLn('Internal Error');
        exit;
      end;
      strcopy(cur_bitmap, file1);
      XtFree(file1);
    end;

    pixmap := XmGetPixmap(XtScreen(toplevel), cur_bitmap, cur_color, WhitePixelOfScreen(XtScreen(toplevel)));
    if pixmap = XmUNSPECIFIED_PIXMAP then begin
      WriteLn('Can''t create pixmap from ', cur_bitmap);
    end else begin
      XtVaGetValues(label1, XmNlabelPixmap, @old, nil);
      XmDestroyPixmap(XtScreen(toplevel), old);
      XtVaSetValues(label1, XmNlabelType, XmPIXMAP, XmNlabelPixmap, pixmap, nil);
      WriteLn('fdsfds');
    end;
  end;

  procedure unmanagechild(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    XtUnmanageChild(w);
  end;

  procedure FileHelp(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    WriteLn('Hilfe zur Dateien');
  end;

  procedure file_cb(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    item_no: PtrInt;
    dialog: TWidget = nil;
  begin
    item_no := PtrInt(client_data);
    if item_no = 1 then begin
      Halt;
    end;
    WriteLn(item_no);

    if dialog = nil then begin
      dialog := XmCreateFileSelectionDialog(toplevel, 'file_sel', nil, 0);
      XtAddCallback(dialog, XmNokCallback, @load_pimap, nil);
      XtAddCallback(dialog, XmNcancelCallback, @unmanagechild, nil);
      XtAddCallback(dialog, XmNhelpCallback, @FileHelp, nil);
    end;

    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
  end;

  procedure change_color(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    dpy: PDisplay;
    cmap: TColormap;
    xcolor, unused: TXColor;
    widget: TWidget = nil;
    item_no: PtrInt;
  begin
    dpy := XtDisplay(label1);
    cmap := DefaultColormapOfScreen(XtScreen(label1));
    item_no := PtrInt(client_data);
    if (XAllocNamedColor(dpy, cmap, colors[item_no], @xcolor, @unused) = 0) or (cur_color = xcolor.pixel) then begin
      Exit;
    end;
    cur_color := xcolor.pixel;
    load_pimap(widget, nil, nil);
  end;

  procedure help_cp(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  const
    ms = 'Use the FileSelection dialog to find bitmap files to' + #10 +
      'display in the scrolling area in the main window.  Use' + #10 +
      'the edit menu to display the bitmap in different colors.';

    dialog: TWidget = nil;
  var
    msg: TXmString;
    args: array[0..0] of TArg;
  begin
    if dialog = nil then begin
      msg := XmStringCreateLtoR(ms, XmFONTLIST_DEFAULT_TAG);
      XtSetArg(args[0], XmNmessageString, msg);
      dialog := XmCreateInformationDialog(toplevel, 'help_dialog', args, 1);
    end;
    XtManageChild(dialog);
    XtPopup(XtParent(dialog), XtGrabNone);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    main_w, menubar, menu, text_w, command_w: TWidget;
    widget: TWidget = nil;
    app: TXtAppContext;
    file1, quit1, edit1, help1, open1, black1, red1, green1, blue1: TXmString;
    args: array[0..4] of TArg;
    pixmap: TPixmap;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    main_w := XtVaCreateManagedWidget('main_window', xmMainWindowWidgetClass, toplevel, XmNscrollBarDisplayPolicy, XmAS_NEEDED, XmNscrollingPolicy, XmAUTOMATIC, nil);

    file1 := XmStringCreateLocalized('File');
    edit1 := XmStringCreateLocalized('Edit');
    help1 := XmStringCreateLocalized('Help');

    menubar := XmVaCreateSimpleMenuBar(main_w, 'menubar',
      XmVaCASCADEBUTTON, file1, 'F',
      XmVaCASCADEBUTTON, edit1, 'E',
      XmVaCASCADEBUTTON, help1, 'H', nil);
    XmStringFree(file1);
    XmStringFree(edit1);

    widget := XtNameToWidget(menubar, 'button_2');
    if widget <> nil then begin
      XtVaSetValues(menubar, XmNmenuHelpWidget, widget, nil);
    end;

    open1 := XmStringCreateLocalized('Open...');
    quit1 := XmStringCreateLocalized('Quit');
    menu := XmVaCreateSimplePulldownMenu(menubar, 'file_menu', 0, @file_cb,
      XmVaPUSHBUTTON, open1, 'N', nil, nil,
      XmVaSEPARATOR,
      XmVaPUSHBUTTON, quit1, 'Q', nil, nil, nil);
    XmStringFree(open1);
    XmStringFree(quit1);

    black1 := XmStringCreateLocalized(colors[0]);
    red1 := XmStringCreateLocalized(colors[1]);
    green1 := XmStringCreateLocalized(colors[2]);
    blue1 := XmStringCreateLocalized(colors[3]);

    menu := XmVaCreateSimplePulldownMenu(menubar, 'edit_menu', 1, @change_color,
      XmVaRADIOBUTTON, black1, 'k', nil, nil,
      XmVaRADIOBUTTON, red1, 'R', nil, nil,
      XmVaRADIOBUTTON, green1, 'G', nil, nil,
      XmVaRADIOBUTTON, blue1, 'B', nil, nil,
      XmNradioBehavior, True,
      XmNradioAlwaysOne, True, nil);

    XmStringFree(black1);
    XmStringFree(red1);
    XmStringFree(green1);
    XmStringFree(blue1);

    widget := XtNameToWidget(menubar, 'button_0');
    if widget <> nil then begin
      XtVaSetValues(widget, XmNset, True, nil);
    end;

    XmVaCreateSimplePulldownMenu(menubar, 'help_menu', 2, @help_cp, XmVaPUSHBUTTON, help1, 'H', nil, nil, nil);
    XmStringFree(help1);

    XtManageChild(menubar);

    if argv[1] <> nil then begin
      strcopy(cur_bitmap, argv[1]);
    end;
    cur_color := BlackPixelOfScreen(XtScreen(toplevel));

    pixmap := XmGetPixmap(XtScreen(toplevel), cur_bitmap, cur_color, WhitePixelOfScreen(XtScreen(toplevel)));

    if pixmap = XmUNSPECIFIED_PIXMAP then begin
      WriteLn('can''t create initial pixmap');
      Halt(1);
    end;

    label1 := XtVaCreateManagedWidget('label', xmLabelWidgetClass, main_w, XmNlabelType, XmPIXMAP, XmNlabelPixmap, pixmap, nil);

    XtVaSetValues(main_w, XmNmenuBar, menubar, XmNworkWindow, label1, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
