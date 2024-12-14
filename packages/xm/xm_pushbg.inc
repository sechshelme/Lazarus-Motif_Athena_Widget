
{$IFDEF read_interface}



function XmIsPushButtonGadget(w : TWidget) : TBoolean;

{ XmIsPushButtonGadget  }
  var
    xmPushButtonGadgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmPushButtonGadgetClass = ^TXmPushButtonGadgetClass;
//  TXmPushButtonGadgetClass = PXmPushButtonGadgetClassRec;
//
//  PXmPushButtonGadget = ^TXmPushButtonGadget;
//  TXmPushButtonGadget = PXmPushButtonGadgetRec;
//
//  PXmPushButtonGCacheObject = ^TXmPushButtonGCacheObject;
//  TXmPushButtonGCacheObject = PXmPushButtonGCacheObjRec;

{*******    Public Function Declarations    ******* }

function XmCreatePushButtonGadget(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreatePushButtonGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreatePushButtonGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedPushButtonGadget(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedPushButtonGadget(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsPushButtonGadget(w: TWidget): TBoolean;
begin
  XmIsPushButtonGadget:=XtIsSubclass(w,xmPushButtonGadgetClass);
end;

{$ENDIF read_implementation}
