
{$IFDEF read_interface}




//type
//  PXmColorSelectorWidgetClass = ^TXmColorSelectorWidgetClass;
//  TXmColorSelectorWidgetClass = PXmColorSelectorClassRec;
//
//  PXmColorSelectorWidget = ^TXmColorSelectorWidget;
//  TXmColorSelectorWidget = PXmColorSelectorRec;

{	Function Name: XmCreateColorSelector
 *	Description: Creation Routine for UIL and ADA.
 *	Arguments: parent - the parent widget.
 *                 name - the name of the widget.
 *                 args, num_args - the number and list of args.
 *	Returns: The Widget created.
  }

function XmCreateColorSelector(para1:TWidget; para2:TXtString; para3:TArgList; para4:TCardinal):TWidget;cdecl;external libXm;
{
 * Variable argument list functions
  }
//function XmVaCreateColorSelector(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateColorSelector(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedColorSelector(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedColorSelector(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;

  var
    xmColorSelectorWidgetClass : TWidgetClass;cvar;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
