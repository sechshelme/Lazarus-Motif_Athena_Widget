/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

{
 * HISTORY
  }



  var
    xmContainerWidgetClass : TWidgetClass;cvar; external libXm;

//type
//  PXmContainerWidgetClass = ^TXmContainerWidgetClass;
//  TXmContainerWidgetClass = PXmContainerClassRec;
//
//  PXmContainerWidget = ^TXmContainerWidget;
//  TXmContainerWidget = PXmContainerRec;

function XmIsContainer(w : TWidget) : TBoolean;

{ XmIsContainer  }
{*******    Public Function Declarations    ******* }

function XmCreateContainer(parent:TWidget; name:TXtString; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;
//function XmVaCreateContainer(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateContainer(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedContainer(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedContainer(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
function XmContainerGetItemChildren(wid:TWidget; item:TWidget; item_children:PWidgetList):longint;cdecl;external libXm;
procedure XmContainerRelayout(wid:TWidget);cdecl;external libXm;
procedure XmContainerReorder(wid:TWidget; cwid_list:TWidgetList; cwid_count:longint);cdecl;external libXm;
function XmContainerCut(wid:TWidget; timestamp:TTime):TBoolean;cdecl;external libXm;
function XmContainerCopy(wid:TWidget; timestamp:TTime):TBoolean;cdecl;external libXm;
function XmContainerPaste(wid:TWidget):TBoolean;cdecl;external libXm;
function XmContainerCopyLink(wid:TWidget; timestamp:TTime):TBoolean;cdecl;external libXm;
function XmContainerPasteLink(wid:TWidget):TBoolean;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsContainer(w: TWidget): TBoolean;
begin
  XmIsContainer:=XtIsSubclass(w,xmContainerWidgetClass);
end;


{$ENDIF read_implementation}
