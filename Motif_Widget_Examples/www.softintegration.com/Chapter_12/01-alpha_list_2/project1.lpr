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

  XmCommand,
  XmText,
  XTComposite,
  XTIntrinsic;

  procedure add_item(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    list_w: TWidget;
    newtext, Text: PChar;
    str1: TXmString;
    strlist: PXmString;
    i: PtrInt;
    u_bound: PtrInt = 0;
    l_bound: PtrInt = 0;
  begin
    list_w := TWidget(client_data);
    newtext := XmTextFieldGetString(w);

    if (newtext = nil) or (newtext^ = #0) then begin
      XtFree(newtext);
      Exit;
    end;

    XtVaGetValues(list_w,
      XmNitemCount, @u_bound,
      XmNitems, @strlist,
      nil);
    Dec(u_bound);

    while (u_bound >= l_bound) do begin             // Fehler
      i := l_bound + (u_bound - l_bound) div 2;

      WriteLn(i);
      if i > 100 then begin
        Break;
      end;

      if not XmStringGetLtoR(strlist[i], XmFONTLIST_DEFAULT_TAG, @Text) then begin
        Break;
      end;
      if strcomp(Text, newtext) > 0 then begin
        u_bound := i - 1;
      end else begin
        l_bound := i + 1;
      end;
      XtFree(Text);
    end;
    str1 := XmStringCreateLocalized(newtext);
    XtFree(newtext);

    XmListAddItemUnselected(list_w, str1, l_bound + 1);
    XmStringFree(str1);
    XmTextFieldSetString(w, '');
  end;

  procedure Close_App(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  begin
    Halt;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, form, list_w, text_w, sw, quit_b: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      XmNwidth, 320,
      XmNheight, 200,
      nil);

    form := XtVaCreateWidget('form', xmFormWidgetClass, toplevel, nil);

    quit_b := XtVaCreateManagedWidget('quit', xmPushButtonWidgetClass, form,
      XmNrightAttachment, XmATTACH_FORM,
      XmNbottomAttachment, XmATTACH_FORM,
      nil);
    XtAddCallback(quit_b, XmNactivateCallback, @Close_App, nil);

    text_w := XtVaCreateManagedWidget('text', xmTextFieldWidgetClass, form,
      XmNcolumns, 25,
      XmNbackground, $FFFFFF,
      XmNrightAttachment, XmATTACH_WIDGET,
      XmNrightWidget, quit_b,
      XmNleftAttachment, XmATTACH_FORM,
      XmNbottomAttachment, XmATTACH_FORM,
      nil);

    sw := XtVaCreateManagedWidget('sw', xmScrolledWindowWidgetClass, form,
      XmNtopAttachment, XmATTACH_FORM,
      XmNleftAttachment, XmATTACH_FORM,
      XmNrightAttachment, XmATTACH_FORM,
      XmNbottomAttachment, XmATTACH_WIDGET,
      XmNbottomWidget, text_w,
      nil);

    list_w := XtVaCreateManagedWidget('list', xmListWidgetClass, sw,
      XmNvisibleItemCount, 5,
      nil);
    XtAddCallback(text_w, XmNactivateCallback, @add_item, list_w);

    XtManageChild(form);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
