/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}






//type
//  PXmTabStackWidget = ^TXmTabStackWidget;
//  TXmTabStackWidget = PXmTabStackRec;
//
//  PXmTabStackWidgetClass = ^TXmTabStackWidgetClass;
//  TXmTabStackWidgetClass = PXmTabStackClassRec;
  var
    xmTabStackWidgetClass : TWidgetClass;cvar;external libXm;

function XmIsTabStack(w : TWidget) : TBoolean;

{ XmIsTabStack  }

function XmCreateTabStack(para1:TWidget; para2:TXtString; para3:TArgList; para4:TCardinal):TWidget;cdecl;external libXm;
function XmTabStackGetSelectedTab(para1:TWidget):TWidget;cdecl;external libXm;
procedure XmTabStackSelectTab(para1:TWidget; para2:TBoolean);cdecl;external libXm;
function XmTabStackIndexToWidget(para1:TWidget; para2:longint):TWidget;cdecl;external libXm;
function XmTabStackXYToWidget(para1:TWidget; para2:longint; para3:longint):TWidget;cdecl;external libXm;
{
 * Variable argument list functions
  }
//function XmVaCreateTabStack(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateTabStack(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedTabStack(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedTabStack(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsTabStack(w: TWidget): TBoolean;
begin
  XmIsTabStack:=XtIsSubclass(w,xmTabStackWidgetClass);
end;


{$ENDIF read_implementation}
