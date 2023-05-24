program project1;

uses
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawForm,
  XTIntrinsic;

// https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html

  procedure On_Click(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    Caption: PChar;
    s: string;
  begin
    XtVaGetValues(w, XtNlabel, @Caption, nil);
    s := 'Es wurde der Button: '#10'"' + Caption + '" gedrueckt';
    WriteLn(XtName(w));
    WriteLn(s);
    XtVaSetValues(TWidget(client_data), XtNlabel, PChar(s),nil);
  end;

  procedure main;
  var
    toplevel, button1, button2, box, button3, label1, label2: TWidget;
    app: TXtAppContext;
  begin
    toplevel := XtVaAppInitialize(@app, 'noname', nil, 0, @argc, argv, nil,
      XtNwidth, 320,
      XtNheight, 200,
      nil);

    box := XtVaCreateManagedWidget('box', formWidgetClass, toplevel,
      XtNbackground, $FFFFCC,
      nil);

    label1 := XtVaCreateManagedWidget('Bitte druecke eine Taste', labelWidgetClass, box,
      XtNborderWidth, 0,
      XtNforeground, $FF0000,
      XtNwidth, 320,
      XtNheight, 20,
      XtNbackground, $FFFF88,
      XtNtop, XtChainTop,
      XtNbottom, XtChainTop,
      XtNleft, XtChainLeft,
      XtNright, XtChainRight,
      nil);

    button1 := XtVaCreateManagedWidget('Buttton 1', commandWidgetClass, box,
      XtNbackground, $88FF88,
      XtNborderColor, $448844,
      XtNborderWidth, 3,
      XtNfromVert,label1,
      XtNtop, XtChainTop,
      XtNbottom, XtChainTop,
      XtNleft, XtChainLeft,
      XtNright, XtChainLeft,
      nil);

    button2 := XtVaCreateManagedWidget('Buttton 2', commandWidgetClass, box,
      XtNbackground, $FF8888,
      XtNborderColor, $884444,
      XtNborderWidth, 3,
      XtNfromVert,label1,
      XtNfromHoriz,button1,
      XtNtop, XtChainTop,
      XtNbottom, XtChainTop,
      XtNleft, XtChainLeft,
      XtNright, XtChainLeft,
      nil);

    button3 := XtVaCreateManagedWidget('Buttton 3', commandWidgetClass, box,
      XtNbackground, $8888FF,
      XtNborderColor, $444488,
      XtNborderWidth, 3,
      XtNfromVert,label1,
      XtNfromHoriz,button2,
      XtNtop, XtChainTop,
      XtNbottom, XtChainTop,
      XtNleft, XtChainLeft,
      XtNright, XtChainLeft,
      nil);

    label2 := XtVaCreateManagedWidget('', labelWidgetClass, box,
      XtNborderWidth, 0,
      XtNforeground, $008800,
      XtNwidth, 320,
      XtNheight, 20,
      XtNbackground, $FFFF88,
      XtNfromVert,button1,
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
