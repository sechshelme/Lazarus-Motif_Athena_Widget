unit XTCore;

interface

uses
  XTIntrinsic;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

var
  coreWidgetClass : TWidgetClass;cvar;external libXt;
  widgetClass : TWidgetClass;cvar;external libXt;

  //type
  //  PCoreWidgetClass = ^TCoreWidgetClass;
  //  TCoreWidgetClass = PWidgetClassRec;
  //
  //  PCoreWidget = ^TCoreWidget;
  //  TCoreWidget = PWidgetRec;

implementation

end.
