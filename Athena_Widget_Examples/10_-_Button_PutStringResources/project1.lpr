program project1;

uses
  ctypes,
  x,
  xlib,
  xresource,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XTIntrinsic;

// https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html

type
  PMyDisplay = ^TMyDisplay;

  TMyDisplay = record
    ext_data: PXExtData;
    private1: PXPrivate;
    fd: cint;
    pr2: cint;
    roto_major_version: cint;
    roto_minor_version: cint;
    vendor: PChar;
    private3: TXID;
    private4: TXID;
    private5: TXID;
    private6: longint;
    resource_alloc:
    function(para1: PXDisplay): TXID; cdecl;
    byte_order: cint;
    bitmap_unit: cint;
    bitmap_pad: cint;
    bitmap_bit_order: cint;
    nformats: cint;
    pixel_format: PScreenFormat;
    private8: cint;
    Release: cint;
    private9, private10: PXPrivate;
    qlen: cint;
    last_request_read: culong;
    request: culong;
    private11: TXPointer;
    private12: TXPointer;
    private13: TXPointer;
    private14: TXPointer;
    max_request_size: cunsigned;
    db: PXrmDatabase;
    private15:
    function(para1: PXDisplay): longint; cdecl;
    display_name: PChar;
    default_screen: cint;
    nscreens: cint;
    screens: PScreen;
    motion_buffer: culong;
    private16: culong;
    min_keycode: cint;
    max_keycode: cint;
    private17: TXPointer;
    private18: TXPointer;
    private19: cint;
    xdefaults: PChar;
  end;



var
  label1: TWidget;

  procedure On_Click(w: TWidget; client: TXtPointer; call: TXtPointer); cdecl;
  var
    Caption: PChar;
    s: string;
  begin
    XtVaGetValues(w, XtNlabel, @Caption, nil);
    s := 'Es wurde der Button: "' + Caption + '" gedrueckt';
    WriteLn(s);
    XtVaSetValues(label1, XtNlabel, PChar(s));
  end;

  procedure main;
  const
    Count = 16;
  var
    toplevel, box: TWidget;
    app: TXtAppContext;
    dpy: PDisplay;
    Mydpy: PMyDisplay absolute dpy;
    button: array of TWidget;
    i: integer;
    s: string;
  begin
    toplevel := XtVaAppInitialize(@app, 'myapp', nil, 0, @argc, argv, nil,
          XtNwidth, 640, XtNheight, 400,
      nil);

    dpy := XtDisplay(toplevel);
    XrmPutStringResource(@Mydpy^.db, '*box*background', 'Green');
    XrmPutStringResource(@Mydpy^.db, '*box*foreground', 'red');
    XrmPutStringResource(@Mydpy^.db, '*box*borderColor', 'blue');
    XrmPutStringResource(@Mydpy^.db, '*box*Button*background', 'yellow');
    XrmPutStringResource(@Mydpy^.db, '*box*ShapeStyle', 'Ellipse');
    XrmPutStringResource(@Mydpy^.db, '*box*borderWidth', '10');


    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    SetLength(button, Count);
    for i := 0 to Count - 1 do begin
      str(i: 3, s);
      button[i] := XtVaCreateManagedWidget('Button', commandWidgetClass, box,
        XtNlabel, PChar('Button ' + s),
        nil);
      XtAddCallback(button[i], XtNcallback, @On_Click, nil);
    end;

    label1 := XtVaCreateManagedWidget('', labelWidgetClass, box,
      XtNborderWidth, 0, XtNforeground, $FF0000,
      nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main;
end.
