/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



function XmIsScreen(w : TWidget) : TBoolean;

//type
//  PXmScreen = ^TXmScreen;
//  TXmScreen = PXmScreenRec;
//
//  PXmScreenClass = ^TXmScreenClass;
//  TXmScreenClass = PXmScreenClassRec;
  var
    xmScreenClass : TWidgetClass;cvar;external libXm;
{*******    Public Function Declarations    ******* }
type

  TXmScreenColorProc = procedure (screen:PScreen; bg_color:PXColor; fg_color:PXColor; sel_color:PXColor; ts_color:PXColor; bs_color:PXColor);cdecl;
  TXmAllocColorProc = function (display:PDisplay; colormap:TColormap; screen_in_out:PXColor):TStatus;cdecl;

function XmGetXmScreen(screen:PScreen):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsScreen(w: TWidget): TBoolean;
begin
  XmIsScreen:=XtIsSubclass(w,xmScreenClass);
end;

{$ENDIF read_implementation}
