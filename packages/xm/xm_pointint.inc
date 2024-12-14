
{$IFDEF read_interface}


  var
    XmQTpointIn : TXrmQuark;cvar;external libXm;
type
  TXmPointInProc = function (w:TWidget; x:TPosition; y:TPosition):TBoolean;cdecl;

  PXmPointInTraitRec = ^TXmPointInTraitRec;
  TXmPointInTraitRec = record
      version : longint;
      pointIn : TXmPointInProc;
    end;
  TXmPointInTrait = PXmPointInTraitRec;
  PXmPointInTrait = ^TXmPointInTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
