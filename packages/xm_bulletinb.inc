/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    xmBulletinBoardWidgetClass : TWidgetClass;cvar;external libXm;

//type
//  PXmBulletinBoardWidgetClass = ^TXmBulletinBoardWidgetClass;
//  TXmBulletinBoardWidgetClass = PXmBulletinBoardClassRec;
//
//  PXmBulletinBoardWidget = ^TXmBulletinBoardWidget;
//  TXmBulletinBoardWidget = PXmBulletinBoardRec;

function XmIsBulletinBoard(w : TWidget) : TBoolean;

{*******    Public Function Declarations    ******* }

function XmCreateBulletinBoard(p:TWidget; name:TXtString; args:TArgList; n:TCardinal):TWidget;cdecl;external libXm;
function XmCreateBulletinBoardDialog(ds_p:TWidget; name:TXtString; bb_args:TArgList; bb_n:TCardinal):TWidget;cdecl;external libXm;
{
 * Variable argument list functions
  }
//function XmVaCreateBulletinBoard(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateBulletinBoard(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedBulletinBoard(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedBulletinBoard(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
{*******    End Public Function Declarations    ******* }
{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsBulletinBoard(w: TWidget): TBoolean;
begin
  XmIsBulletinBoard:=XtIsSubclass(w,xmBulletinBoardWidgetClass);
end;


{$ENDIF read_implementation}
