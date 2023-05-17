program project1;

uses
  ctypes,
  xlib,
  xatom,
  XmuAtoms,
  xresource,
  x,
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XawCardinals,
  XawText,
  XawAsciiText,
  XawForm,
  XawAsciiSrc,
  XTIntrinsic;

type
  PClipRec = ^TClipRec;

  TClipRec = record
    Next, Prev: PClipRec;
    clip, filename: PChar;
    avail: SizeInt;
  end;
  TClipPtr = PClipRec;

const
  lib_stdio = 'c';


//  https://www.tutorialspoint.com/c_standard_library/c_function_calloc.htm
  function calloc(nitems, size: SizeInt): Pointer; varargs cdecl; external lib_stdio;
  // https://cplusplus.com/reference/cstdio/snprintf/

  function snprintf(restrict: PChar; maxlen: SizeInt; format: PChar): cint; varargs cdecl; external lib_stdio;

  //  extern int snprintf (char *__restrict __s, size_t __maxlen,
  //           const char *__restrict __format, ...)
  //     __THROWNL __attribute__ ((__format__ (__printf__, 3, 4)));


var
  ManagetAtom, ClipboardAtom: TAtom;


  function NewClip(w: TWidget; old: TClipPtr): TClipPtr;
  var
    newClip1: TClipPtr;
  begin
    newClip1 := calloc(1, SizeOf(TClipRec));
    if newClip1 = nil then begin
      Result := newClip1;
      Exit;
    end;
    newClip1^.Prev := old;
    if old <> nil then begin
      newClip1^.Next := old^.Next;
      old^.Next := newClip1;
    end;
    Result := newClip1;
  end;


var
  currentClip: TClipPtr;
  top, parent, nextButton, indexLabel, prevButton, text1,
  fileDialog, failDialog: TWidget;

  function IndexCurrentClip: cint;
  var
    i: cint = 0;
    clip: TClipPtr;
  begin
    clip := currentClip;
    while clip <> nil do begin
      clip := clip^.Prev;
      Inc(i);
    end;
    Result:=i;
  end;

  procedure set_button_state;
  var
    prevvalid, nextvalid: Tboolean;
    arg: TArg;
    labelString: array[0..11] of char;
  begin
    prevvalid := currentClip^.Prev <> nil;
    nextvalid := currentClip^.Next <> nil;
    XtSetArg(arg, XtNsensitive, prevvalid);
    XtSetValues(prevButton, @arg, ONE);
    XtSetArg(arg, XtNsensitive, nextvalid);
    XtSetValues(nextButton, @arg, ONE);
    snprintf(labelString, SizeOf(labelString), '%d', IndexCurrentClip);
    XtSetArg(arg, XtNlabel, labelString);
    XtSetValues(indexLabel, @arg, ONE);
  end;


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

    currentClip := NewClip(text1, TClipPtr(0));

    set_button_state;


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
