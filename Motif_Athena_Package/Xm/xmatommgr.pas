unit XmAtomMgr;

interface

uses
  x, xlib,
  XTIntrinsic;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

//{$include <Xm/Xm.h>}
//{$include <X11/Xresource.h>}

function XmInternAtom(display:PDisplay; name:TXtString; only_if_exists:TBoolean):TAtom;cdecl;external libXm;
{ X11r5's XGetAtomName equivalent  }
function XmGetAtomName(display:PDisplay; atom:TAtom):TXtString;cdecl;external libXm;

implementation

end.
