/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    xmLabelGadgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmLabelGadgetClass = ^TXmLabelGadgetClass;
//  TXmLabelGadgetClass = PXmLabelGadgetClassRec;
//
//  PXmLabelGadget = ^TXmLabelGadget;
//  TXmLabelGadget = PXmLabelGadgetRec;
//
//  PXmLabelGCacheObject = ^TXmLabelGCacheObject;
//  TXmLabelGCacheObject = PXmLabelGCacheObjRec;
{fast subclass define  }

function XmIsLabelGadget(w : TWidget) : TBoolean;

{ XmIsLabelGadget  }
{*******    Public Function Declarations    ******* }

function XmCreateLabelGadget(parent:TWidget; name:Pchar; arglist:PArg; argCount:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreateLabelGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateLabelGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedLabelGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedLabelGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsLabelGadget(w: TWidget): TBoolean;
begin
  XmIsLabelGadget:=XtIsSubclass(w,xmLabelGadgetClass);
end;

{$ENDIF read_implementation}
