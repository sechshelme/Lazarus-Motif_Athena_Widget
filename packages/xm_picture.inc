/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}






type
  PXmPicture = ^TXmPicture;
  TXmPicture = Pointer;
  //  TXmPicture = PXmPictureRec;

  PXmPictureState = ^TXmPictureState;
  TXmPictureState = Pointer;
  //  TXmPictureState = PXmPictureStateRec;

function XmParsePicture(para1:Pchar):TXmPicture;cdecl;external libXm;
function XmGetNewPictureState(para1:TXmPicture):TXmPictureState;cdecl;external libXm;
function XmPictureProcessCharacter(para1:TXmPictureState; para2:char; para3:PBoolean):Pchar;cdecl;external libXm;
procedure XmPictureDelete(para1:TXmPicture);cdecl;external libXm;
procedure XmPictureDeleteState(para1:TXmPictureState);cdecl;external libXm;
function XmPictureGetCurrentString(para1:TXmPictureState):Pchar;cdecl;external libXm;
function XmPictureDoAutoFill(para1:TXmPictureState):Pchar;cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
