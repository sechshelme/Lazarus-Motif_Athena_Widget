program project1;

uses
  x,
  xlib,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawForm,
  XTIntrinsic;

// https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html
// https://lesstif.sourceforge.net/doc/super-ux/g1ae03e/part1/chap10.html

var
  label2: TWidget;

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

  procedure Print_ActionList(wc: TWidgetClass);
  var
    ActionList: TXtActionList;
    len: TCardinal;
    i: integer;
    p: Pointer;
    ch: PChar;
  begin
    p := wc;
    Inc(p, sizeof(PtrUInt));
    ch := PChar(p^);
    XtGetActionList(wc, @ActionList, @len);
    WriteLn('Widget Name: "', ch, '"   Count: ', len);
    for i := 0 to len - 1 do begin
      WriteLn(ActionList[i]._string);
    end;
  end;

  procedure OnBtnClick(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  var
    Caption: PChar;
    s: string;
  begin
    if num_params^ > 0 then begin
      WriteLn(params[0]);
      XtVaGetValues(w, XtNlabel, @Caption, nil);
      s := 'Es wurde der Button: '#10'"' + Caption + '" gedrueckt';
      WriteLn(XtName(w));
      WriteLn(s);
      XtVaSetValues(label2, XtNlabel, PChar(s));
    end;
  end;

  procedure OnBtnQuitClick(w: TWidget; event: PXEvent; params: PXtString; num_params: PCardinal); cdecl;
  begin
    Halt();
  end;

  procedure main;
  var
    toplevel, button1, button2, box, button3, label1, button_quit: TWidget;
    app: TXtAppContext;
    rec: TXtActionsRecs = nil;
  begin
    toplevel := XtVaAppInitialize(@app, 'bnoname', nil, 0, @argc, argv, nil,
      XtNwidth, 320,
      XtNheight, 200,
      nil);

    box := XtVaCreateManagedWidget('box', formWidgetClass, toplevel,
      XtNbackground, $FFFFCC,
      nil);

    AddActionsRec(rec, 'btn_quit', @OnBtnQuitClick);
    AddActionsRec(rec, 'btn_click', @OnBtnClick);
    XtAppAddActions(app, TXtActionList(rec), Length(rec));

    label1 := XtVaCreateManagedWidget('Bitte druecke eine Taste', labelWidgetClass, box,
      XtNborderWidth, 0,
      XtNforeground, $FF0000,
      XtNwidth, 320,
      XtNheight, 20,
      XtNbackground, $FFFF88,
      nil);

    button1 := XtVaCreateManagedWidget('btn1', commandWidgetClass, box,
      XtNlabel, 'Button 1',
      XtNfromVert, label1,
      XtNbackground, $88FF88,
      XtNborderColor, $448844,
      XtNborderWidth, 3,
      XtNtranslations, XtParseTranslationTable('#override <Btn1Down>,<Btn1Up>:btn_click(1) unset()'),
      nil);

    button2 := XtVaCreateManagedWidget('btn2', commandWidgetClass, box,
      XtNlabel, 'Button 2',
      XtNbackground, $FF8888,
      XtNborderColor, $884444,
      XtNborderWidth, 3,
      XtNfromHoriz, button1,
      XtNfromVert, label1,
      XtNtranslations, XtParseTranslationTable('#augment <Btn1Down>,<Btn1Up>:btn_click(2) unset()'),
      nil);

    button3 := XtVaCreateManagedWidget('btn3', commandWidgetClass, box,
      XtNlabel, 'Button 3',
      XtNbackground, $8888FF,
      XtNborderColor, $444488,
      XtNborderWidth, 3,
      XtNfromHoriz, button2,
      XtNfromVert, label1,
      XtNtranslations, XtParseTranslationTable('#augment <Btn1Down>,<Btn1Up>:btn_click(3) unset()'),
      nil);

    button_quit := XtVaCreateManagedWidget('quit', commandWidgetClass, box,
      XtNlabel, 'Quit',
      //      XtNbackground, $8888FF,
      //      XtNborderColor, $444488,
      XtNborderWidth, 3,
      XtNfromHoriz, button3,
      XtNfromVert, label1,
      XtNtranslations, XtParseTranslationTable('#augment <Btn1Down>,<Btn1Up>:btn_quit(3) unset()'),
      nil);

    label2 := XtVaCreateManagedWidget('', labelWidgetClass, box,
      XtNborderWidth, 0,
      XtNforeground, $008800,
      XtNwidth, 320,
      XtNheight, 20,
      XtNbackground, $FFFF88,
      XtNfromVert, button3,
      nil);

   Print_ActionList(commandWidgetClass);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main;
end.
