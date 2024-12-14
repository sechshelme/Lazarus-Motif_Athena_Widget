
{$IFDEF read_interface}



function XmIsDragIconObjectClass(w : TWidget) : TBoolean;

  Const
    XmATTACH_NORTH_WEST = 0;
    XmATTACH_NORTH = 1;
    XmATTACH_NORTH_EAST = 2;
    XmATTACH_EAST = 3;
    XmATTACH_SOUTH_EAST = 4;
    XmATTACH_SOUTH = 5;
    XmATTACH_SOUTH_WEST = 6;
    XmATTACH_WEST = 7;
    XmATTACH_CENTER = 8;
    XmATTACH_HOT = 9;

//type
//  PXmDragIconObject = ^TXmDragIconObject;
//  TXmDragIconObject = PXmDragIconRec;
//
//  PXmDragIconObjectClass = ^TXmDragIconObjectClass;
//  TXmDragIconObjectClass = PXmDragIconClassRec;

  var
    xmDragIconObjectClass : TWidgetClass;cvar;external libXm;
{*******    Public Function Declarations    ******* }

function XmCreateDragIcon(parent:TWidget; name:TXtString; argList:TArgList; argCount:TCardinal):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsDragIconObjectClass(w: TWidget): TBoolean;
begin
  XmIsDragIconObjectClass:=XtIsSubclass(w,xmDragIconObjectClass);
end;

{$ENDIF read_implementation}
