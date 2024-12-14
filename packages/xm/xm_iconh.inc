
{$IFDEF read_interface}


  var
    xmIconHeaderClass : TWidgetClass;cvar;external libXm;

//type
//  PXmIconHeaderClass = ^TXmIconHeaderClass;
//  TXmIconHeaderClass = PXmIconHeaderClassRec;
//
//  PXmIconHeader = ^TXmIconHeader;
//  TXmIconHeader = PXmIconHeaderRec;

function XmIsIconHeader(w : TWidget) : TBoolean;

{*******    Public Function Declarations    ******* }

function XmCreateIconHeader(parent:TWidget; name:TXtString; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsIconHeader(w: TWidget): TBoolean;
begin
  XmIsIconHeader:=XtIsSubclass(w,xmIconHeaderClass);
end;

{$ENDIF read_implementation}
