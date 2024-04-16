/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



var
    xmGrabShellWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmGrabShellWidgetClass = ^TXmGrabShellWidgetClass;
//  TXmGrabShellWidgetClass = PXmGrabShellClassRec;
//
//  PXmGrabShellWidget = ^TXmGrabShellWidget;
//  TXmGrabShellWidget = PXmGrabShellWidgetRec;

function XmIsGrabShell(w : TWidget) : TBoolean;

{ XmIsGrabShell  }
{*******    Public Function Declarations    ******* }

function XmCreateGrabShell(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsGrabShell(w: TWidget): TBoolean;
begin
  XmIsGrabShell:=XtIsSubclass(w,xmGrabShellWidgetClass);
end;

{$ENDIF read_implementation}
