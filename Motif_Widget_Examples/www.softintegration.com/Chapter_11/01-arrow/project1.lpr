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

type
  PMyDisplay = ^TMyDisplay;

//  TMyDisplay = record
////    ext_data:TXExtData;
////    pri1: TXPrivate;
//    pri1: Pointer;
//    fd: longint;
//    pr2: longint;
//    pmv1: longint;
//    pmv2: longint;
//    vendoe: PChar;
//    pri4: TXID;
//    pri5: TXID;
//    pri6: longint;
//    ra: PXDisplay;
//    bo: longint;
//    bu: longint;
//    bp: longint;
//    bbo: longint;
//    nformat: longint;
//    pf: PScreenFormat;
//    p8: longint;
//    rel: longint;
//    pri8, pri9: Pointer;
//    qlen: longint;
//    lrr: culong;
//    req: culong;
//    pri11: TXtPointer;
//    pri12: TXtPointer;
//    pri13: TXtPointer;
//    pri14: TXtPointer;
//    max_r: cunsigned;
//    db: PXrmDatabase;
//    d:array[0..11]of Pointer;
//  end;

  TMyDisplay = record
    ext_data:PXExtData;
    pri1: PXPrivate;
    fd: longint;
    pr2: longint;
    pmv1: longint;
    pmv2: longint;
    vendor: PChar;
    pri3: TXID;
    pri4: TXID;
    pri5: TXID;
    pri6: longint;
    ra: PXDisplay;
    bo: longint;
    bu: longint;
    bp: longint;
    bbo: longint;
    nformat: longint;
    pf: PScreenFormat;
    p8: longint;
    rel: longint;
    pri8, pri9: PXPrivate;
    qlen: longint;
    lrr: culong;
    req: culong;
    pri11: TXtPointer;
    pri12: TXtPointer;
    pri13: TXtPointer;
    pri14: TXtPointer;
    max_r: cunsigned;
    db: PXrmDatabase;
    d:array[0..11]of Pointer;
  end;


  procedure main(argc: longint; argv: PPChar);
  var
    toplevel, form: TWidget;
    app: TXtAppContext;
    dpy: PDisplay;
    Mydpy: PMyDisplay absolute dpy;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      //      XmNwidth, 320,
      //      XmNheight, 200,
      nil);

    dpy := XtDisplay(toplevel);

    WriteLn(PtrInt(Mydpy));
     WriteLn(PtrInt(dpy));

     XrmPutStringResource        (@Mydpy^.db, '*form*topAttachment', 'attach_position');
     XrmPutStringResource        (@Mydpy^.db, '*form*leftAttachment', 'attach_position');
     XrmPutStringResource        (@Mydpy^.db, '*form*rightAttachment', 'attach_position');
     XrmPutStringResource        (@Mydpy^.db, '*form*bottomAttachment', 'attach_position');


    //XrmPutStringResource(@Mydpy^.db, '*form*topAttachment', 'attach_position');
    //XrmPutStringResource(@Mydpy^.db, '*form*leftAttachment', 'attach_position');
    //XrmPutStringResource(@Mydpy^.db, '*form*rightAttachment', 'attach_position');
    //XrmPutStringResource(@Mydpy^.db, '*form*bottomAttachment', 'attach_position');
    //
    form := XtVaCreateWidget('form', xmFormWidgetClass, toplevel,
      XmNfractionBase, 3,
      nil);

    XtVaCreateManagedWidget('arrow1', xmArrowButtonGadgetClass, form,
      XmNtopPosition, 0,
      XmNbottomPosition, 1,
      XmNleftPosition, 1,
      XmNrightPosition, 2,
      XmNarrowDirection, XmARROW_UP,
      nil);

    XtVaCreateManagedWidget('arrow2', xmArrowButtonGadgetClass, form,
      XmNtopPosition, 1,
      XmNbottomPosition, 2,
      XmNleftPosition, 0,
      XmNrightPosition, 1,
      XmNarrowDirection, XmARROW_LEFT,
      nil);

    XtVaCreateManagedWidget('arrow3', xmArrowButtonGadgetClass, form,
      XmNtopPosition, 1,
      XmNbottomPosition, 2,
      XmNleftPosition, 2,
      XmNrightPosition, 3,
      XmNarrowDirection, XmARROW_RIGHT,
      nil);

    XtVaCreateManagedWidget('arrow4', xmArrowButtonGadgetClass, form,
      XmNtopPosition, 2,
      XmNbottomPosition, 3,
      XmNleftPosition, 1,
      XmNrightPosition, 2,
      XmNarrowDirection, XmARROW_DOWN,
      nil);


    XtManageChild(form);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
