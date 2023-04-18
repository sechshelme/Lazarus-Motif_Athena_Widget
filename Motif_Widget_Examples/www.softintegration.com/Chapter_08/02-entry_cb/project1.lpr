program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  XmXm,
  XmXmStrDefs,
  XmPushB,
  XmMainW,
  XmRowColumn,
  XmMessageB,
  XmSelectioB,
  XmDialogS,
  XmPanedW,
  XmLabelG,
  XmTextF,
  XmForm,
  XmBulletinB,

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

const
  corners: array of PChar = ('Null','Eins', 'Zwei', 'Drei', 'Vier', 'Fünf', 'Sechs', 'Sieben', 'Acht', 'Neun', 'Zehn');

  procedure called(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmRowColumnCallbackStruct;
    bp: TWidget;
  begin
    cbs := PXmRowColumnCallbackStruct(call_data);
    bp := cbs^.widget;
    WriteLn(XtName(bp), ': ', PtrInt( cbs^.Data));
  end;

  procedure never_called(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    WriteLn('This function is never called');
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, parent, w: TWidget;
    app: TXtAppContext;
    i: PtrInt;

  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, XmNwidth, 320, nil);

    parent := XtVaCreateManagedWidget('rowcolums', xmRowColumnWidgetClass, toplevel, nil);

    XtAddCallback(parent, XmNentryCallback, @called, nil);

    for i := 0 to Length(corners) - 1 do begin
      w := XtVaCreateManagedWidget(corners[i], xmPushButtonWidgetClass, parent, nil);
      XtAddCallback(w, XmNactivateCallback, @never_called, Pointer(i));
    end;

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
