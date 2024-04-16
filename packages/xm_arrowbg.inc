/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function XmIsArrowButtonGadget(w : TWidget) : TBoolean;

{ XmIsArrowButtonGadget  }
  var
    xmArrowButtonGadgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmArrowButtonGadgetClass = ^TXmArrowButtonGadgetClass;
//  TXmArrowButtonGadgetClass = PXmArrowButtonGadgetClassRec;
//
//  PXmArrowButtonGadget = ^TXmArrowButtonGadget;
//  TXmArrowButtonGadget = PXmArrowButtonGadgetRec;

{*******    Public Function Declarations    ******* }

function XmCreateArrowButtonGadget(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreateManagedArrowButtonGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedArrowButtonGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateArrowButtonGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateArrowButtonGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsArrowButtonGadget(w: TWidget): TBoolean;
begin
  XmIsArrowButtonGadget:=XtIsSubclass(w,xmArrowButtonGadgetClass);
end;


{$ENDIF read_implementation}
