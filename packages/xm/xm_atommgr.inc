
{$IFDEF read_interface}




function XmInternAtom(display:PDisplay; name:TXtString; only_if_exists:TBoolean):TAtom;cdecl;external libXm;
{ X11r5's XGetAtomName equivalent  }
function XmGetAtomName(display:PDisplay; atom:TAtom):TXtString;cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
