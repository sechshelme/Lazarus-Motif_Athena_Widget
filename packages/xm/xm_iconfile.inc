
{$IFDEF read_interface}



const
  XmUNSPECIFIED_ICON_SIZE = 0;  
  XmLARGE_ICON_SIZE = 1;  
  XmMEDIUM_ICON_SIZE = 2;  
  XmSMALL_ICON_SIZE = 3;  
  XmTINY_ICON_SIZE = 4;  
{*******    Public Function Declarations for IconFile.c    ******* }

function XmGetIconFileName(screen:PScreen; imageInstanceName:TXtString; imageClassName:TXtString; hostPrefix:TXtString; size:dword):TXtString;cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
