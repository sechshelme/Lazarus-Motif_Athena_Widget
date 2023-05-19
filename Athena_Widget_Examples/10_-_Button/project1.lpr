program project1;

uses
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XTIntrinsic;

// https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html

var
  label1: TWidget;

  procedure On_Click(w: TWidget; client: TXtPointer; call: TXtPointer); cdecl;
  var
    Caption: PChar;
    //    name:array[0..15] of Char;
    Name: PChar = nil;
    s: string;
  begin
    XtVaGetValues(w, XtNlabel, @Caption, nil);
    XtVaGetValues(w, XtNname, Name, nil);
    s := 'Es wurde der Button: "' + Caption + '" gedrueckt';
    WriteLn(s);
    //    WriteLn(name);
    //    WriteLn(Length(name));
    XtVaSetValues(label1, XtNlabel, PChar(s));
  end;

  procedure main;
  var
    toplevel, button1, button2, box, button3: TWidget;
    app: TXtAppContext;
  begin
    toplevel := XtVaAppInitialize(@app, 'myapp', nil, 0, @argc, argv, nil, XtNwidth, 320, XtNheight, 200, nil);

    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    button1 := XtVaCreateManagedWidget('Button 1', commandWidgetClass, box,
      nil);
    XtAddCallback(button1, XtNcallback, @On_Click, nil);

    button2 := XtVaCreateManagedWidget('Button 2', commandWidgetClass, box,
      XtNbackground, $FF8888,
      nil);
    XtVaSetValues(button2, XtNname, PChar('1234'), nil);
    XtAddCallback(button2, XtNcallback, @On_Click, nil);

    button3 := XtVaCreateManagedWidget('Button 3', commandWidgetClass, box,
      nil);
    XtAddCallback(button3, XtNcallback, @On_Click, nil);

    label1 := XtCreateManagedWidget('', labelWidgetClass, box, nil, 0);
    XtVaSetValues(label1, XtNborderWidth, 0, XtNforeground, $FF0000, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main;
end.
