program project1;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

uses
  heaptrc,
  Unix,
  Strings,
  ctypes,
  xlib,
  x,
  xresource,
  XmXm,
  XmXmStrDefs,
  XmPushB,
  XmPushBG,
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
  XmList,
  XmScrolledW,
  XmDrawingA,
  XmArrowBG,
  XmAtomMgr,
  XmScale,
  xmCutPaste,

  XmCommand,
  XmText,
  XTComposite,
  XTCore,
  XTIntrinsic;

const
  fallbacks: array of PChar = ('*fontList:9x15=MY_TAG1,*fontList:5x7=MY_TAG2,*fontList:5x7=MY_TAG3', nil);


  procedure main(argc: longint; argv: PPChar);
  var
    rowcol, btn, toplevel: TWidget;
    app: TXtAppContext;
    Text: TXmString;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, PXtString(fallbacks),
      nil);


    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      nil);

    Text := XmStringCreate('Testing, testing...', 'MY_TAG1');
    btn := XtVaCreateManagedWidget('button1', xmPushButtonWidgetClass, rowcol,
      XmNlabelString, Text,
      nil);
    XmStringFree(Text);

    Text := XmStringCreate('Testing, testing...', 'MY_TAG2');
    btn := XtVaCreateManagedWidget('button2', xmPushButtonWidgetClass, rowcol,
    XmNlabelString, Text,
      nil);
    XmStringFree(Text);

    Text := XmStringCreate('Testing, testing...', 'MY_TAG3');
    btn := XtVaCreateManagedWidget('button2', xmPushButtonWidgetClass, rowcol,
    XmNlabelString, Text,
      nil);
    XmStringFree(Text);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
