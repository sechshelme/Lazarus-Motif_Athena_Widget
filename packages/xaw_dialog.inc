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
 background	     Background		Pixel		XtDefaultBackground
 borderColor	     BorderColor	Pixel		XtDefaultForeground
 borderWidth	     BorderWidth	Dimension	1
 destroyCallback     Callback		Pointer		NULL
 height		     Height		Dimension	computed at create
 icon		     Icon		Pixmap		0
 label		     Label		String		NULL
 mappedWhenManaged   MappedWhenManaged	Boolean		True
 sensitive	     Sensitive		Boolean		True
 value		     Value		String		NULL
 width		     Width		Dimension	computed at create
 x		     Position		Position	0
 y		     Position		Position	0

 }

const
  XtCIcon = 'Icon';  
  XtNicon = 'icon';  
  var
    dialogWidgetClass : TWidgetClass;cvar;external libXaw;

procedure XawDialogAddButton(dialog:TWidget; name:Pchar; _function:TXtCallbackProc; client_data:TXtPointer);cdecl;external libXaw;
function XawDialogGetValueString(w:TWidget):Pchar;cdecl;external libXaw;

//type
//  PDialogWidgetClass = ^TDialogWidgetClass;
//  TDialogWidgetClass = PDialogClassRec;
//
//  PDialogWidget = ^TDialogWidget;
//  TDialogWidget = PDialogRec;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
