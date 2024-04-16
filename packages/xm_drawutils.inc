/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}




type
  PXmBevelOption = ^TXmBevelOption;
  TXmBevelOption =  Longint;
  Const
    XmBEVEL_BOTTOM = 0;
    XmBEVEL_TOP = 1;
    XmBEVEL_BOTH = 2;

procedure XmDrawBevel(para1:PDisplay; para2:TDrawable; para3:TGC; para4:TGC; para5:longint; para6:longint; para7:dword; para8:TXmBevelOption);cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
