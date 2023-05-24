program project1;

uses
  x,
  xlib,
  unixtype,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XTIntrinsic;

type
  TxbmMask = record
    Width, Height: cuint;
    bits: array of byte;
  end;

  // Source: /usr/lib/tkdesk/images/xbm/hand.xbm

const
  cup: TxbmMask = (Width: 32; Height: 32; bits: (
    $00, $08, $00, $00, $00, $20, $00, $00, $00, $c1, $01, $00,
    $00, $01, $01, $00, $00, $02, $01, $00, $00, $84, $01, $00,
    $00, $58, $00, $00, $00, $50, $00, $00, $00, $ff, $07, $00,
    $c0, $90, $18, $00, $20, $6e, $23, $00, $60, $ef, $37, $00,
    $a0, $df, $ef, $03, $20, $fc, $23, $04, $20, $00, $e0, $09,
    $20, $00, $20, $12, $20, $00, $20, $14, $20, $00, $20, $14,
    $20, $00, $20, $14, $20, $00, $20, $14, $20, $00, $20, $14,
    $20, $00, $20, $14, $20, $00, $20, $12, $20, $00, $20, $09,
    $20, $00, $e0, $04, $20, $00, $20, $02, $20, $00, $e0, $01,
    $20, $00, $20, $00, $20, $00, $20, $00, $40, $00, $10, $00,
    $80, $01, $0c, $00, $00, $fe, $03, $00));

  hand: TxbmMask = (Width: 16; Height: 16; bits: (
    $80, $01, $58, $0e, $64, $12, $64, $52, $48, $b2, $48, $92,
    $16, $90, $19, $80, $11, $40, $02, $40, $04, $40, $04, $20,
    $08, $20, $10, $10, $20, $10, $20, $10));


var
  button1, button2, box, button3: TWidget;
  toplevel, label1: TWidget;

  function CreatePixmap(xmb: TxbmMask; fg, hg: cint): TPixmap;
  var
    dis: PDisplay;
    rootWin: TWindow;
    scr: cint;
  begin
    dis := XtDisplay(box);
    scr := DefaultScreen(dis);
    rootWin := XRootWindow(dis, scr);
    Result := XCreatePixmapFromBitmapData(dis, rootWin, PChar(xmb.bits), xmb.Width, xmb.Height, fg, hg, DefaultDepth(dis, scr));
  end;

  procedure On_Click(w: TWidget; client: TXtPointer; call: TXtPointer); cdecl;
  var
    Caption: PChar;
    s: string;
  begin
    XtVaGetValues(w, XtNlabel, @Caption, nil);
    s := 'Es wurde der Button: "' + Caption + '" gedrueckt';
    WriteLn(s);
    XtVaSetValues(label1, XtNlabel, PChar(s), nil);
  end;

  procedure main;
  var
    app: TXtAppContext;
    bitHand, bitCup: TPixmap;
  begin
    toplevel := XtVaAppInitialize(@app, 'xxXCalc', nil, 0, @argc, argv, nil, XtNwidth, 320, XtNheight, 200, nil);

    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);

    bitHand := CreatePixmap(hand, $88FF88, $FF8888);
    bitCup := CreatePixmap(cup, $FFFF88, $FF88FF);

    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    button1 := XtVaCreateManagedWidget('Button 1', commandWidgetClass, box,
      XtNborderWidth, 20,
      XtNshapeStyle, XawShapeOval,
      XtNbackgroundPixmap, bitHand,
      XtNborderPixmap, bitCup,

      XtNshapeStyle, XawShapeOval,
      nil);
    XtAddCallback(button1, XtNcallback, @On_Click, nil);

    button2 := XtVaCreateManagedWidget('Button 2'#10'Button 2', commandWidgetClass, box,
      XtNbackground, $FF8888,
      XtNlabel, 'Hello World !'#10'Hallo Welt',
      XtNborderWidth, 20,
      XtNbackgroundPixmap, bitHand,
      XtNborderPixmap, bitCup,

      XtNshapeStyle, XawShapeEllipse,
      XtNname, PChar('1234'),
      nil);
    XtAddCallback(button2, XtNcallback, @On_Click, nil);

    button3 := XtVaCreateManagedWidget('Button 3', commandWidgetClass, box,
      XtNbackgroundPixmap, bitHand,
      nil);
    XtAddCallback(button3, XtNcallback, @On_Click, nil);

    label1 := XtVaCreateManagedWidget('', labelWidgetClass, box, nil,
      XtNborderWidth, 0,
      XtNforeground,
      $FF0000, nil);

    XtRealizeWidget(toplevel);
    //  XtMainLoop;
    XtAppMainLoop(app);
  end;

begin
  main;
end.
