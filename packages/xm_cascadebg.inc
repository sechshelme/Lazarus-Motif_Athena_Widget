/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    xmCascadeButtonGadgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmCascadeButtonGadgetClass = ^TXmCascadeButtonGadgetClass;
//  TXmCascadeButtonGadgetClass = PXmCascadeButtonGadgetClassRec;
//
//  PXmCascadeButtonGadget = ^TXmCascadeButtonGadget;
//  TXmCascadeButtonGadget = PXmCascadeButtonGadgetRec;
//
//  PXmCascadeButtonGCacheObject = ^TXmCascadeButtonGCacheObject;
//  TXmCascadeButtonGCacheObject = PXmCascadeButtonGCacheObjRec;

function XmIsCascadeButtonGadget(w : TWidget) : TBoolean;

{ XmIsCascadeButtonGadget  }
{*******    Public Function Declarations    ******* }

function XmCreateCascadeButtonGadget(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
procedure XmCascadeButtonGadgetHighlight(wid:TWidget; highlight:TBoolean);cdecl;external libXm;

//function XmVaCreateCascadeButtonGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateCascadeButtonGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedCascadeButtonGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedCascadeButtonGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsCascadeButtonGadget(w: TWidget): TBoolean;
begin
  XmIsCascadeButtonGadget:=XtIsSubclass(w,xmCascadeButtonGadgetClass);
end;


{$ENDIF read_implementation}
