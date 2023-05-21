program project1;

uses
  sysutils,
  x,
  xlib,
  ctypes,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XTIntrinsic;

// https://www.x.org/releases/X11R7.7/doc/libXt/intrinsics.html
// Appendix B. Translation Table Syntax

var
  label1: TWidget = nil;

  procedure On_Button_Click(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  var
    Caption: PChar = nil;
    s: string;
  begin
    XtVaGetValues(w, XtNlabel, @Caption, nil);
    s := 'Es wurde der Button: "' + Caption + '" gedrueckt';
    XtVaSetValues(label1, XtNlabel, PChar(s), nil);
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

  procedure Press_Quit(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    if num_params^ > 0 then begin
      if params[0] = 'x' + '' then  begin
        WriteLn('Press (x)');
      end;
    end else begin
      WriteLn('Press Quit');
    end;
    Halt(0);
  end;

type
  TXtActionsRecs = array of TXtActionsRec;

  procedure AddActionsRec(var rec: TXtActionsRecs; Name: TXtString; proc: TXtActionProc);
  var
    len: SizeInt;
  begin
    len := Length(rec);
    SetLength(rec, len + 1);
    rec[len]._string := Name;
    rec[len].proc := proc;
  end;

  procedure dblClick(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    WriteLn('Doppel Klick');
  end;

  procedure main;
  const
    BTN_COUNT = 11;
  var
    rec: TXtActionsRecs = nil;
    toplevel, box, button_quit: TWidget;
    button: array of TWidget = nil;
    app: TXtAppContext;
    wm_delete_window, wm_protocols: TAtom;
    dis: PDisplay;
    i: integer;
    s:String;
  begin
    toplevel := XtVaAppInitialize(@app, 'myapp', nil, 0, @argc, argv, nil,
      XtNwidth, 320, XtNheight, 200,
      nil);

    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    dis := XtDisplay(box);

    AddActionsRec(rec, 'resize', @resize);
    AddActionsRec(rec, 'enter', @enter);
    AddActionsRec(rec, 'leave', @leave);
    AddActionsRec(rec, 'btn1click', @BtnDown);
    AddActionsRec(rec, 'btn1up', @BtnUp);
    AddActionsRec(rec, 'dblclick', @dblClick);
    AddActionsRec(rec, 'quit', @Press_Quit);
    AddActionsRec(rec, 'test', @button_click);
    AddActionsRec(rec, 'button_click', @On_Button_Click);

    XtAppAddActions(app, @rec[0], Length(rec));


    XtOverrideTranslations(box, XtParseTranslationTable(
      '<ConfigureNotify>: resize()'#10 +
      '<EnterNotify>: enter()'#10 +
      '<LeaveNotify>: leave()'#10 +

      '<Btn1Down>,<Btn1Up>: btn1click(abc,def,ghi) btn1up() test()'#10 +
      '<Btn3Down>,<Btn3Up>: btn1click(rechts) btn1up() test()'#10 +

      '<Btn1Up>(2): dblclick(abc,def,ghi)'#10 +

      '<Key>Return: test()'));

    SetLength(button,BTN_COUNT);
    for i := 0 to Length(button) - 1 do begin
      button[i] := XtVaCreateManagedWidget('btn1', commandWidgetClass, box,
        XtNlabel, PChar('Button '+i.ToString),
        XtNbackground, $FFFFFF div BTN_COUNT * i,
        nil);
      XtOverrideTranslations(button[i], XtParseTranslationTable('<Btn1Down>,<Btn1Up>:button_click()'));
    end;

    button_quit := XtVaCreateManagedWidget('quit', commandWidgetClass, box,
      XtNlabel, 'Quit',
      nil);
    XtOverrideTranslations(button_quit, XtParseTranslationTable('<Btn1Down>,<Btn1Up>:quit()'));

    label1 := XtCreateManagedWidget('', labelWidgetClass, box, nil, 0);
    XtVaSetValues(label1, XtNborderWidth, 0, XtNforeground, $FF0000, nil);

    XtRealizeWidget(toplevel);

    wm_delete_window := XInternAtom(XtDisplay(toplevel), 'WM_DELETE_WINDOW', False);
    XSetWMProtocols(XtDisplay(toplevel), XtWindow(toplevel), @wm_delete_window, 1);

    XtOverrideTranslations(toplevel, XtParseTranslationTable('<Message>WM_PROTOCOLS: quit(x)'));

    XtAppMainLoop(app);
  end;

begin
  main;
end.
