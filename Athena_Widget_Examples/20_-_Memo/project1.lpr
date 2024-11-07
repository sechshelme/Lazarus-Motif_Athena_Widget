program project1;

uses
  Xaw,
  XT;

  // https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html

  // https://www.perplexity.ai/search/gib-mir-ein-athena-widget-c-pr-ZkPHUvQmSzuDMNyrk24pHw

var
  memo, save_button, open_button, scan_button: TWidget;

  procedure On_Click(w: TWidget; client: TXtPointer; call: TXtPointer); cdecl;
  var
    Caption: pchar;
    s: pchar;
    size: TXawTextPosition;
  begin
    if w = save_button then begin
      WriteLn('save');
      XtVaGetValues(memo,
        XtNstring, @s,
        nil);
      WriteLn(s);
    end;
    if w = open_button then begin
      WriteLn('open');
    end;
    if w = scan_button then begin
      WriteLn('scan');
      size := XawTextSourceScan(XawTextGetSource(memo), 0, XawstAll, XawsdRight, 1, True);

      WriteLn('size: ', size);
    end;
  end;

  procedure main;
  var
    toplevel, form, button3: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'myapp', nil, 0, @argc, argv, nil,
      XtNwidth, 640,
      XtNheight, 480,
      XtNtitle, 'Mein Athena Fenster',
      nil);

    form := XtVACreateManagedWidget('box', formWidgetClass, toplevel, nil);
    XtVaSetValues(form, XtNorientation, XtEhorizontal, nil);

    memo := XtVaCreateManagedWidget('text', asciiTextWidgetClass, form,
      XtNeditType, XawtextEdit,
      XtNscrollVertical, XawtextScrollAlways,
      XtNfromVert, nil,
      XtNtop, XtChainTop,
      XtNbottom, XtChainBottom,
      XtNleft, XtChainLeft,
      XtNright, XtChainRight,
      XtNresizable, True,
      XtNstring, 'Hello World',
      nil);

    save_button := XtVaCreateManagedWidget('Button 1', commandWidgetClass, form,
      XtNlabel, 'Speichern',
      XtNfromVert, memo,
      XtNtop, XtChainBottom,
      XtNbottom, XtChainBottom,
      XtNleft, XtChainRight,
      XtNright, XtChainRight,
      XtNbackground, $88FF88,
      nil);
    XtAddCallback(save_button, XtNcallback, @On_Click, nil);

    open_button := XtVaCreateManagedWidget('Button 2', commandWidgetClass, form,
      XtNlabel, 'Öffnen',
      XtNfromVert, memo,
      XtNfromHoriz, save_button,
      XtNtop, XtChainBottom,
      XtNbottom, XtChainBottom,
      XtNleft, XtChainRight,
      XtNright, XtChainRight,
      XtNbackground, $FF8888,
      nil);
    XtAddCallback(open_button, XtNcallback, @On_Click, nil);

    scan_button := XtVaCreateManagedWidget('Button 3', commandWidgetClass, form,
      XtNlabel, 'scan',
      XtNfromVert, memo,
      XtNfromHoriz, open_button,
      XtNtop, XtChainBottom,
      XtNbottom, XtChainBottom,
      XtNleft, XtChainRight,
      XtNright, XtChainRight,
      XtNbackground, $FF8888,
      nil);
    XtAddCallback(scan_button, XtNcallback, @On_Click, nil);

    button3 := XtVaCreateManagedWidget('Button 3', commandWidgetClass, form,
      nil);
    XtAddCallback(button3, XtNcallback, @On_Click, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main;
end.
