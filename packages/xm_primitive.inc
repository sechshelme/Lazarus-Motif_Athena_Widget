/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function XmIsPrimitive(w : TWidget) : TBoolean;

  var
    xmPrimitiveWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmPrimitiveWidgetClass = ^TXmPrimitiveWidgetClass;
//  TXmPrimitiveWidgetClass = PXmPrimitiveClassRec;
//
//  PXmPrimitiveWidget = ^TXmPrimitiveWidget;
//  TXmPrimitiveWidget = PXmPrimitiveRec;
{*******    Public Function Declarations    ******* }
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsPrimitive(w: TWidget): TBoolean;
begin
  XmIsPrimitive:=XtIsSubclass(w,xmPrimitiveWidgetClass);
end;

{$ENDIF read_implementation}
