/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


{ Resources:

 Name		     Class		RepType		Default Value
 ----		     -----		-------		-------------
 dataCompression     DataCompression	Boolean		True
 length		     Length		int		(internal)
 pieceSize	     PieceSize		int		BUFSIZ
 string		     String		String		NULL
 type		     Type		XawAsciiType	XawAsciiString
 useStringInPlace    UseStringInPlace	Boolean		False

 }
  var
    multiSrcObjectClass : TWidgetClass;cvar;external libXaw;

//type
//  PMultiSrcObjectClass = ^TMultiSrcObjectClass;
//  TMultiSrcObjectClass = PMultiSrcClassRec;
//
//  PMultiSrcObject = ^TMultiSrcObject;
//  TMultiSrcObject = PMultiSrcRec;

const
//  MultiSourceObjectClass = MultiSrcObjectClass;  
//  MultiSourceObject = MultiSrcObject;  
//  XtCDataCompression = 'DataCompression';  
//  XtCPieceSize = 'PieceSize';  
//  XtCType = 'Type';  
//  XtCUseStringInPlace = 'UseStringInPlace';  
//  XtNdataCompression = 'dataCompression';  
//  XtNpieceSize = 'pieceSize';  
//  XtNtype = 'type';  
//  XtNuseStringInPlace = 'useStringInPlace';  
  XtRMultiType = 'MultiType';  
  //XtEstring = 'string';  
//  XtEfile = 'file';

{***********************************************************
 *
 * THESE ROUTINES ARE NOT PUBLIC: Source should call
 *
 * the AsciiSrc API which currently forwards requests here.
 *
 * future versions (like there's going to be an R7 Xaw!) may
 *
 * eliminate this file or at least these functions entirely.
 *
 *********************************************************** }

procedure XawMultiSourceFreeString(w:TWidget);cdecl;external libXaw;
function _XawMultiSave(w:TWidget):TBool;cdecl;external libXaw;
function _XawMultiSaveAsFile(w:TWidget; name:Pchar):TBool;cdecl;external libXaw;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
