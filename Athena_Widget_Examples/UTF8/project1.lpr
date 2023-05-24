program project1;

uses
  ctypes,
  x,
  xlib,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawSme,
  XawForm,
  XTIntrinsic;

// https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html


  function setlocale(catogory: cint; locale: PChar): PChar cdecl; external 'c';

  procedure On_Click(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    Caption: PChar;
    s: string;
  begin
    XtVaGetValues(w, XtNlabel, @Caption, nil);
    s := 'Es wurde der Button: '#10'"' + Caption + '" gedrückt';
    WriteLn(XtName(w));
    WriteLn(s);
    XtVaSetValues(TWidget(client_data), XtNlabel, PChar(s), nil);
  end;

  function lang_proc(dis: PDisplay; xnl: TXtString; client_data: TXtPointer): TXtString; cdecl;
  const
    LC_ALL = 6;
  begin
    Result := setlocale(LC_ALL, 'de_DE.utf8');
  end;

  procedure main;
  var
    toplevel, button1, button2, box, button3, label1, label2: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, @lang_proc, nil);
    //    XtSetLanguageProc(nil, nil,nil);

    toplevel := XtVaAppInitialize(@app, 'noname', nil, 0, @argc, argv, nil,
      XtNwidth, 320,
      XtNheight, 200,
      nil);

    box := XtVaCreateManagedWidget('box', formWidgetClass, toplevel,
      XtNbackground, $FFCCFF,
      nil);

    label1 := XtVaCreateManagedWidget('Bitte drücke eine Taste', labelWidgetClass, box,
      XtNinternational, True,
      XtNborderWidth, 0,
      XtNforeground, $FF0000,
      XtNbackground, $FF88FF,
      XtNwidth, 320,
      XtNheight, 20,
      XtNtop, XtChainTop,
      XtNbottom, XtChainTop,
      XtNleft, XtChainLeft,
      XtNright, XtChainRight,
      nil);

    button1 := XtVaCreateManagedWidget('Buttton 1', commandWidgetClass, box,
      XtNinternational, True,
      XtNbackground, $88FF88,
      XtNborderColor, $448844,
      XtNborderWidth, 3,
      XtNfromVert, label1,
      XtNtop, XtChainTop,
      XtNbottom, XtChainTop,
      XtNleft, XtChainLeft,
      XtNright, XtChainLeft,
      nil);

    button2 := XtVaCreateManagedWidget('Buttton 2', commandWidgetClass, box,
      XtNinternational, True,
      XtNbackground, $FF8888,
      XtNborderColor, $884444,
      XtNborderWidth, 3,
      XtNfromVert, label1,
      XtNfromHoriz, button1,
      XtNtop, XtChainTop,
      XtNbottom, XtChainTop,
      XtNleft, XtChainLeft,
      XtNright, XtChainLeft,
      nil);

    button3 := XtVaCreateManagedWidget('Buttton 3', commandWidgetClass, box,
      XtNinternational, True,
      XtNbackground, $8888FF,
      XtNborderColor, $444488,
      XtNborderWidth, 3,
      XtNfromVert, label1,
      XtNfromHoriz, button2,
      XtNtop, XtChainTop,
      XtNbottom, XtChainTop,
      XtNleft, XtChainLeft,
      XtNright, XtChainLeft,
      nil);

    label2 := XtVaCreateManagedWidget('', labelWidgetClass, box,
      XtNinternational, True,
      XtNforeground, $FF0000,
      XtNbackground, $FF88FF,
      XtNborderWidth, 0,
      XtNwidth, 320,
      XtNheight, 20,
      XtNfromVert, button1,
      XtNtop, XtChainTop,
      XtNbottom, XtChainBottom,
      XtNleft, XtChainLeft,
      XtNright, XtChainRight,
      nil);

    XtAddCallback(button1, XtNcallback, @On_Click, label2);
    XtAddCallback(button2, XtNcallback, @On_Click, label2);
    XtAddCallback(button3, XtNcallback, @On_Click, label2);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main;
end.
