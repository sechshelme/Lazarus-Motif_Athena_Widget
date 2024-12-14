
{$IFDEF read_interface}



function XmIsVendorShell(w : TWidget) : TBoolean;

{ XmIsVendorShell  }
//type
//  PXmVendorShellWidget = ^TXmVendorShellWidget;
//  TXmVendorShellWidget = PXmVendorShellRec;
//
//  PXmVendorShellWidgetClass = ^TXmVendorShellWidgetClass;
//  TXmVendorShellWidgetClass = PXmVendorShellClassRec;

  var
    vendorShellWidgetClass : TWidgetClass;cvar;external libXm;
{*******    Public Function Declarations    ******* }

function XmIsMotifWMRunning(shell:TWidget):TBoolean;cdecl;external libXm;
function XmToolTipGetLabel(wid:TWidget):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsVendorShell(w: TWidget): TBoolean;
begin
  XmIsVendorShell:=XtIsSubclass(w,vendorShellWidgetClass);
end;

{$ENDIF read_implementation}
