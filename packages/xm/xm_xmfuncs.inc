
{$IFDEF read_interface}



{ the old Xfuncs.h, for pre-R6  }

procedure bcopy;cdecl;external libXm;
procedure bzero;cdecl;external libXm;
function bcmp:longint;cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
