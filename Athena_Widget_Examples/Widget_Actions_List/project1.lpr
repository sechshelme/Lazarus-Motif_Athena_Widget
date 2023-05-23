program project1;

uses
  x,
  xlib,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawForm,
  XawScrollbar,
  XawAsciiText,
  XawDialog,
  XTIntrinsic;

// https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html
// https://lesstif.sourceforge.net/doc/super-ux/g1ae03e/part1/chap10.html

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
      WriteLn(i: 4, ': ', ActionList[i]._string);
    end;
  end;

  procedure OnQuit(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

  procedure main;
  var
    toplevel, box, button_quit: TWidget;
    app: TXtAppContext;
  begin
    toplevel := XtVaAppInitialize(@app, 'bnoname', nil, 0, @argc, argv, nil,
      XtNwidth, 320,
      XtNheight, 200,
      nil);

    box := XtVaCreateManagedWidget('box', formWidgetClass, toplevel,
      XtNbackground, $FFFFCC,
      nil);

    button_quit := XtVaCreateManagedWidget('quit', commandWidgetClass, box,
      XtNlabel, 'Quit',
      XtNborderWidth, 3,
      nil);

    XtAddCallback(button_quit, XtNcallback, @OnQuit, nil);

    Print_ActionList(commandWidgetClass);
    Print_ActionList(labelWidgetClass);
    Print_ActionList(formWidgetClass);
    Print_ActionList(scrollbarWidgetClass);
    Print_ActionList(asciiTextWidgetClass);
    Print_ActionList(dialogWidgetClass);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main;
end.
