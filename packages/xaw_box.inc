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
 border		     BorderColor	Pixel		XtDefaultForeground
 borderWidth	     BorderWidth	Dimension	1
 destroyCallback     Callback		Pointer		NULL
 displayList	     DisplayList	XawDisplayList*	NULL
 hSpace		     HSpace		Dimension	4
 height		     Height		Dimension	0
 mappedWhenManaged   MappedWhenManaged	Boolean		True
 orientation	     Orientation	XtOrientation	vertical
 vSpace		     VSpace		Dimension	4
 width		     Width		Dimension	0
 x		     Position		Position	0
 y		     Position		Position	0

 }
//const
//  XtNhSpace = 'hSpace';  
//  XtNvSpace = 'vSpace';  

//const
//  XawNdisplayList = 'displayList';  

//const
//  XawCDisplayList = 'DisplayList';  

//const
//  XawRDisplayList = 'XawDisplayList';  

var
    boxWidgetClass : TWidgetClass;cvar;external libXaw;

//type
//  PBoxWidgetClass = ^TBoxWidgetClass;
//  TBoxWidgetClass = PBoxClassRec;
//
//  PBoxWidget = ^TBoxWidget;
//  TBoxWidget = PBoxRec;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
