unit XtVendor;

interface

uses
  XTIntrinsic;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// {$include <X11/Intrinsic.h>}
{**********************************************************************
 *
 * VendorShell Widget
 *
 ********************************************************************** }
{ Class record constants  }
  var
    vendorShellWidgetClass : TWidgetClass;cvar;external libXt;

  //type
  //  PVendorShellWidgetClass = ^TVendorShellWidgetClass;
  //  TVendorShellWidgetClass = PVendorShellClassRec;

implementation

end.
