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

  procedure allcaps(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmTextVerifyCallbackStruct;
    len: integer;
  begin
    cbs := PXmTextVerifyCallbackStruct(call_data);
    if cbs^.Text^.ptr = nil then begin
      Exit;
    end;
    for len := 0 to cbs^.Text^.length - 1 do begin
      cbs^.Text^.ptr[len] := UpCase(cbs^.Text^.ptr[len]);
    end;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol, text_w: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    rowcol := XtVaCreateManagedWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      XmNorientation, XmHORIZONTAL,
      nil);

    XtVaCreateManagedWidget('Enter Text:', xmLabelGadgetClass, rowcol,
      nil);

    text_w := XtVaCreateManagedWidget('text_w', xmTextWidgetClass, rowcol,
      XmNbackground, $FFFFFF,
      nil);

    XtAddCallback(text_w, XmNmodifyVerifyCallback, @allcaps, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
