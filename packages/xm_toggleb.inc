/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    xmToggleButtonWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmToggleButtonWidgetClass = ^TXmToggleButtonWidgetClass;
//  TXmToggleButtonWidgetClass = PXmToggleButtonClassRec;
//
//  PXmToggleButtonWidget = ^TXmToggleButtonWidget;
//  TXmToggleButtonWidget = PXmToggleButtonRec;

function XmIsToggleButton(w : TWidget) : TBoolean;

{ XmIsToggleButton  }
{*******    Public Function Declarations    ******* }

function XmToggleButtonGetState(w:TWidget):TBoolean;cdecl;external libXm;
procedure XmToggleButtonSetState(w:TWidget; newstate:TBoolean; notify:TBoolean);cdecl;external libXm;
function XmToggleButtonSetValue(w:TWidget; newstate:TXmToggleButtonState; notify:TBoolean):TBoolean;cdecl;external libXm;
{#endif /* NeedWidePrototypes */ }
function XmCreateToggleButton(parent:TWidget; name:Pchar; arglist:PArg; argCount:TCardinal):TWidget;cdecl;external libXm;
//function XmVaCreateToggleButton(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateToggleButton(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedToggleButton(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedToggleButton(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsToggleButton(w: TWidget): TBoolean;
begin
  XmIsToggleButton:=XtIsSubclass(w,xmToggleButtonWidgetClass);
end;

{$ENDIF read_implementation}
