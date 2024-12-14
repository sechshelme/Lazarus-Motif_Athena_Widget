
{$IFDEF read_interface}


{ C++ extern C conditionnal removed }
{ Class record constants  }
  var
    xmSelectionBoxWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmSelectionBoxWidgetClass = ^TXmSelectionBoxWidgetClass;
//  TXmSelectionBoxWidgetClass = PXmSelectionBoxClassRec;
//
//  PXmSelectionBoxWidget = ^TXmSelectionBoxWidget;
//  TXmSelectionBoxWidget = PXmSelectionBoxRec;

function XmIsSelectionBox(w : TWidget) : TBoolean;

{*******    Public Function Declarations    ******* }

function XmSelectionBoxGetChild(sb:TWidget; which:byte):TWidget;cdecl;external libXm;
{#endif /* NeedWidePrototypes */ }
function XmCreateSelectionBox(p:TWidget; name:TXtString; args:TArgList; n:TCardinal):TWidget;cdecl;external libXm;
function XmCreateSelectionDialog(ds_p:TWidget; name:TXtString; sb_args:TArgList; sb_n:TCardinal):TWidget;cdecl;external libXm;
function XmCreatePromptDialog(ds_p:TWidget; name:TXtString; sb_args:TArgList; sb_n:TCardinal):TWidget;cdecl;external libXm;
{
 * Variable argument list functions
  }
//function XmVaCreateSelectionBox(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateSelectionBox(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedSelectionBox(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedSelectionBox(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsSelectionBox(w: TWidget): TBoolean;
begin
  XmIsSelectionBox:=XtIsSubclass(w,xmSelectionBoxWidgetClass);
end;

{$ENDIF read_implementation}
