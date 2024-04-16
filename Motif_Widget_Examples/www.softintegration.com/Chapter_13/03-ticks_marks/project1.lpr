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
  Xm, XT;

const
  MAX_VAL = 10;

  procedure new_value(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmScaleCallbackStruct;
  begin
    cbs := PXmScaleCallbackStruct(call_data);
    WriteLn(XtName(w), ': ', cbs^.Value / 100:10:2);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol, scale: TWidget;
    app: TXtAppContext;
    arglist: TXtVarArgsList;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    rowcol := XtVaCreateManagedWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      XmNorientation, XmHORIZONTAL,
      nil);

    scale := XtVaCreateManagedWidget('load', xmScaleWidgetClass, rowcol,
      XtVaTypedArg, XmNtitleString, XmRString, PChar('Process Load'), 0,
      XmNmaximum, MAX_VAL * 100,
      XmNminimum, 100,
      XmNvalue, 100,
      XmNdecimalPoints, 2,
      XmNshowValue, True,
      nil);
    XtAddCallback(scale, XmNvalueChangedCallback, @new_value, nil);
    XtAddCallback(scale, XmNdragCallback, @new_value, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
