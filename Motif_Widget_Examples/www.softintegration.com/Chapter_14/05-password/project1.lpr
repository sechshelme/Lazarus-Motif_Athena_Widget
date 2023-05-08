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

  function strncat(dest, src: PChar; size: clong): PChar; cdecl; external libX11;


  procedure check_passwd(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmTextVerifyCallbackStruct;
    c_new: PChar;
    len: integer;
  begin
    cbs := PXmTextVerifyCallbackStruct(call_data);
    if cbs^.reason = XmCR_ACTIVATE then begin
      WriteLn('Password: ', passwd);
      Exit;
    end;

    if cbs^.startPos < cbs^.currInsert then begin
      cbs^.endPos := strlen(passwd);
      passwd[cbs^.startPos] := #0;
      Exit;
    end;

    if cbs^.Text^.length > 1 then begin
      cbs^.doit := False;
      Exit;
    end;

    c_new := XtMalloc(cbs^.endPos + 2);
    if passwd <> nil then begin
      strcopy(c_new, passwd);
      XtFree(passwd);
    end else begin
      c_new[0] := #0;
    end;

    passwd := c_new;
    strncat(passwd, cbs^.Text^.ptr, cbs^.Text^.length);
    passwd[cbs^.endPos + cbs^.Text^.length] := #0;
    for len := 0 to cbs^.Text^.length - 1 do begin
      cbs^.Text^.ptr[len] := '*';
    end;
    WriteLn('Password: ', passwd);
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol, text_w: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel, nil);

    XtVaCreateManagedWidget('Password:', xmLabelGadgetClass, rowcol, nil);
    text_w := XtVaCreateManagedWidget('text_wt', xmTextWidgetClass, rowcol,
      XmNbackground, $FFFFFF,
      nil);

    XtAddCallback(text_w, XmNmodifyVerifyCallback, @check_passwd, nil);
    XtAddCallback(text_w, XmNactivateCallback, @check_passwd, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
