/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    xmCommandWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmCommandWidgetClass = ^TXmCommandWidgetClass;
//  TXmCommandWidgetClass = PXmCommandClassRec;
//
//  PXmCommandWidget = ^TXmCommandWidget;
//  TXmCommandWidget = PXmCommandRec;

function XmIsCommand(w : TWidget) : TBoolean;

{*******    Public Function Declarations    ******* }

function XmCreateCommand(parent:TWidget; name:TXtString; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
//function XmVaCreateCommand(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateCommand(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedCommand(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedCommand(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{#if NeedWidePrototypes }
function XmCommandGetChild(widget:TWidget; child:dword):TWidget;cdecl;external libXm;
{#else }
{                        unsigned char child) ; }
{#endif /* NeedWidePrototypes */ }
procedure XmCommandSetValue(widget:TWidget; value:TXmString);cdecl;external libXm;
procedure XmCommandAppendValue(widget:TWidget; value:TXmString);cdecl;external libXm;
procedure XmCommandError(widget:TWidget; error:TXmString);cdecl;external libXm;
function XmCreateCommandDialog(ds_p:TWidget; name:TXtString; fsb_args:TArgList; fsb_n:TCardinal):TWidget;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }
{ DON'T ADD ANYTHING AFTER THIS #endif  }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsCommand(w: TWidget): TBoolean;
begin
  XmIsCommand:=XtIsSubclass(w,xmCommandWidgetClass);
end;


{$ENDIF read_implementation}
