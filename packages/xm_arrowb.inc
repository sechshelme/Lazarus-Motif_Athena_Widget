/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function XmIsArrowButton(w : TWidget) : TBoolean;

{ XmIsArrowButton  }
  var
    xmArrowButtonWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmArrowButtonWidgetClass = ^TXmArrowButtonWidgetClass;
//  TXmArrowButtonWidgetClass = PXmArrowButtonClassRec;
//
//  PXmArrowButtonWidget = ^TXmArrowButtonWidget;
//  TXmArrowButtonWidget = PXmArrowButtonRec;

{*******    Public Function Declarations    ******* }

function XmCreateArrowButton(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreateManagedArrowButton(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedArrowButton(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateArrowButton(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateArrowButton(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsArrowButton(w: TWidget): TBoolean;
begin
  XmIsArrowButton:=XtIsSubclass(w,xmArrowButtonWidgetClass);
end;

{$ENDIF read_implementation}
