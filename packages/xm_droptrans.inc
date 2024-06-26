/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



const
  XmTRANSFER_FAILURE = 0;  
  XmTRANSFER_SUCCESS = 1;  
  var
    xmDropTransferObjectClass : TWidgetClass;cvar;external libXm;

//type
  //PXmDropTransferObjectClass = ^TXmDropTransferObjectClass;
  //TXmDropTransferObjectClass = PXmDropTransferClassRec;
  //
  //PXmDropTransferObject = ^TXmDropTransferObject;
  //TXmDropTransferObject = PXmDropTransferRec;

function XmIsDropTransfer(w : TWidget) : TBoolean;

{ XmIsDropTransfer  }
type
  PXmDropTransferEntryRec = ^TXmDropTransferEntryRec;
  TXmDropTransferEntryRec = record
      client_data : TXtPointer;
      target : TAtom;
    end;
  TXmDropTransferEntry = PXmDropTransferEntryRec;
  PXmDropTransferEntry = ^TXmDropTransferEntry;
{*******    Public Function Declarations    ******* }

function XmDropTransferStart(refWidget:TWidget; args:TArgList; argCount:TCardinal):TWidget;cdecl;external libXm;
procedure XmDropTransferAdd(widget:TWidget; transfers:TXmDropTransferEntry; num_transfers:TCardinal);cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsDropTransfer(w: TWidget): TBoolean;
begin
  XmIsDropTransfer:=XtIsSubclass(w,xmDropTransferObjectClass);
end;

{$ENDIF read_implementation}
