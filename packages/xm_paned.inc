/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}




const
  XmPanedAskChild = 0;

//type
//  PXmPanedWidgetClass = ^TXmPanedWidgetClass;
//  TXmPanedWidgetClass = PXmPanedClassRec;
//
//  PXmPanedWidget = ^TXmPanedWidget;
//  TXmPanedWidget = PXmPanedRec;

{***********************************************************
 *
 *  Public Procedures 
 *
 *********************************************************** }
{	Function Name: XmPanedGetPanes
 *	Description: Returns the number of panes in the paned widget.
 *	Arguments: w - the paned widget.
 *                 panes - the list of all panes contained in this widget.
 *                 num - the number of panes.
 *	Returns: the number of panes in the paned widget.
  }
function XmPanedGetPanes(para1:TWidget; para2:PWidgetList; para3:Plongint):longint;cdecl;external libXm;
{	Function Name: XmCreatePaned
 *	Description: Creation Routine for UIL and ADA.
 *	Arguments: parent - the parent widget.
 *                 name - the name of the widget.
 *                 args, num_args - the number and list of args.
 *	Returns: The Widget created.
  }

function XmCreatePaned(para1:TWidget; para2:TXtString; para3:TArgList; para4:TCardinal):TWidget;cdecl;external libXm;
{ Class record constant  }
  var
    xmPanedWidgetClass : TWidgetClass;cvar;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
