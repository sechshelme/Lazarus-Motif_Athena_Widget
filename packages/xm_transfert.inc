/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



  var
    XmQTtransfer : TXrmQuark;cvar;external libXm;

  type
  PXmTransferTraitRec = ^TXmTransferTraitRec;
  TXmTransferTraitRec = record
      version : longint;
      convertProc : TXmConvertCallbackProc;
      destinationProc : TXmDestinationCallbackProc;
      destinationPreHookProc : TXmDestinationCallbackProc;
    end;
  TXmTransferTrait = PXmTransferTraitRec;
  PXmTransferTrait = ^TXmTransferTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
