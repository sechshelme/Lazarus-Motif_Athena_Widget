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
  months: array of string = ('Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember');

  procedure sel_callback(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmListCallbackStruct;
    coice: PChar;
    i: integer;
  begin
    cbs := PXmListCallbackStruct(call_data);
    if cbs^.reason = XmCR_MULTIPLE_SELECT then begin
      WriteLn('Multiple selection -- ', cbs^.selected_item_count, ' items selected:');
      for i := 0 to cbs^.selected_item_count - 1 do begin
        XmStringGetLtoR(cbs^.selected_items[i], XmFONTLIST_DEFAULT_TAG, @coice);
        WriteLn(coice, ' (', cbs^.selected_item_positions[i], ')');
        XtFree(coice);
      end;
    end else begin
      XmStringGetLtoR(cbs^.item, XmFONTLIST_DEFAULT_TAG, @coice);
      WriteLn('Default action -- selcted item ', coice, ' (', cbs^.item_position, ')');
      XtFree(coice);
    end;
  end;

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, list_w: TWidget;
    app: TXtAppContext;
    str_list: TXmStringTable;
    n: PtrInt = 0;
    i: integer;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      XmNwidth, 320,
      XmNheight, 200,
      nil);

    n := Length(months);
    str_list := TXmStringTable(XtMalloc(n * SizeOf(PXmString)));
    for i := 0 to n - 1 do begin
      str_list[i] := XmStringCreateLocalized(PChar(months[i]));
    end;

    list_w := XmCreateScrolledList(toplevel, 'months', nil, 0);
    XtVaSetValues(list_w,
      XmNvisibleItemCount, n,
      XmNitemCount, n,
      XmNitems, str_list,
      XmNselectionPolicy, XmMULTIPLE_SELECT,
      nil);
    XtManageChild(list_w);

    XtAddCallback(list_w, XmNdefaultActionCallback, @sel_callback, nil);
    XtAddCallback(list_w, XmNmultipleSelectionCallback, @sel_callback, nil);

    for i := 0 to n - 1 do begin
      XmStringFree(str_list[i]);
    end;
    XtFree(PChar(str_list));

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
