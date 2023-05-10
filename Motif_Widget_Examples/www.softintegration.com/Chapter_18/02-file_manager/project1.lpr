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
  XmAtomMgr,
  XmScale,
  xmCutPaste,

  XmCommand,
  XmText,
  XTComposite,
  XTCore,
  XTIntrinsic;

type
  TFileInfo = record
    filename: PChar;
    is_directory: boolean;
  end;

var  files:array of TFileInfo;

  procedure to_clipbd(w: TWidget; client_data: TXtPointer; call_data: TXtPointer
    ); cdecl;
  begin

  end;

  procedure from_clipd(w: TWidget; client_data: TXtPointer;
    call_data: TXtPointer); cdecl;
  begin

  end;

  procedure main(argc: longint; argv: PPChar);
  var
    rowcol, btn, toplevel: TWidget;
    app: TXtAppContext;
    dis: PDisplay;
    buf: string;
    FILE_CONTENTS, FILE_NAME, DIRECTORY: TAtom;
  begin
    XtSetLanguageProc(nil, nil, nil);

    toplevel := XtVaAppInitialize(@app, 'Demos', nil, 0, @argc, argv, nil,
      nil);

    dis := XtDisplay(toplevel);
    FILE_CONTENTS := XmInternAtom(dis, 'FILE_CONTENTS', False);
    FILE_NAME := XmInternAtom(dis, 'FILE_NAME', False);
    DIRECTORY := XmInternAtom(dis, 'DIRECTORY', False);

    WriteLn(FILE_CONTENTS);
    WriteLn(FILE_NAME);
    WriteLn(DIRECTORY);

    WriteStr(buf, '/bin/ls .');


    rowcol := XtVaCreateWidget('rowcol', xmRowColumnWidgetClass, toplevel,
      nil);

    btn := XtVaCreateManagedWidget('button1', xmPushButtonWidgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, 'Copy To Clipboard', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @to_clipbd, nil);

    btn := XtVaCreateManagedWidget('button2', xmPushButtonWidgetClass, rowcol,
      XtVaTypedArg, XmNlabelString, XmRString, 'Retrieve From Clipboard', 0,
      nil);
    XtAddCallback(btn, XmNactivateCallback, @from_clipd, nil);

    XtManageChild(rowcol);
    XtRealizeWidget(toplevel);
    XtAppMainLoop(app);
  end;

begin
  main(argc, argv);
end.
