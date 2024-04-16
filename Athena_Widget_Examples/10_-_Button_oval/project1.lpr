program project1;

uses
  Xaw, XT;

// https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html

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
    XtVaSetValues(label1,
      XtNlabel, PChar(s),
      nil);
  end;

  procedure main;
  var
    toplevel, button1, button2, box, button3, button0: TWidget;
    app: TXtAppContext;
  begin
    toplevel := XtVaAppInitialize(@app, 'snoname', nil, 0, @argc, argv, nil, XtNwidth, 320, XtNheight, 200, nil);

    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    button0 := XtVaCreateManagedWidget('Button 0', commandWidgetClass, box,
      XtNborderWidth, 5,
      XtNshapeStyle, XawShapeRectangle,
      nil);
    XtAddCallback(button0, XtNcallback, @On_Click, nil);

    button1 := XtVaCreateManagedWidget('Button 1', commandWidgetClass, box,
      XtNborderWidth, 5,
      XtNshapeStyle, XawShapeOval,
      nil);
    XtAddCallback(button1, XtNcallback, @On_Click, nil);

    button2 := XtVaCreateManagedWidget('Button 2', commandWidgetClass, box,
      XtNborderWidth, 5,
      XtNshapeStyle, XawShapeEllipse,
      XtNbackground, $FF8888,
      nil);
    XtAddCallback(button2, XtNcallback, @On_Click, nil);

    button3 := XtVaCreateManagedWidget('Button 3', commandWidgetClass, box,
      XtNborderWidth, 5,
      XtNshapeStyle, XawShapeRectangle,
      nil);

    label1 := XtVaCreateManagedWidget('', labelWidgetClass, box,
      XtNborderWidth, 0, XtNforeground, $FF0000,
      nil);

    XtRealizeWidget(toplevel);
    //  XtMainLoop;
    XtAppMainLoop(app);
  end;

begin
  main;
end.
