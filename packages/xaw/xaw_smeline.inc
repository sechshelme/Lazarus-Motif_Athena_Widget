
{$IFDEF read_interface}



{ Resources:

 Name		     Class		RepType		Default Value
 ----		     -----		-------		-------------
 callback            Callback		Pointer		NULL
 destroyCallback     Callback		Pointer		NULL
 height		     Height		Dimension	0
 sensitive	     Sensitive		Boolean		True
 width		     Width		Dimension	0
 x		     Position		Position	0
 y		     Position		Position	0

 }

const
//  XtCLineWidth = 'LineWidth';
  XtCStipple = 'Stipple';  
//  XtNlineWidth = 'lineWidth';  
  XtNstipple = 'stipple';  
  var
    smeLineObjectClass : TWidgetClass;cvar;external libXaw;

    //type
    //  PSmeLineObjectClass = ^TSmeLineObjectClass;
    //  TSmeLineObjectClass = PSmeLineClassRec;
    //
    //  PSmeLineObject = ^TSmeLineObject;
    //  TSmeLineObject = PSmeLineRec;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
