/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function XmIsMainWindow(w : TWidget) : TBoolean;

{ XmIsMainWindow  }
  var
    xmMainWindowWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmMainWindowWidgetClass = ^TXmMainWindowWidgetClass;
//  TXmMainWindowWidgetClass = PXmMainWindowClassRec;
//
//  PXmMainWindowWidget = ^TXmMainWindowWidget;
//  TXmMainWindowWidget = PXmMainWindowRec;

{*******    Public Function Declarations    ******* }

procedure XmMainWindowSetAreas(w:TWidget; menu:TWidget; command:TWidget; hscroll:TWidget; vscroll:TWidget; wregion:TWidget);cdecl;external libXm;
function XmMainWindowSep1(w:TWidget):TWidget;cdecl;external libXm;
function XmMainWindowSep2(w:TWidget):TWidget;cdecl;external libXm;
function XmMainWindowSep3(w:TWidget):TWidget;cdecl;external libXm;
function XmCreateMainWindow(parent:TWidget; name:Pchar; args:TArgList; argCount:TCardinal):TWidget;cdecl;external libXm;
//function XmVaCreateMainWindow(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateMainWindow(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedMainWindow(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedMainWindow(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsMainWindow(w: TWidget): TBoolean;
begin
  XmIsMainWindow:=XtIsSubclass(w,xmMainWindowWidgetClass);
end;


{$ENDIF read_implementation}
