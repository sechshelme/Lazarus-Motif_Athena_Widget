/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    xmColumnWidgetClass : TWidgetClass;cvar;external libXm;
//type
//  PXmColumnWidgetClass = ^TXmColumnWidgetClass;
//  TXmColumnWidgetClass = PXmColumnClassRec;
//
//  PXmColumnWidget = ^TXmColumnWidget;
//  TXmColumnWidget = PXmColumnRec;

function XmIsColumn(w : TWidget) : TBoolean;

function XmCreateColumn(para1:TWidget; para2:TXtString; para3:TArgList; para4:TCardinal):TWidget;cdecl;external libXm;
{
 * Variable argument list functions
  }
//function XmVaCreateColumn(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateColumn(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedColumn(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedColumn(parent:TWidget; name:Pchar):TWidget; varargs cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsColumn(w: TWidget): TBoolean;
begin
  XmIsColumn:=XtIsSubclass(w,xmColumnWidgetClass);
end;

{$ENDIF read_implementation}
