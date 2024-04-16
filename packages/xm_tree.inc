/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}





{***********************************************************
*	INCLUDE FILES
************************************************************ }
{***********************************************************
*	TYPEDEFS AND DEFINES
************************************************************ }
//type
//  PXmTreeWidgetClass = ^TXmTreeWidgetClass;
//  TXmTreeWidgetClass = PXmTreeClassRec;
//
//  PXmTreeWidget = ^TXmTreeWidget;
//  TXmTreeWidget = PXmTreeRec;

{	Function Name: XmCreateTree
 *	Description: Creation Routine for UIL and ADA.
 *	Arguments: parent - the parent widget.
 *                 name - the name of the widget.
 *                 args, num_args - the number and list of args.
 *	Returns: The Widget created.
  }

function XmCreateTree(para1:TWidget; para2:TXtString; para3:TArgList; para4:TCardinal):TWidget;cdecl;external libXm;
  var
    xmTreeWidgetClass : TWidgetClass;cvar;external libXm;
{***********************************************************
*	MACROS
************************************************************ }
{***********************************************************
*	GLOBAL FUNCTION DECLARATIONS
************************************************************ }

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
