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

var
  label1: TWidget;

  procedure On_Click(w: TWidget; client: TXtPointer; call: TXtPointer); cdecl;
  var
    Caption: PChar;
    s: string;
  begin
    XtVaGetValues(w, XtNlabel, @Caption, nil);
    s := 'Es wurde der Button: "' + Caption + '" gedrückt';
    WriteLn(s);
    XtVaSetValues(label1, XtNlabel, PChar(s), nil);
  end;

const
  fallback: array of PChar = (
    '*box*background:Green',
    '*box*international: true',
    '*box*foreground: red',
    '*box*borderColor: blue',
    '*box*button*background: yellow',
    '*box*ShapeStyle: Ellipse',
    '*box*borderWidth: 10',
    nil);

  procedure main;
  const
    Count = 16;
  var
    toplevel, box: TWidget;
    app: TXtAppContext;
    button: array of TWidget = nil;
    i: integer;
    s: string;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'myapp', nil, 0, @argc, argv, PPChar(fallback),
      XtNwidth, 640,
      XtNheight, 400,
      nil);

    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    SetLength(button, Count);
    for i := 0 to Count - 1 do begin
      str(i: 3, s);
      button[i] := XtVaCreateManagedWidget('button', commandWidgetClass, box,
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
