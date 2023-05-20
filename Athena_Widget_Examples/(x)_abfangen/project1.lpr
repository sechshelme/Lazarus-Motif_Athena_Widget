program project1;

uses
  Strings,
  ctypes,
  xlib,
  xatom,
  XmuAtoms,
  xresource,
  x,
  xutil,
  XawCommand,
  XTStringdefs,
  XawTextSrc,
  XawLabel,
  XawDialog,
  XawBox,
  XawCardinals,
  XawText,
  XawAsciiText,
  XawForm,
  XawAsciiSrc,
  XtShell,
  XTIntrinsic;

  procedure quit(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt(0);
  end;

  procedure main;
  var
    app: TXtAppContext;
    top, btn: TWidget;
    wm_delete_window: TAtom;
  begin
    top := XtVaAppInitialize(@app, 'dXClipboard', nil, 0, @argc, argv, nil,
      XtNwidth, 320, XtNheight, 200,
      nil);

    btn := XtVaCreateManagedWidget('Quit', commandWidgetClass, top,
      nil);
    XtAddCallback(btn, XtNcallback, @quit, nil);

    XtRealizeWidget(top);

    wm_delete_window := XInternAtom(XtDisplay(top), 'WM_DELETE_WINDOW', False);
    XSetWMProtocols(XtDisplay(top), XtWindow(top), @wm_delete_window, 1);

    XtAppMainLoop(app);
  end;

begin
  main;
end.
