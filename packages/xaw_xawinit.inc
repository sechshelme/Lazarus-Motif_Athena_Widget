/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

//const
//  XawVendor = XVENDORNAMESHORT;  

const
  XawVersion = 7000002;
//type
//  TXawDL = TXawDisplayList;



procedure XawInitializeWidgetSet; cdecl; external libXaw;

procedure XawInitializeDefaultConverters; cdecl; external libXaw;

function XawOpenApplication(app_context_return: PXtAppContext; dpy: PDisplay; screen: PScreen; application_name: TXtString; application_class: TXtString; widget_class: TWidgetClass; argc: Plongint; argv: PXtString): TWidget; cdecl; external libXaw;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
