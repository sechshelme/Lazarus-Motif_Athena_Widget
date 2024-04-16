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

type
//  PXmIconButtonWidgetClass = ^TXmIconButtonWidgetClass;
//  TXmIconButtonWidgetClass = PXmIconButtonClassRec;
//
//  PXmIconButtonWidget = ^TXmIconButtonWidget;
//  TXmIconButtonWidget = PXmIconButtonRec;

{***********************************************************
*	MACROS
************************************************************ }
{***********************************************************
*	GLOBAL DECLARATIONS
************************************************************ }
{ The current state of the icon button.  }
{ The event that caused this action.  }

  PXmIconButtonCallbackInfo = ^TXmIconButtonCallbackInfo;
  TXmIconButtonCallbackInfo = record
      state : TBoolean;
      event : PXEvent;
    end;
{***********************************************************
*	EXTERNAL DECLARATIONS
************************************************************ }
{	Function Name: XmCreateIconButton
 *	Description: Creation Routine for UIL and ADA.
 *	Arguments: parent - the parent widget.
 *                 name - the name of the widget.
 *                 args, num_args - the number and list of args.
 *	Returns: The Widget created.
  }

function XmCreateIconButton(para1:TWidget; para2:TXtString; para3:TArgList; para4:TCardinal):TWidget;cdecl;external libXm;
  var
    xmIconButtonWidgetClass : TWidgetClass;cvar;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
