program project1;

uses
  CairoXlib,
  Cairo,
  XmForm,
  XmLabel,
  XmPushB,
  XmXm,
  XmXmStrDefs,
  XmDrawingA,
  XTIntrinsic,
  x,
  xlib,
  unixtype;

const
  Draw_Width: longint = 320;
  Draw_Height: longint = 200;


  procedure Paint(cs: Pcairo_surface_t);
  var
    c: Pcairo_t;
  begin
    c := cairo_create(cs);
    cairo_set_source_rgb(c, 0.5, 0.5, 1.0);
    cairo_rectangle(c, 10.0, 10.0, Draw_Width - 20, Draw_Height - 20);
    cairo_fill(c);
    cairo_set_source_rgb(c, 0.0, 0.0, 0.5);
    cairo_rectangle(c, 20.0, 20.0, Draw_Width - 40, Draw_Height - 40);
    cairo_fill(c);
    cairo_move_to(c, Draw_Width / 10, Draw_Height / 1.7);
    cairo_set_source_rgb(c, 1.0, 1.0, 0.0);
    cairo_set_font_size(c, Draw_Width / 10);
    cairo_show_text(c, 'Hello World !');
    cairo_show_page(c);
    cairo_destroy(c);
  end;

  procedure draw_event(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    win, root: TWindow;
    dis: PDisplay;
    x1, y1: cint;
    border_width, depth: cuint;
    cs: Pcairo_surface_t;

  begin
    win := XtWindow(w);
    dis := XtDisplay(w);

    XClearWindow(dis, win);
    XFlush(dis);

    XGetGeometry(dis, win, @root, @x1, @y1, @Draw_Width, @Draw_Height, @border_width, @depth);

    WriteLn(Draw_Width, 'x', Draw_Height);

    cs := cairo_xlib_surface_create(dis, win, DefaultVisual(dis, 0), Draw_Width, Draw_Height);

    Paint(cs);
  end;

  procedure click_quit(w: TWidget; client_data: TXtPointer;
    call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, button, draw, mainform, label1: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Hello', nil, 0, @argc, argv, nil,
      XmNtitle, 'Cairo Open Motif',
      nil);

    mainform := XtVaCreateManagedWidget('mainform', xmFormWidgetClass, toplevel,
      nil);

    label1 := XtVaCreateManagedWidget('Cairo - Demo', xmLabelWidgetClass, mainform,
      XmNleftAttachment, XmATTACH_FORM,
      XmNrightAttachment, XmATTACH_FORM,
      XmNtopAttachment, XmATTACH_FORM,
      nil);


    button := XtVaCreateManagedWidget('Quit', xmPushButtonWidgetClass, mainform,
      XmNleftAttachment, XmATTACH_FORM,
      XmNrightAttachment, XmATTACH_FORM,
      XmNbottomAttachment, XmATTACH_FORM,
      nil);

    draw := XtVaCreateManagedWidget('draw', xmDrawingAreaWidgetClass, mainform,
    XmNbackground,$FF88FF,
      XmNwidth, 320,
      XmNheight, 200,
      XmNtopAttachment, XmATTACH_WIDGET,
      XmNtopWidget, label1,
      XmNrightAttachment, XmATTACH_FORM,
      XmNleftAttachment, XmATTACH_FORM,
      XmNbottomAttachment, XmATTACH_WIDGET,
      XmNbottomWidget, button,
      nil);

    XtRealizeWidget(toplevel);

    XtAddCallback(button, XmNactivateCallback, @click_quit, nil);


    XtAddCallback(draw, XmNresizeCallback, @draw_event, nil);
    XtAddCallback(draw, XmNexposeCallback, @draw_event, nil);

    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
