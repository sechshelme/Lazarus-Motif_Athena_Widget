unit XmTransferT;

interface

uses
  xresource,
  XTIntrinsic,
  XmTransfer;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

//{$include <Xm/Xm.h>}
//{$include <Xm/TransferP.h>}
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

implementation

end.
