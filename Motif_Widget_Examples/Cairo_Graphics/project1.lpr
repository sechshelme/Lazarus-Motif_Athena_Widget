program project1;

uses
  CairoXlib,
  Cairo,
  XmPushB,
  XmXm,
  XmXmStrDefs,
  XmDrawingA,
  XTIntrinsic,
  x,
  xlib,
  unixtype;

const
  SIZEX: longint = 320;
  SIZEY: longint = 200;


  procedure Paint(cs: Pcairo_surface_t);
  var
    c: Pcairo_t;
  begin
    c := cairo_create(cs);
    cairo_set_source_rgb(c, 0.5, 0.5, 1.0);
    cairo_rectangle(c, 10.0, 10.0, SIZEX - 20, SIZEY - 20);
    cairo_fill(c);
    cairo_set_source_rgb(c, 0.0, 0.0, 0.5);
    cairo_rectangle(c, 20.0, 20.0, SIZEX - 40, SIZEY - 40);
    cairo_fill(c);
    cairo_move_to(c, 20.0, 20.0);
    cairo_set_source_rgb(c, 1.0, 1.0, 0.0);
    cairo_show_text(c, 'Hello World!');
    cairo_show_page(c);
    cairo_destroy(c);
  end;

  procedure draw_event(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    win, root: TWindow;
    dis: PDisplay;
    gc: TGC;
    x1, y1: cint;
    Width, Height, border_width, depth: cuint;
    cbs: PXmDrawnButtonCallbackStruct;
    cs: Pcairo_surface_t;

  begin
    cbs := PXmDrawnButtonCallbackStruct(call_data);


    Writeln('Hello Yourself!');
    win := XtWindow(w);
    dis := XtDisplay(w);
    gc := XCreateGC(dis, win, 0, nil);

    XClearWindow(dis,win);
    XFlush(dis);

    XGetGeometry(dis, win, @root, @x1, @y1, @Width, @Height, @border_width, @depth);
    SIZEX  :=Width;
    SIZEY  :=Height;

    cs := cairo_xlib_surface_create(dis, win, DefaultVisual(dis, 0), SIZEX, SIZEY);

    Paint(cs);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, button, draw: TWidget;
    app: TXtAppContext;
    label1: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Hello', nil, 0, @argc, argv, nil, nil);

    //  label1 := XmStringCreateLocalized('Push here to say hello');
    //    button := XtVaCreateManagedWidget('pushme', xmPushButtonWidgetClass, toplevel, XmNlabelString, label1, nil);
    //    XmStringFree(label1);

    draw := XtVaCreateManagedWidget('draw', xmDrawingAreaWidgetClass, toplevel,
      XmNwidth, 320,
      XmNheight, 320,
      nil);

    XtAddCallback(draw, XmNexposeCallback, @draw_event, nil);
    XtAddCallback(draw, XmNresizeCallback, @draw_event, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
