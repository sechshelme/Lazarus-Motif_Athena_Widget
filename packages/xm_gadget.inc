/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function XmIsGadget(w : TWidget) : TBoolean;

{ XmIsGadget  }
  var
    xmGadgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmGadgetClass = ^TXmGadgetClass;
//  TXmGadgetClass = PXmGadgetClassRec;
//
//  PXmGadget = ^TXmGadget;
//  TXmGadget = PXmGadgetRec;

{*******    Public Function Declarations    ******* }
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsGadget(w: TWidget): TBoolean;
begin
  XmIsGadget:=XtIsSubclass(w,xmGadgetClass);
end;

{$ENDIF read_implementation}
