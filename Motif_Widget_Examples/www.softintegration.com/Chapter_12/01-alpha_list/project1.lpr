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
    u_bound: PtrInt= 0;
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
      if i>100 then Break;

     if  not XmStringGetLtoR(strlist[i], XmFONTLIST_DEFAULT_TAG, @Text) then begin
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

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, rowcol, list_w, text_w: TWidget;
    app: TXtAppContext;
    args: array[0..4] of TArg;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      //      XmNwidth, 320,
      //      XmNheight, 200,
      nil);

    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel, nil);

    XtSetArg(args[0], XmNvisibleItemCount, 5);
    list_w := XmCreateScrolledList(rowcol, 'scrolled_list', args, 1);
    XtManageChild(list_w);

    text_w := XtVaCreateManagedWidget('text', xmTextFieldWidgetClass, rowcol,
      XmNcolumns, 25,
      XmNbackground, $FFFFFF,
      nil);

    XtAddCallback(text_w, XmNactivateCallback, @add_item, list_w);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
