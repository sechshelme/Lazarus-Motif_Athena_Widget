unit XmuStdSel;

interface

uses
  x, xlib,
  XTIntrinsic;

const
  libXmu = 'libXmu.so';

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

function XmuConvertStandardSelection(w: TWidget; timev: TTime; selection: PAtom; target: PAtom; type_return: PAtom;
  value_return: PXPointer; length_return: Pdword; format_return: Plongint): TBoolean; cdecl; external libXmu;

implementation

end.
