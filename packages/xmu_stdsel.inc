/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function XmuConvertStandardSelection(w: TWidget; timev: TTime; selection: PAtom; target: PAtom; type_return: PAtom;
  value_return: PXPointer; length_return: pculong; format_return: pcint): TBoolean; cdecl; external libXmu;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
