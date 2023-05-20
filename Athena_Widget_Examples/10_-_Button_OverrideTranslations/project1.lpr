program project1;

uses
  x,
  xlib,
  ctypes,
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

  procedure resize(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    WriteLn('resize');
  end;

  procedure enter(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    WriteLn('enter');
  end;

  procedure leave(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    WriteLn('leave');
  end;

  procedure button_click(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    WriteLn('button click');
  end;

  procedure BtnDown(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  var
    i: integer;
  begin
    WriteLn('Down');
    WriteLn(num_params^);
    for i := 0 to num_params^ - 1 do begin
      WriteLn(params[i]);
    end;
  end;

  procedure BtnUp(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    WriteLn('Up');
  end;

  procedure Press_x(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    WriteLn('Press (x)');
  end;

  procedure quit(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt(0);
  end;

  procedure main;
  const
    rec: array of TXtActionsRec = nil;
  var
    toplevel, button1, button2, box, button3, button_quit: TWidget;
    app: TXtAppContext;
    trans: TXtTranslations;
    wm_delete_window, wm_protocols: TAtom;
    dis: PDisplay;
    scr: cint;
    rootWin: TWindow;
  begin
    toplevel := XtVaAppInitialize(@app, 'myapp', nil, 0, @argc, argv, nil,
      XtNwidth, 320, XtNheight, 200,
      nil);

    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    dis := XtDisplay(box);
    scr := DefaultScreen(dis);
    rootWin := XRootWindow(dis, scr);

    SetLength(rec, 7);
    rec[0]._string := PChar('resize');
    rec[0].proc := @resize;
    rec[1]._string := PChar('enter');
    rec[1].proc := @enter;
    rec[2]._string := PChar('leave');
    rec[2].proc := @leave;
    rec[3]._string := PChar('btn1down');
    rec[3].proc := @BtnDown;
    rec[4]._string := PChar('btn1up');
    rec[4].proc := @BtnUp;
    rec[5]._string := PChar('quit');
    rec[5].proc := @Press_x;
    rec[6]._string := PChar('test');
    rec[6].proc := @button_click;

    XtAppAddActions(app, @rec[0], Length(rec));


    trans := XtParseTranslationTable(
      '<ConfigureNotify>: resize()'#10 +
      '<EnterNotify>: enter()'#10 +
      '<LeaveNotify>: leave()'#10 +

      //      '<Btn1Down>: btn1down()'#10 +
      //      '<Btn1Up>: btn1up()'#10 +

      '<Btn1Down>,<Btn1Up>: btn1down(abc,def,ghi) btn1up() test()'#10 +
      '<Btn3Down>,<Btn3Up>: btn1down(rechts) btn1up() test()'#10 +

      //'#override <Btn2Down>: btn1down(rechte_taste)'#10 +
      //'#btn1 <Btn1Down>: btn1down(rechte_taste)'#10 +


      //     'btn1.translations:    #override'#10+
      //        '<Btn1Down>,<Btn1Up>:test() unset()'#10 +
      '<Key>Return: test()');
    XtOverrideTranslations(box, trans);

    button1 := XtVaCreateManagedWidget('btn1', commandWidgetClass, box,
      XtNlabel, 'Button 1',
      nil);
    //    XtAddCallback(button1, XtNcallback, @On_Click, nil);

    button2 := XtVaCreateManagedWidget('btn2', commandWidgetClass, box,
      XtNbackground, $FF8888,
      XtNlabel, 'Button 2',
      nil);
    XtVaSetValues(button2, XtNname, PChar('1234'), nil);
    XtAddCallback(button2, XtNcallback, @On_Click, nil);

    button3 := XtVaCreateManagedWidget('btn3', commandWidgetClass, box,
      XtNlabel, 'Button 3',
      nil);
    XtAddCallback(button3, XtNcallback, @On_Click, nil);

    XtOverrideTranslations(button1, XtParseTranslationTable(
                  '<Btn1Down>,<Btn1Up>:btn1down(Buttton_1)'));
    XtOverrideTranslations(button2, XtParseTranslationTable(
                  '<Btn1Down>,<Btn1Up>:btn1down(Buttton_2)'));
    XtOverrideTranslations(button3, XtParseTranslationTable(
                  '<Btn1Down>,<Btn1Up>:btn1down(Buttton_3)'));


    button_quit := XtVaCreateManagedWidget('quit', commandWidgetClass, box,
      XtNlabel, 'Quit',
      nil);
    XtAddCallback(button_quit, XtNcallback, @quit, nil);

    label1 := XtCreateManagedWidget('', labelWidgetClass, box, nil, 0);
    XtVaSetValues(label1, XtNborderWidth, 0, XtNforeground, $FF0000, nil);

    XtRealizeWidget(toplevel);

    wm_delete_window := XInternAtom(XtDisplay(toplevel), 'WM_DELETE_WINDOW', False);
    XSetWMProtocols(XtDisplay(toplevel), XtWindow(toplevel), @wm_delete_window, 1);

    XtOverrideTranslations(toplevel, XtParseTranslationTable(
      '<Message>WM_PROTOCOLS: quit()'));


    XtAppMainLoop(app);
  end;

begin
  main;
end.
