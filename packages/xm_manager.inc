/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function XmIsManager(w : TWidget) : TBoolean;

{ XmIsManager  }
  var
    xmManagerWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmManagerWidgetClass = ^TXmManagerWidgetClass;
//  TXmManagerWidgetClass = PXmManagerClassRec;
//
//  PXmManagerWidget = ^TXmManagerWidget;
//  TXmManagerWidget = PXmManagerRec;

{*******    Public Function Declarations    ******* }
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsManager(w: TWidget): TBoolean;
begin
  XmIsManager:=XtIsSubclass(w,xmManagerWidgetClass);
end;

{$ENDIF read_implementation}
