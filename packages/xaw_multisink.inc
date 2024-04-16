/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

{
 * MultiSink Object
  }


{ Resources:

 Name		     Class		RepType		Default Value
 ----		     -----		-------		-------------
 echo                Output             Boolean         True
 displayNonprinting  Output             Boolean         True
 fontSet             FontSet            XFontSet        XtDefaultFontSet

 }

//const
//  XtCOutput = 'Output';  
//  XtNdisplayNonprinting = 'displayNonprinting';  
//  XtNecho = 'echo';  

//const
//  XtNfontSet = 'fontSet';  

//const
//  XtCFontSet = 'FontSet';  

var
    multiSinkObjectClass : TWidgetClass;cvar;external libXaw;

//type
//  PMultiSinkObjectClass = ^TMultiSinkObjectClass;
//  TMultiSinkObjectClass = PMultiSinkClassRec;
//
//  PMultiSinkObject = ^TMultiSinkObject;
//  TMultiSinkObject = PMultiSinkRec;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
