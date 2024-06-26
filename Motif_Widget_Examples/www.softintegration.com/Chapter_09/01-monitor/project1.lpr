program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

  procedure scroll_action(w: TWidget; client_data: TXtPointer; call_data: TXtPointer); cdecl;
  var
    cbs: PXmScrollBarCallbackStruct;
    s: string;
  begin
    cbs := PXmScrollBarCallbackStruct(call_data);
    case cbs^.reason of
      XmCR_DRAG: begin
        s := 'drag';
      end;
      XmCR_VALUE_CHANGED: begin
        s := 'value changed';
      end;
      XmCR_INCREMENT: begin
        s := 'increment';
      end;
      XmCR_DECREMENT: begin
        s := 'decrement';
      end;
      XmCR_PAGE_INCREMENT: begin
        s := 'page increment';
      end;
      XmCR_PAGE_DECREMENT: begin
        s := 'page decrement';
      end;
      XmCR_TO_TOP: begin
        s := 'top';
      end;
      XmCR_TO_BOTTOM: begin
        s := 'bottom';
      end;
      else begin
        s := 'unknown';
      end;
    end;
    WriteLn(s);
  end;

  procedure main(argc: longint; argv: PPChar);
  const
    items: PChar = 'choice0, choice1, choice2, choice3, choice4, choice5, choice6, choice7, choice8, choice9, choice10, choice11, choice12, choice13, choice14';
  var
    toplevel, list_w, sb: TWidget;
    app: TXtAppContext;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    list_w := XmCreateScrolledList(toplevel, 'list_w', nil, 0);
    XtVaSetValues(list_w,
      XtVaTypedArg, XmNitems, XmRString, items, strlen(items) + 1,
      XmNitemCount, 15,
      XmNvisibleItemCount, 5,
      nil);
    XtManageChild(list_w);

    XtVaGetValues(XtParent(list_w), XmNverticalScrollBar, @sb, nil);

    XtVaSetValues(sb,
      XmNbackground, $FF,
      nil);

    XtAddCallback(sb, XmNvalueChangedCallback, @scroll_action, nil);
    XtAddCallback(sb, XmNdragCallback, @scroll_action, nil);
    XtAddCallback(sb, XmNincrementCallback, @scroll_action, nil);
    XtAddCallback(sb, XmNdecrementCallback, @scroll_action, nil);
    XtAddCallback(sb, XmNpageIncrementCallback, @scroll_action, nil);
    XtAddCallback(sb, XmNpageDecrementCallback, @scroll_action, nil);
    XtAddCallback(sb, XmNtoTopCallback, @scroll_action, nil);
    XtAddCallback(sb, XmNtoBottomCallback, @scroll_action, nil);

    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
