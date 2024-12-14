
{$IFDEF read_interface}



function XmIsDrawnButton(w : TWidget) : TBoolean;

{ XmIsDrawnButton  }
{ DrawnButon Widget  }
  var
    xmDrawnButtonWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmDrawnButtonWidgetClass = ^TXmDrawnButtonWidgetClass;
//  TXmDrawnButtonWidgetClass = PXmDrawnButtonClassRec;
//
//  PXmDrawnButtonWidget = ^TXmDrawnButtonWidget;
//  TXmDrawnButtonWidget = PXmDrawnButtonRec;

{*******    Public Function Declarations    ******* }

function XmCreateDrawnButton(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreateDrawnButton(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateDrawnButton(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedDrawnButton(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedDrawnButton(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsDrawnButton(w: TWidget): TBoolean;
begin
  XmIsDrawnButton:=XtIsSubclass(w,xmDrawnButtonWidgetClass);
end;

{$ENDIF read_implementation}
