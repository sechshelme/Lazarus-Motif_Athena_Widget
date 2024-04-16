/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}




var
    XmQTaccessColors : TXrmQuark;cvar;external libXm;

    { this one can be expanded in the future  }

type
  PXmAccessColorDataRec = ^TXmAccessColorDataRec;
  TXmAccessColorDataRec = record
      valueMask : TMask;
      foreground : TPixel;
      background : TPixel;
      highlight_color : TPixel;
      top_shadow_color : TPixel;
      bottom_shadow_color : TPixel;
      select_color : TPixel;
    end;
  TXmAccessColorData = PXmAccessColorDataRec;
  PXmAccessColorData = ^TXmAccessColorData;

  TXmAccessColorsGetProc = procedure (widget:TWidget; color_data:TXmAccessColorData);cdecl;
  TXmAccessColorsSetProc = procedure (widget:TWidget; color_data:TXmAccessColorData);cdecl;

{ Trait structures and typedefs, place typedefs first  }
{ Version 0: initial release.  }

  PXmAccessColorsTraitRec = ^TXmAccessColorsTraitRec;
  TXmAccessColorsTraitRec = record
      version : longint;
      getColors : TXmAccessColorsGetProc;
      setColors : TXmAccessColorsGetProc;
    end;
  TXmAccessColorsTrait = PXmAccessColorsTraitRec;
  PXmAccessColorsTrait = ^TXmAccessColorsTrait;

const
  AccessColorInvalid = 0;  
  AccessForeground = 1 shl 0;  
  AccessBackgroundPixel = 1 shl 1;  
  AccessHighlightColor = 1 shl 2;  
  AccessTopShadowColor = 1 shl 3;  
  AccessBottomShadowColor = 1 shl 4;  
  AccessSelectColor = 1 shl 5;  

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
