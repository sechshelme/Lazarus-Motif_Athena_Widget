
{$IFDEF read_interface}






{ XmIsXmDisplay  }
  Const
    XmDRAG_NONE = 0;
    XmDRAG_DROP_ONLY = 1;
    XmDRAG_PREFER_PREREGISTER = 2;
    XmDRAG_PREREGISTER = 3;
    XmDRAG_PREFER_DYNAMIC = 4;
    XmDRAG_DYNAMIC = 5;
    XmDRAG_PREFER_RECEIVER = 6;

{ Class record constants  }
//type
//  PXmDisplay = ^TXmDisplay;
//  TXmDisplay = PXmDisplayRec;
//
//  PXmDisplayClass = ^TXmDisplayClass;
//  TXmDisplayClass = PXmDisplayClassRec;

  var
    xmDisplayClass : TWidgetClass;cvar;external libXm;

function XmIsDisplay(w : TWidget) : TBoolean;
function XmGetDisplay(w : TWidget) : TWidget;

{*******    Public Function Declarations    ******* }
function XmGetDragContext(w:TWidget; time:TTime):TWidget;cdecl;external libXm;
function XmGetXmDisplay(display:PDisplay):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsDisplay(w: TWidget): TBoolean;
begin
  XmIsDisplay:=XtIsSubclass(w,xmDisplayClass);
end;

function XmGetDisplay(w: TWidget): TWidget;
begin
  XmGetDisplay:=XmGetXmDisplay(XtDisplayOfObject(w));
end;

{$ENDIF read_implementation}
