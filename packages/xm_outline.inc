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
//  PXmOutlineWidgetClass = ^TXmOutlineWidgetClass;
//  TXmOutlineWidgetClass = PXmOutlineClassRec;
//
//  PXmOutlineWidget = ^TXmOutlineWidget;
//  TXmOutlineWidget = PXmOutlineRec;

{***********************************************************
*	MACROS
************************************************************ }
{***********************************************************
*	GLOBAL FUNCTION DECLARATIONS
************************************************************ }
{	Function Name: XmCreateOutline
 *	Description: Creation Routine for UIL and ADA.
 *	Arguments: parent - the parent widget.
 *                 name - the name of the widget.
 *                 args, num_args - the number and list of args.
 *	Returns: The Widget created.
  }

function XmCreateOutline(para1:TWidget; para2:TXtString; para3:TArgList; para4:TCardinal):TWidget;cdecl;external libXm;
  var
    xmOutlineWidgetClass : TWidgetClass;cvar;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
