/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  var
    XmQTspecifyLayoutDirection : TXrmQuark;cvar;external libXm;
type

  TXmGetLayoutDirectionProc = function (para1:TWidget):TXmDirection;cdecl;
{ Version 0: initial release.  }

  PXmSpecifyLayoutDirectionTraitRec = ^TXmSpecifyLayoutDirectionTraitRec;
  TXmSpecifyLayoutDirectionTraitRec = record
      version : longint;
      get_direction : TXmGetLayoutDirectionProc;
    end;
  TXmSpecifyLayoutDirectionTrait = PXmSpecifyLayoutDirectionTraitRec;
  PXmSpecifyLayoutDirectionTrait = ^TXmSpecifyLayoutDirectionTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
