/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    xmToggleButtonGadgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmToggleButtonGadgetClass = ^TXmToggleButtonGadgetClass;
//  TXmToggleButtonGadgetClass = PXmToggleButtonGadgetClassRec;
//
//  PXmToggleButtonGadget = ^TXmToggleButtonGadget;
//  TXmToggleButtonGadget = PXmToggleButtonGadgetRec;
//
//  PXmToggleButtonGCacheObject = ^TXmToggleButtonGCacheObject;
//  TXmToggleButtonGCacheObject = PXmToggleButtonGCacheObjRec;

function XmIsToggleButtonGadget(w : TWidget) : TBoolean;

{*******    Public Function Declarations    ******* }

function XmToggleButtonGadgetGetState(w:TWidget):TBoolean;cdecl;external libXm;
procedure XmToggleButtonGadgetSetState(w:TWidget; newstate:TBoolean; notify:TBoolean);cdecl;external libXm;
function XmToggleButtonGadgetSetValue(w:TWidget; newstate:TXmToggleButtonState; notify:TBoolean):TBoolean;cdecl;external libXm;
function XmCreateToggleButtonGadget(parent:TWidget; name:Pchar; arglist:PArg; argCount:TCardinal):TWidget;cdecl;external libXm;
//function XmVaCreateToggleButtonGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateToggleButtonGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedToggleButtonGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedToggleButtonGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsToggleButtonGadget(w: TWidget): TBoolean;
begin
  XmIsToggleButtonGadget:=XtIsSubclass(w,xmToggleButtonGadgetClass);
end;

{$ENDIF read_implementation}
