/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  var
    xmMenuShellWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmMenuShellWidgetClass = ^TXmMenuShellWidgetClass;
//  TXmMenuShellWidgetClass = PXmMenuShellClassRec;
//
//  PXmMenuShellWidget = ^TXmMenuShellWidget;
//  TXmMenuShellWidget = PXmMenuShellWidgetRec;

function XmIsMenuShell(w : TWidget) : TBoolean;

{ XmIsMenuShell  }
{*******    Public Function Declarations    ******* }

function XmCreateMenuShell(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsMenuShell(w: TWidget): TBoolean;
begin
  XmIsMenuShell:=XtIsSubclass(w,xmMenuShellWidgetClass);
end;


{$ENDIF read_implementation}
