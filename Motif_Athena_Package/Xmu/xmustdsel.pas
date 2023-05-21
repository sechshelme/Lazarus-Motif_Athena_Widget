unit XmuStdSel;

interface

uses
  ctypes,
  x, xlib,
  XTIntrinsic;

const
  libXmu = 'libXmu.so';

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

function XmuConvertStandardSelection(w: TWidget; timev: TTime; selection: PAtom; target: PAtom; type_return: PAtom;
  value_return: PXPointer; length_return: pculong; format_return: pcint): TBoolean; cdecl; external libXmu;

implementation

end.
