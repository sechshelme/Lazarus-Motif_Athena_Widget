
{$IFDEF read_interface}


  var
    XmQTspecifyUnhighlight : TXrmQuark;cvar;external libXm;
type

  TXmSpecifyUnhighlightProc = function (wid:TWidget; child:TWidget):TGC;cdecl;
{ Version 0: initial release.  }

  PXmSpecifyUnhighlightTraitRec = ^TXmSpecifyUnhighlightTraitRec;
  TXmSpecifyUnhighlightTraitRec = record
      version : longint;
      getUnhighlightGC : TXmSpecifyUnhighlightProc;
    end;
  TXmSpecifyUnhighlightTrait = PXmSpecifyUnhighlightTraitRec;
  PXmSpecifyUnhighlightTrait = ^TXmSpecifyUnhighlightTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
