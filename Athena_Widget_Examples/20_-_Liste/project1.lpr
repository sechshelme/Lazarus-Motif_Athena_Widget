program project1;

uses
  xlib,
  x,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XawList,
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
    XtVaSetValues(label1, XtNlabel, PChar(s),nil);
  end;

const
  ListData: array of PChar = (
    'abcabcabcabc', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'Ich bin ein sehr langer Text',
    'abc', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'def', 'ghi', 'jkl', 'Ich bin ein sehr langer Text');

  procedure ListSet3(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    list1: TWidget;
  begin
    list1 := TWidget(client_data);
    XawListHighlight(list1, 3);
  end;

  procedure ListClearHiglight(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    list1: TWidget;
  begin
    list1 := TWidget(client_data);
    XawListUnhighlight(list1);
  end;

  procedure ListShowSelect(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    sl: PXawListReturnStruct;
    list1: TWidget;
  begin
    list1 := TWidget(client_data);
    sl := XawListShowCurrent(list1);

    XtVaSetValues(label1, XtNlabel, sl^._string, nil);

    WriteLn('String: ', sl^._string);
    WriteLn('Iterm:  ', sl^.list_index);
    XFree(sl);
  end;


  procedure main;
  var
    toplevel, box, BtnListSet3, BtnListCleraHiglight,
    List1, BtnListShowSelect: TWidget;
    app: TXtAppContext;
  begin
    toplevel := XtVaAppInitialize(@app, 'noname', nil, 0, @argc, argv, nil, XtNwidth, 640, XtNheight, 400, nil);

    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    List1 := XtVaCreateManagedWidget('Liste', listWidgetClass, Box,
      XtNborderColor, $FF0000,
      XtNforeground, $FF88FF,
      XtNbackground, $88FF88,
      XtNwidth, 100,
      //      XtNdefaultColumns, 15,
      XtNverticalList, True,
      nil);

    //    XawListChange(list1, @ListData[0], Length(ListData), 50, True);
    XawListChange(list1, PPChar(ListData), Length(ListData), 50, True);

    BtnListSet3 := XtCreateManagedWidget('List Set 3', commandWidgetClass, box, nil, 0);
    XtAddCallback(BtnListSet3, XtNcallback, @ListSet3, list1);

    BtnListCleraHiglight := XtCreateManagedWidget('List Clear Higlight', commandWidgetClass, box, nil, 0);
    XtAddCallback(BtnListCleraHiglight, XtNcallback, @ListClearHiglight, list1);

    BtnListShowSelect := XtCreateManagedWidget('List Show Select', commandWidgetClass, box, nil, 0);
    XtAddCallback(BtnListShowSelect, XtNcallback, @ListShowSelect, list1);

    //
    //    button2 := XtCreateManagedWidget('Buttton 2', commandWidgetClass, box, nil, 0);
    //    XtVaSetValues(button2, XtNbackground, $FF8888, XtNname, PChar('1234'), nil);
    //    XtAddCallback(button2, XtNcallback, @On_Click, nil);
    //
    //    button3 := XtCreateManagedWidget('Buttton 3', commandWidgetClass, box, nil, 0);
    //    XtAddCallback(button3, XtNcallback, @On_Click, nil);

    label1 := XtCreateManagedWidget('', labelWidgetClass, box, nil, 0);
    XtVaSetValues(label1, XtNborderWidth, 0, XtNforeground, $FF0000, nil);

    XtRealizeWidget(toplevel);
    //  XtMainLoop;
    XtAppMainLoop(app);
  end;

begin
  main;
end.
