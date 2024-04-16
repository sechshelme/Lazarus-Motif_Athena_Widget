/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


{  Form Widget   }
  var
    xmFormWidgetClass : TWidgetClass;cvar;external libXm;
//type
//  PXmFormWidgetClass = ^TXmFormWidgetClass;
//  TXmFormWidgetClass = PXmFormClassRec;
//
//  PXmFormWidget = ^TXmFormWidget;
//  TXmFormWidget = PXmFormRec;

function XmIsForm(w : TWidget) : TBoolean;

{ XmIsForm  }
{*******    Public Function Declarations    ******* }

function XmCreateForm(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;
function XmCreateFormDialog(parent:TWidget; name:Pchar; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;
//function XmVaCreateForm(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateForm(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedForm(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedForm(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsForm(w: TWidget): TBoolean;
begin
  XmIsForm:=XtIsSubclass(w,xmFormWidgetClass);
end;

{$ENDIF read_implementation}
