
{$IFDEF read_interface}



function XmIsDialogShell(w : TWidget) : TBoolean;

{ XmIsDialogShell  }
  var
    xmDialogShellWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmDialogShellWidgetClass = ^TXmDialogShellWidgetClass;
//  TXmDialogShellWidgetClass = PXmDialogShellClassRec;
//
//  PXmDialogShellWidget = ^TXmDialogShellWidget;
//  TXmDialogShellWidget = PXmDialogShellRec;

{*******    Public Function Declarations    ******* }

function XmCreateDialogShell(p:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsDialogShell(w: TWidget): TBoolean;
begin
  XmIsDialogShell:=XtIsSubclass(w,xmDialogShellWidgetClass);
end;

{$ENDIF read_implementation}
