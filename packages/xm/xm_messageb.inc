
{$IFDEF read_interface}



var
    xmMessageBoxWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmMessageBoxWidgetClass = ^TXmMessageBoxWidgetClass;
//  TXmMessageBoxWidgetClass = PXmMessageBoxClassRec;
//
//  PXmMessageBoxWidget = ^TXmMessageBoxWidget;
//  TXmMessageBoxWidget = PXmMessageBoxRec;

function XmIsMessageBox(w : TWidget) : TBoolean;

{*******    Public Function Declarations    ******* }

function XmCreateMessageBox(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
function XmCreateMessageDialog(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
function XmCreateErrorDialog(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
function XmCreateInformationDialog(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
function XmCreateQuestionDialog(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
function XmCreateWarningDialog(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
function XmCreateWorkingDialog(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
function XmCreateTemplateDialog(parent:TWidget; name:Pchar; al:TArgList; ac:TCardinal):TWidget;cdecl;external libXm;
{#if NeedWidePrototypes }
function XmMessageBoxGetChild(widget:TWidget; child:dword):TWidget;cdecl;external libXm;
{#else }
{                        unsigned char child) ; }
{#endif /* NeedWidePrototypes */ }
{
 * Variable argument list functions
  }
//function XmVaCreateMessageBox(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateMessageBox(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedMessageBox(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedMessageBox(parent:TWidget; name:Pchar):TWidget; varargs cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsMessageBox(w: TWidget): TBoolean;
begin
  XmIsMessageBox:=XtIsSubclass(w,xmMessageBoxWidgetClass);
end;


{$ENDIF read_implementation}
