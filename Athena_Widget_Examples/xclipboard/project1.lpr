program project1;

uses
  xlib,
  xatom,
  XmuAtoms,
  xresource,
  x,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XawText,
  XawAsciiText,
  XawForm,
  XawAsciiSrc,
  XTIntrinsic;


  procedure NewCurrentChlip(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure NextCurrentChlip(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure PrevCurrentChlip(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure DeleteCurrentChlip(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure SaveToFile(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure AccceptSaveFile(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure CancelSaveFile(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure FailContinue(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure Quit(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;

  procedure WMProtocols(w: TWidget; event: PXEvent; params: PXtString;
    num_params: PCardinal); cdecl;
  begin

  end;




var
  xclipboard_actions: array of TXtActionsRec = (
    (_string: 'NewClip'; proc: @NewCurrentChlip),
    (_string: 'NextClip'; proc: @NextCurrentChlip),
    (_string: 'PrevClip'; proc: @PrevCurrentChlip),
    (_string: 'DeleteClip'; proc: @DeleteCurrentChlip),
    (_string: 'Save'; proc: @SaveToFile),
    (_string: 'AcceptSave'; proc: @AccceptSaveFile),
    (_string: 'CancelSave'; proc: @CancelSaveFile),
    (_string: 'FailContinue'; proc: @FailContinue),
    (_string: 'Quit'; proc: @Quit),
    (_string: 'WMProtocols'; proc: @WMProtocols));

  ManagetAtom, ClipboardAtom: TAtom;



var
  table: array of TXrmOptionDescRec = ((option: '-w'; specifier: 'warp'; argKind: XrmoptionNoArg; Value: 'on'));
  fallback_resource: array of TXtString = ('*international: true', nil);

type
  TResourceData = record
    wrap: boolean;
  end;

var
  userOptions: TResourceData;

  resources: array of TXtResource = ((resource_name: 'warp'; resource_class: 'warp'; resource_type: XtRBoolean;
    resource_size: sizeof(boolean);
    resource_offset: 0;    // xtoffTCardinal;
    default_type: XtRImmediate; default_addr: TXtPointer(False)));


  procedure main;
  var
    top, parent, nextButton, indexLabel, prevButton, text1: TWidget;
    xtcontext: TXtAppContext;
    args: array[0..7] of TArg;
  begin
    top := XtVaAppInitialize(@xtcontext, 'XClipboard', TXrmOptionDescList(table), Length(table), @argc, argv, PPChar(fallback_resource),
      XtNwidth, 320, XtNheight, 200,
      nil);

    XtGetApplicationResources(top, TXtPointer(@userOptions), TXtResourceList(resources), Length(resources), nil, 0);

    XtAppAddActions(xtcontext, TXtActionList(xclipboard_actions), Length(xclipboard_actions));

    ManagetAtom := XInternAtom(XtDisplay(top), 'CLIPBOARD_MANAGER', False);
    ClipboardAtom := XA_CLIPBOARD(XtDisplay(top));


    parent := XtCreateManagedWidget('form', formWidgetClass, top, nil, 0);

    XtCreateManagedWidget('quit', commandWidgetClass, parent, nil, 0);
    XtCreateManagedWidget('delete', commandWidgetClass, parent, nil, 0);
    XtCreateManagedWidget('new', commandWidgetClass, parent, nil, 0);
    XtCreateManagedWidget('save', commandWidgetClass, parent, nil, 0);
    nextButton := XtCreateManagedWidget('next', commandWidgetClass, parent, nil, 0);
    prevButton := XtCreateManagedWidget('prev', commandWidgetClass, parent, nil, 0);
    indexLabel := XtCreateManagedWidget('index', labelWidgetClass, parent, nil, 0);

    XtSetArg(args[0], XtNtype, XawAsciiString);
    XtSetArg(args[1], XtNeditType, XawtextEdit);
    //    if userOptions.wrap ;
    XtSetArg(args[0], XtNwrap, XawtextWrapWord);
    XtSetArg(args[1], XtNscrollHorizontal, False);

    text1 := XtCreateManagedWidget('text', asciiTextWidgetClass, parent, args, 4);


    //    XtVaSetValues(parent, XtNorientation, XtEhorizontal, nil);

    //button1 := XtCreateManagedWidget('Buttton 1', commandWidgetClass, parent, nil, 0);
    //XtAddCallback(button1, XtNcallback, @On_Click, nil);
    //
    //button2 := XtCreateManagedWidget('Buttton 2', commandWidgetClass, parent, nil, 0);
    //XtVaSetValues(button2, XtNbackground, $FF8888, XtNname, PChar('1234'), nil);
    //XtAddCallback(button2, XtNcallback, @On_Click, nil);
    //
    //button3 := XtCreateManagedWidget('Buttton 3', commandWidgetClass, parent, nil, 0);
    //XtAddCallback(button3, XtNcallback, @On_Click, nil);
    //
    //label1 := XtCreateManagedWidget('', labelWidgetClass, parent, nil, 0);
    //XtVaSetValues(label1, XtNborderWidth, 0, XtNforeground, $FF0000, nil);

    XtRealizeWidget(top);
    //  XtMainLoop;
    XtAppMainLoop(xtcontext);
  end;

begin
  main;
end.
