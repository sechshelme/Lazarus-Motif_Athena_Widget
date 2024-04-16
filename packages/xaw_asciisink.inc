/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

{
 * AsciiSink Object
  }

{ Resources:

 Name		     Class		RepType		Default Value
 ----		     -----		-------		-------------
 echo                Output             Boolean         True
 displayNonprinting  Output             Boolean         True

 }

const
  XtCOutput = 'Output';  
  XtNdisplayNonprinting = 'displayNonprinting';  
  XtNecho = 'echo';  
{ Class record constants  }
  var
    asciiSinkObjectClass : TWidgetClass;cvar;external libXaw;

//type
//  PAsciiSinkObjectClass = ^TAsciiSinkObjectClass;
//  TAsciiSinkObjectClass = PAsciiSinkClassRec;
//
//  PAsciiSinkObject = ^TAsciiSinkObject;
//  TAsciiSinkObject = PAsciiSinkRec;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
