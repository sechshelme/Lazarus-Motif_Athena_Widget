program project1;

uses
  heaptrc,
  Unix,
  Strings,
  xlib,
  x,
  Xm, XT;

const
  prompts: array of PChar = ('Name:', 'Vorname', 'Strasse:', 'Postleitzahl:', 'Ort:', 'Land:', 'Telefon:');

  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, mainform, label_, Text: TWidget;
    subform: TWidget = nil;
    i, XmAtt: integer;
    app: TXtAppContext;
    s: string;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil, nil);

    mainform := XtVaCreateWidget('mainform', xmFormWidgetClass, toplevel,
      nil);

    for i := 0 to Length(prompts) - 1 do begin
      if i <> 0 then begin
        XmAtt := XmATTACH_WIDGET;
      end else begin
        XmAtt := XmATTACH_FORM;
      end;
      subform := XtVaCreateWidget('subform', xmFormWidgetClass, mainform,
        XmNwidth, 640,
        XmNtopAttachment, XmAtt,
        XmNtopWidget, subform,
        XmNleftAttachment, XmATTACH_FORM,
        XmNrightAttachment, XmATTACH_FORM,
        XmNhorizontalSpacing, 5,
        XmNverticalSpacing, 5,
        nil);

      label_ := XtVaCreateManagedWidget(prompts[i], xmLabelGadgetClass, subform,
   //   XmNwidth, 200,
        XmNtopAttachment, XmATTACH_FORM,
        XmNbottomAttachment, XmATTACH_FORM,
        XmNleftAttachment, XmATTACH_FORM,
        XmNalignment, XmALIGNMENT_BEGINNING,
        nil);

      WriteStr(s, 'text_', i);
      Text := XtVaCreateManagedWidget(@s[1], xmTextWidgetClass, subform,
        XmNbackground, $FFFFFF,
        XmNtopAttachment, XmATTACH_FORM,
        XmNbottomAttachment, XmATTACH_FORM,
        XmNrightAttachment, XmATTACH_FORM,
        XmNleftAttachment, XmATTACH_WIDGET,
        XmNleftWidget, label_,
        nil);

      XtManageChild(subform);
    end;

    XtManageChild(mainform);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
