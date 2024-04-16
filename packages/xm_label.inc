/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  var
    xmLabelWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmLabelWidgetClass = ^TXmLabelWidgetClass;
//  TXmLabelWidgetClass = PXmLabelClassRec;
//
//  PXmLabelWidget = ^TXmLabelWidget;
//  TXmLabelWidget = PXmLabelRec;

function XmIsLabel(w : TWidget) : TBoolean;

{ XmIsLabel  }
{*******    Public Function Declarations    ******* }

function XmCreateLabel(parent:TWidget; name:Pchar; arglist:PArg; argCount:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreateLabel(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateLabel(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedLabel(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedLabel(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsLabel(w: TWidget): TBoolean;
begin
  XmIsLabel:=XtIsSubclass(w,xmLabelWidgetClass);
end;


{$ENDIF read_implementation}
