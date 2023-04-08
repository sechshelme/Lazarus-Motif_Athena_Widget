program project1;

//{$MODESWITCH ADVANCEDRECORDS}
{$modeswitch typehelpers}

uses
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XTIntrinsic;

// https://www.oreilly.com/openbook/motif/vol6a/Vol6a_html/ch02.html

var
  label1: TWidget;

type
  TArgs = array of TArg;

  { TArgsHelper }

  TArgsHelper = type helper for TArgs
  public
    procedure Add(n: TXtString; i: ptrint);
    function Ptr: PArg;
    function Count: SizeInt;
  end;

  procedure TArgsHelper.Add(n: TXtString; i: ptrint);
  var
    l: SizeInt;
  begin
    l := Length(Self);
    SetLength(self, l + 1);
    self[l].valueI := i;
    self[l].Name := n;
  end;

  function TArgsHelper.Ptr: PArg;
  begin
    if Length(Self) = 0 then begin
      Result := nil;
    end else begin
      Result := @self[0];
    end;
  end;

  function TArgsHelper.Count: SizeInt;
  begin
    Result := Length(Self);
  end;


  procedure On_Click(w: TWidget; client: TXtPointer; call: TXtPointer); cdecl;
  var
    Caption: PChar;
    //    name:array[0..15] of Char;
    Name: PChar;
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
    argsta: array[0..7] of TArg;
    argdyn: TArgs = nil;
  begin
    toplevel := XtVaAppInitialize(@app, 'noname', nil, 0, @argc, argv, nil, XtNwidth, 320, XtNheight, 200, nil);

    box := XtCreateManagedWidget('box', boxWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    XtSetArg(argsta[0], XtNwidth, 100);
    XtSetArg(argsta[1], XtNheight, 33);
    XtSetArg(argsta[2], XtNbackground, $88FF88);
    XtSetArg(argsta[3], XtNforeground, $FFFFFF);

    button1 := XtCreateManagedWidget('Buttton 1', commandWidgetClass, box, argsta, 4);
    XtAddCallback(button1, XtNcallback, @On_Click, nil);

    button2 := XtCreateManagedWidget('Buttton 2', commandWidgetClass, box, nil, 0);
    XtVaSetValues(button2, XtNbackground, $FF8888, XtNname, PChar('1234'), nil);
    XtAddCallback(button2, XtNcallback, @On_Click, nil);

    argdyn.Add(XtNwidth, 75);
    argdyn.Add(XtNheight, 25);
    argdyn.Add(XtNbackground, $FF8888);
    argdyn.Add(XtNforeground, $FFFFFFF);

    button3 := XtCreateManagedWidget('Buttton 3', commandWidgetClass, box, argdyn.Ptr, argdyn.Count);

    XtAddCallback(button3, XtNcallback, @On_Click, nil);

    label1 := XtCreateManagedWidget('', labelWidgetClass, box, nil, 0);
    XtVaSetValues(label1, XtNborderWidth, 0, XtNforeground, $FF0000, nil);

    XtRealizeWidget(toplevel);
    //  XtMainLoop;
    XtAppMainLoop(app);
  end;

begin
  main;
end.
