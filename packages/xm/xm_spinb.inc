
{$IFDEF read_interface}


  var
    xmSpinBoxWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmSpinBoxWidgetClass = ^TXmSpinBoxWidgetClass;
//  TXmSpinBoxWidgetClass = PXmSpinBoxClassRec;
//
//  PXmSpinBoxWidget = ^TXmSpinBoxWidget;
//  TXmSpinBoxWidget = PXmSpinBoxRec;
{
 * Spin externs for application accessible functions
  }

function XmCreateSpinBox(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;

//function XmVaCreateSpinBox(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateSpinBox(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedSpinBox(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedSpinBox(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;

function XmSpinBoxValidatePosition(text_field:TWidget; position_value:Plongint):longint;cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
