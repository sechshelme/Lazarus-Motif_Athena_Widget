
{$IFDEF read_interface}




//type
//  PXmTabBoxWidget = ^TXmTabBoxWidget;
//  TXmTabBoxWidget = PXmTabBoxRec;
//
//  PXmTabBoxWidgetClass = ^TXmTabBoxWidgetClass;
//  TXmTabBoxWidgetClass = PXmTabBoxClassRec;
  var
    xmTabBoxWidgetClass : TWidgetClass;cvar;external libXm;

function XmIsTabBox(w : TWidget) : TBoolean;

function XmCreateTabBox(para1:TWidget; para2:TXtString; para3:TArgList; para4:TCardinal):TWidget;cdecl;external libXm;
function XmTabBoxGetIndex(para1:TWidget; para2:longint; para3:longint):longint;cdecl;external libXm;
function XmTabBoxGetNumRows(para1:TWidget):longint;cdecl;external libXm;
function XmTabBoxGetNumColumns(para1:TWidget):longint;cdecl;external libXm;
function XmTabBoxGetNumTabs(para1:TWidget):longint;cdecl;external libXm;
function XmTabBoxGetTabRow(para1:TWidget; para2:longint):longint;cdecl;external libXm;
function XmTabBoxXYToIndex(para1:TWidget; para2:longint; para3:longint):longint;cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsTabBox(w: TWidget): TBoolean;
begin
  XmIsTabBox:=XtIsSubclass(w,xmTabBoxWidgetClass);
end;

{$ENDIF read_implementation}
