/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



var
    xmSimpleSpinBoxWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmSimpleSpinBoxWidgetClass = ^TXmSimpleSpinBoxWidgetClass;
//  TXmSimpleSpinBoxWidgetClass = PXmSimpleSpinBoxClassRec;
//
//  PXmSimpleSpinBoxWidget = ^TXmSimpleSpinBoxWidget;
//  TXmSimpleSpinBoxWidget = PXmSimpleSpinBoxRec;
{ Spin externs for application accessible functions  }

function XmCreateSimpleSpinBox(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;
procedure XmSimpleSpinBoxAddItem(widget:TWidget; item:TXmString; pos:longint);cdecl;external libXm;
procedure XmSimpleSpinBoxDeletePos(widget:TWidget; pos:longint);cdecl;external libXm;
procedure XmSimpleSpinBoxSetItem(widget:TWidget; item:TXmString);cdecl;external libXm;
{
 * Variable argument list functions
  }
//function XmVaCreateSimpleSpinBox(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateSimpleSpinBox(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedSimpleSpinBox(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedSimpleSpinBox(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
