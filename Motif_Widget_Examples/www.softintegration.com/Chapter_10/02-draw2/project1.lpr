program project1;

uses
  heaptrc,
  Unix,
  Strings,
  ctypes,
  xlib,
  x,
  Xm, XT;

const
  SWIDTH = 400;
  SHEIGHT = 300;

var
  pixmap: TPixmap;

  procedure drawin_area_callback(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  const
    x: cint = 0;
    y: cint = 0;
  var
    cbs: PXmDrawingAreaCallbackStruct;
    event: PXEvent;
    dpy: PDisplay;
    gc: TGC;
  begin
    cbs := PXmDrawingAreaCallbackStruct(call_data);
    event := cbs^.event;
    dpy := event^.xany.display;

    if cbs^.reason = XmCR_INPUT then begin
      WriteLn('input');
      if event^.xany._type = ButtonPress then begin
        x := event^.xbutton.x;
        y := event^.xbutton.y;
      end else if event^.xany._type = ButtonRelease then begin
        XtVaGetValues(w, XmNuserData, @gc, nil);
        XDrawLine(dpy, cbs^.window, gc, x, y, event^.xbutton.x, event^.xbutton.y);
        XDrawLine(dpy, pixmap, gc, x, y, event^.xbutton.x, event^.xbutton.y);
        x := event^.xbutton.x;
        y := event^.xbutton.y;
      end;
    end;

    if (cbs^.reason = XmCR_EXPOSE) or (cbs^.reason = XmCR_ACTIVATE) then begin
      if cbs^.reason = XmCR_ACTIVATE then begin
        w := XtParent(w);
      end;
      XtVaGetValues(w, XmNuserData, @gc, nil);
      if cbs^.reason = XmCR_ACTIVATE then begin
        XSetForeground(dpy, gc, WhitePixelOfScreen(XtScreen(w)));
        XFillRectangle(dpy, pixmap, gc, 0, 0, SWIDTH, SHEIGHT);
        XSetForeground(dpy, gc, BlackPixelOfScreen(XtScreen(w)));
      end;

      XCopyArea(dpy, pixmap, event^.xany.window, gc, 0, 0, SWIDTH, SHEIGHT, 0, 0);
    end;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, drawing_a, pb: TWidget;
    app: TXtAppContext;
    gc: TGC;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      XmNwidth, 320,
      XmNheight, 200,
      nil);

    drawing_a := XtVaCreateWidget('drawing_a', xmDrawingAreaWidgetClass, toplevel, nil);

    XtAddCallback(drawing_a, XmNinputCallback, @drawin_area_callback, nil);
    XtAddCallback(drawing_a, XmNexposeCallback, @drawin_area_callback, nil);

    gc := XCreateGC(XtDisplay(drawing_a), RootWindowOfScreen(XtScreen(drawing_a)), 0, nil);

    XtVaSetValues(drawing_a, XmNuserData, gc, nil);
    XSetForeground(XtDisplay(drawing_a), gc, WhitePixelOfScreen(XtScreen(drawing_a)));

    pixmap := XCreatePixmap(XtDisplay(drawing_a), RootWindowOfScreen(XtScreen(drawing_a)), SWIDTH, SHEIGHT, DefaultDepthOfScreen(XtScreen(drawing_a)));

    XFillRectangle(XtDisplay(drawing_a), pixmap, gc, 0, 0, SWIDTH, SHEIGHT);
    XSetForeground(XtDisplay(drawing_a), gc, BlackPixelOfScreen(XtScreen(drawing_a)));

    pb := XtVaCreateManagedWidget('Clear', xmPushButtonGadgetClass, drawing_a, nil);

    XtAddCallback(pb, XmNactivateCallback, @drawin_area_callback, nil);

    XtManageChild(drawing_a);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
