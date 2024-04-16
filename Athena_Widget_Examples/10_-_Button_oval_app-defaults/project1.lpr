program project1;

uses
Xaw, XT;

// http://users.polytech.unice.fr/~buffa/cours/X11_Motif/cours/XmAppDefaults.html

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
    XtVaSetValues(label1, XtNlabel, PChar(s), nil);
  end;

  procedure main;
  var
    toplevel, button1, button2, box, button3, button0: TWidget;
    app: TXtAppContext;
  begin
    //    toplevel := XtVaAppInitialize(@app, 'myapp', nil, 0, @argc, argv, nil, XtNwidth, 320, XtNheight, 200, nil);
    toplevel := XtVaAppInitialize(@app, 'xXClipboard', nil, 0, @argc, argv, nil, XtNwidth, 320, XtNheight, 200, nil);
    //    toplevel := XtVaAppInitialize(@app, 'noname', nil, 0, @argc, argv, nil, XtNwidth, 320, XtNheight, 200, nil);

    box := XtVaCreateManagedWidget('box', boxWidgetClass, toplevel,
      XtNorientation, XtEhorizontal,
      nil);

    button0 := XtVaCreateManagedWidget('Button0', commandWidgetClass, box,
      nil);
    XtAddCallback(button0, XtNcallback, @On_Click, nil);

    button1 := XtVaCreateManagedWidget('delete', commandWidgetClass, box,
      XtNborderWidth, 5,
      XtNshapeStyle, XawShapeOval,
      nil);
    XtAddCallback(button1, XtNcallback, @On_Click, nil);

    button2 := XtVaCreateManagedWidget('Buttton 2', commandWidgetClass, box,
      XtNbackground, $FF8888,
      nil);
    XtAddCallback(button2, XtNcallback, @On_Click, nil);

    button3 := XtVaCreateManagedWidget('Buttton 3', commandWidgetClass, box,
      nil);

    label1 := XtVaCreateManagedWidget('', labelWidgetClass, box,
      XtNborderWidth, 0,
      XtNforeground, $FF0000,
      nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main;
end.
