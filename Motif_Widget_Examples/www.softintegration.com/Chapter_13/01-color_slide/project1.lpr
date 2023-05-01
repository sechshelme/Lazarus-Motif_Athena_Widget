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
  XmScale,

  XmCommand,
  XmText,
  XTComposite,
  XTCore,
  XTIntrinsic;

var
  color: TXColor;
  colorWindow: TWidget;

  procedure new_value(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmScaleCallbackStruct;
    cmap: TColormap;
    rgb: PtrInt;
  begin
    rgb := PtrInt(client_data);
    cbs := PXmScaleCallbackStruct(call_data);
    cmap := XDefaultColormapOfScreen(XtScreen(w));
    case rgb of
      DoRed: begin
        color.red := cbs^.Value shl 8;
      end;
      DoGreen: begin
        color.green := cbs^.Value shl 8;
      end;
      DoBlue: begin
        color.blue := cbs^.Value shl 8;
      end;
    end;
    XFreeColors(XtDisplay(w), cmap, @color.pixel, 1, 0);
    if XAllocColor(XtDisplay(w), cmap, @color) = 0 then begin
      WriteLn('Couldn''t XAllocColor !');
      Halt(1);
    end;
    XtVaSetValues(colorWindow, XmNbackground, color.pixel, nil);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol, scale: TWidget;
    app: TXtAppContext;
    arglist: TXtVarArgsList;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      //            XmNwidth, 320,
      //            XmNheight, 200,
      nil);

    if DefaultDepthOfScreen(XtScreen(toplevel)) < 2 then begin
      WriteLn('You must be using a color screen.');
      Halt(1);
    end;

    color.flags := DoRed or DoGreen or DoBlue;
    XAllocColor(XtDisplay(toplevel), DefaultColormapOfScreen(XtScreen(toplevel)), @color);

    rowcol := XtVaCreateManagedWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      nil);

    colorWindow := XtVaCreateManagedWidget('colorwindow', widgetClass, rowcol,
      XmNheight, 100,
      XmNbackground, color.pixel,
      nil);

    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, rowcol,
      XmNorientation, XmHORIZONTAL,
      nil);

    arglist := XtVaCreateArgsList(nil,
      XmNshowValue, True,
      XmNmaximum, 255,
      XmNscaleMultiple, 5,
      nil);

    scale := XtVaCreateManagedWidget('Red', xmScaleWidgetClass, rowcol,
      XtVaNestedList, arglist,
      XtVaTypedArg, XmNtitleString, XmRString, PChar('Red'), 4,
      XtVaTypedArg, XmNforeground, XmRString, PChar('Red'), 4,
      nil);
    XtAddCallback(scale, XmNdragCallback, @new_value, TXtPointer(DoRed));
    XtAddCallback(scale, XmNvalueChangedCallback, @new_value, TXtPointer(DoRed));

    scale := XtVaCreateManagedWidget('Green', xmScaleWidgetClass, rowcol,
      XtVaNestedList, arglist,
      XtVaTypedArg, XmNtitleString, XmRString, PChar('Green'), 6,
      XtVaTypedArg, XmNforeground, XmRString, PChar('Green'), 6,
      nil);
    XtAddCallback(scale, XmNdragCallback, @new_value, TXtPointer(DoGreen));
    XtAddCallback(scale, XmNvalueChangedCallback, @new_value, TXtPointer(DoGreen));

    scale := XtVaCreateManagedWidget('Blue', xmScaleWidgetClass, rowcol,
      XtVaNestedList, arglist,
      XtVaTypedArg, XmNtitleString, XmRString, PChar('Blue'), 5,
      XtVaTypedArg, XmNforeground, XmRString, PChar('Blue'), 5,
      nil);
    XtAddCallback(scale, XmNdragCallback, @new_value, TXtPointer(DoBlue));
    XtAddCallback(scale, XmNvalueChangedCallback, @new_value, TXtPointer(DoBlue));

    XtFree(arglist);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
