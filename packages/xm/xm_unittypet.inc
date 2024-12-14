
{$IFDEF read_interface}


  var
    XmQTspecifyUnitType : TXrmQuark;cvar;external libXm ;
type

  TXmSpecUnitTypeGetProc = function (wid:TWidget):byte;cdecl;
{ Version 0: initial release.  }

  PXmSpecUnitTypeTraitRec = ^TXmSpecUnitTypeTraitRec;
  TXmSpecUnitTypeTraitRec = record
      version : longint;
      getUnitType : TXmSpecUnitTypeGetProc;
    end;
  TXmSpecUnitTypeTrait = PXmSpecUnitTypeTraitRec;
  PXmSpecUnitTypeTrait = ^TXmSpecUnitTypeTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
