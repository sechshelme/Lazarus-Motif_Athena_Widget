/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    XmQTjoinSide : TXrmQuark;cvar;external libXm;
type
  TXmJoinSideSetValueProc = procedure (tab:TWidget; join_side:byte; join_thickness:TDimension);cdecl;
  TXmJoinSideGetValueProc = function (tab:TWidget; join_thickness:PDimension):byte;cdecl;
{ Version 0: initial release.  }

  PXmJoinSideTraitRec = ^TXmJoinSideTraitRec;
  TXmJoinSideTraitRec = record
      version : longint;
      setValue : TXmJoinSideSetValueProc;
      getValue : TXmJoinSideGetValueProc;
    end;
  TXmJoinSideTrait = PXmJoinSideTraitRec;
  PXmJoinSideTrait = ^TXmJoinSideTrait;
  Const
    XmLEFT = 1;
    XmRIGHT = 2;
    XmTOP = 3;
    XmBOTTOM = 4;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
