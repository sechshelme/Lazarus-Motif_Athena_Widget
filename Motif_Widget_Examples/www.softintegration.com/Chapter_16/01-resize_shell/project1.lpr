program project1;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

uses
  heaptrc,
  Unix,
  BaseUnix,
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
  XmScale,
  XmFileSB,

  XmCommand,
  XmText,
  XTComposite,
  XTCore,
  XTIntrinsic;

var
  passwd: PChar = nil;

  procedure getsize(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    Width, Height: TDimension;
    shell: TWidget;
  begin
    shell := TWidget(client_data);
    XtVaGetValues(shell,
      XmNwidth, @Width,
      XmNheight, @Height,
      nil);
    WriteLn('Width = ', Width, ', Height = ', Height);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, btn: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      XmNminWidth, 75,
      XmNminHeight, 25,
      XmNmaxWidth, 150,
      XmNmaxHeight, 100,
      XmNbaseWidth, 5,
      XmNbaseHeight, 5,
      XmNwidthInc, 5,
      XmNheightInc, 5,
      nil);

    btn := XtVaCreateManagedWidget('Print Size', xmPushButtonWidgetClass, toplevel, nil);
    XtAddCallback(btn, XmNactivateCallback, @getsize, toplevel);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
