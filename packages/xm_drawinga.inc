/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  var
    xmDrawingAreaWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmDrawingAreaWidgetClass = ^TXmDrawingAreaWidgetClass;
//  TXmDrawingAreaWidgetClass = PXmDrawingAreaClassRec;
//
//  PXmDrawingAreaWidget = ^TXmDrawingAreaWidget;
//  TXmDrawingAreaWidget = PXmDrawingAreaRec;

function XmIsDrawingArea(w : TWidget) : TBoolean;

{*******    Public Function Declarations    ******* }

function XmCreateDrawingArea(p:TWidget; name:TXtString; args:TArgList; n:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreateDrawingArea(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateDrawingArea(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedDrawingArea(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedDrawingArea(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsDrawingArea(w: TWidget): TBoolean;
begin
  XmIsDrawingArea:=XtIsSubclass(w,xmDrawingAreaWidgetClass);
end;

{$ENDIF read_implementation}
