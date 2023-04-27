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
  TMyDisplay = record
    ext_data: PXExtData;
    private1: PXPrivate;
    fd: cint;
    pr2: cint;
    roto_major_version: cint;
    roto_minor_version: cint;
    vendor: PChar;
    private3: TXID;
    private4: TXID;
    private5: TXID;
    private6: longint;
    resource_alloc:
    function(para1: PXDisplay): TXID; cdecl;
    byte_order: cint;
    bitmap_unit: cint;
    bitmap_pad: cint;
    bitmap_bit_order: cint;
    nformats: cint;
    pixel_format: PScreenFormat;
    private8: cint;
    Release: cint;
    private9, private10: PXPrivate;
    qlen: cint;
    last_request_read: culong;
    request: culong;
    private11: TXPointer;
    private12: TXPointer;
    private13: TXPointer;
    private14: TXPointer;
    max_request_size: cunsigned;
    db: PXrmDatabase;
    private15:
    function(para1: PXDisplay): longint; cdecl;
    display_name: PChar;
    default_screen: cint;
    nscreens: cint;
    screens: PScreen;
    motion_buffer: culong;
    private16: culong;
    min_keycode: cint;
    max_keycode: cint;
    private17: TXPointer;
    private18: TXPointer;
    private19: cint;
    xdefaults: PChar;
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

    XrmPutStringResource(@Mydpy^.db, '*form*topAttachment', 'attach_position');
    XrmPutStringResource(@Mydpy^.db, '*form*leftAttachment', 'attach_position');
    XrmPutStringResource(@Mydpy^.db, '*form*rightAttachment', 'Attach_position');
    XrmPutStringResource(@Mydpy^.db, '*form*bottomAttachment', 'attach_position');
    XrmPutStringResource(@Mydpy^.db, '*form*background', 'Green');
    XrmPutStringResource(@Mydpy^.db, '*form*foreground', '#FF8888');

    form := XtVaCreateWidget('form', xmFormWidgetClass, toplevel,
      XmNfractionBase, 3,
      nil);

    XtVaCreateManagedWidget('arrow1', xmArrowButtonGadgetClass, form,

      //    XmNtopAttachment, XmATTACH_POSITION,
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
