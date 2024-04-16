/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function XmIsSeparator(w : TWidget) : TBoolean;

{ XmIsSeparator  }
  var
    xmSeparatorWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmSeparatorWidgetClass = ^TXmSeparatorWidgetClass;
//  TXmSeparatorWidgetClass = PXmSeparatorClassRec;
//
//  PXmSeparatorWidget = ^TXmSeparatorWidget;
//  TXmSeparatorWidget = PXmSeparatorRec;

{*******    Public Function Declarations    ******* }

function XmCreateSeparator(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreateSeparator(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateSeparator(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedSeparator(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedSeparator(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsSeparator(w: TWidget): TBoolean;
begin
  XmIsSeparator:=XtIsSubclass(w,xmSeparatorWidgetClass);
end;


{$ENDIF read_implementation}
