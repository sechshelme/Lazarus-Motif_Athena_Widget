
{$IFDEF read_interface}


  var
    XmQTactivatable : TXrmQuark;cvar;external libXm;
{ Trait structures and typedefs, place typedefs first  }
type

  TXmActivatableCallBackProc = procedure (w:TWidget; activCB:TXtCallbackProc; closure:TXtPointer; setunset:TBoolean);cdecl;
{ Version 0: initial release.  }

  PXmActivatableTraitRec = ^TXmActivatableTraitRec;
  TXmActivatableTraitRec = record
      version : longint;
      changeCB : TXmActivatableCallBackProc;
    end;
  TXmActivatableTrait = PXmActivatableTraitRec;
  PXmActivatableTrait = ^TXmActivatableTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
