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
 allowHoriz	     Boolean		Boolean		False
 allowVert	     Boolean		Boolean		False
 background	     Background		Pixel		XtDefaultBackground
 border		     BorderColor	Pixel		XtDefaultForeground
 borderWidth	     BorderWidth	Dimension	1
 destroyCallback     Callback		Pointer		NULL
 forceBars	     Boolean		Boolean		False
 height		     Height		Dimension	0
 mappedWhenManaged   MappedWhenManaged	Boolean		True
 reportCallback	     ReportCallback	Pointer		NULL
 sensitive	     Sensitive		Boolean		True
 useBottom	     Boolean		Boolean		False
 useRight	     Boolean		Boolean		False
 width		     Width		Dimension	0
 x		     Position		Position	0
 y		     Position		Position	0

 }

const
  XtNforceBars = 'forceBars';  
  XtNallowHoriz = 'allowHoriz';  
  XtNallowVert = 'allowVert';  
  XtNuseBottom = 'useBottom';  
  XtNuseRight = 'useRight';  
  var
    viewportWidgetClass : TWidgetClass;cvar;external libXaw;

  //type
  //PViewportWidgetClass = ^TViewportWidgetClass;
  //TViewportWidgetClass = PViewportClassRec;
  //
  //PViewportWidget = ^TViewportWidget;
  //TViewportWidget = PViewportRec;

procedure XawViewportSetLocation(gw:TWidget; xoff:single; yoff:single);cdecl;external libXaw;

procedure XawViewportSetCoordinates(gw:TWidget; x:TPosition; y:TPosition);cdecl;external libXaw;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
