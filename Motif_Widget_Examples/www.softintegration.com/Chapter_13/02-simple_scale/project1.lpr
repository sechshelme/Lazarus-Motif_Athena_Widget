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

  procedure new_value(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmScaleCallbackStruct;
  begin
    cbs := PXmScaleCallbackStruct(call_data);
    WriteLn(XtName(w), ': ', cbs^.Value);
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

    scale := XtVaCreateManagedWidget('Days', xmScaleWidgetClass, rowcol,
      XtVaTypedArg, XmNtitleString, XmRString, PChar('Days'), 0,
      XmNmaximum, 7,
      XmNminimum, 1,
      XmNvalue, 1,
      XmNshowValue, True,
      nil);
    XtAddCallback(scale, XmNvalueChangedCallback, @new_value, nil);


    scale := XtVaCreateManagedWidget('Weeks', xmScaleWidgetClass, rowcol,
      XtVaTypedArg, XmNtitleString, XmRString, PChar('Weeks'), 0,
      XmNmaximum, 52,
      XmNminimum, 1,
      XmNvalue, 1,
      XmNshowValue, True,
      nil);
    XtAddCallback(scale, XmNvalueChangedCallback, @new_value, nil);


    scale := XtVaCreateManagedWidget('Months', xmScaleWidgetClass, rowcol,
      XtVaTypedArg, XmNtitleString, XmRString, PChar('Months'), 0,
      XmNmaximum, 12,
      XmNminimum, 1,
      XmNvalue, 1,
      XmNshowValue, True,
      nil);
    XtAddCallback(scale, XmNvalueChangedCallback, @new_value, nil);


    scale := XtVaCreateManagedWidget('Years', xmScaleWidgetClass, rowcol,
      XtVaTypedArg, XmNtitleString, XmRString, PChar('Years'), 0,
      XmNmaximum, 20,
      XmNminimum, 1,
      XmNvalue, 1,
      XmNshowValue, True,
      nil);
    XtAddCallback(scale, XmNvalueChangedCallback, @new_value, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
