
{$IFDEF read_interface}


  var
    XmQTtakesDefault : TXrmQuark;cvar;external libXm;
type

  TXmTakesDefaultNotifyProc = procedure (w:TWidget; state:TXtEnum);cdecl;
{ Version 0: initial release.  }

  PXmTakesDefaultTraitRec = ^TXmTakesDefaultTraitRec;
  TXmTakesDefaultTraitRec = record
      version : longint;
      showAsDefault : TXmTakesDefaultNotifyProc;
    end;
  TXmTakesDefaultTrait = PXmTakesDefaultTraitRec;
  PXmTakesDefaultTrait = ^TXmTakesDefaultTrait;

  Const
    XmDEFAULT_READY = 0;
    XmDEFAULT_ON = 1;
    XmDEFAULT_OFF = 2;
    XmDEFAULT_FORGET = 3;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
