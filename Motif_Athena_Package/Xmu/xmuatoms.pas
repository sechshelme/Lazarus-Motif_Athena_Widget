unit XmuAtoms;

interface

uses
  XTIntrinsic,
  x, xlib;

const
  libXmu = 'libXmu.so';

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

//{$include <X11/Intrinsic.h>}
//{$include <X11/Xfuncproto.h>}
type
  PAtomPtr = ^TAtomPtr;
  TAtomPtr = Pointer;
//  TAtomPtr = PAtomRec;
  var
    _XA_ATOM_PAIR  : TAtomPtr;cvar;external libXmu;
    _XA_CHARACTER_POSITION  : TAtomPtr;cvar;external libXmu;
    _XA_CLASS  : TAtomPtr;cvar;external libXmu;
    _XA_CLIENT_WINDOW  : TAtomPtr;cvar;external libXmu;
    _XA_CLIPBOARD  : TAtomPtr;cvar;external libXmu;
    _XA_COMPOUND_TEXT  : TAtomPtr;cvar;external libXmu;
    _XA_DECNET_ADDRESS  : TAtomPtr;cvar;external libXmu;
    _XA_DELETE  : TAtomPtr;cvar;external libXmu;
    _XA_FILENAME  : TAtomPtr;cvar;external libXmu;
    _XA_HOSTNAME  : TAtomPtr;cvar;external libXmu;
    _XA_IP_ADDRESS  : TAtomPtr;cvar;external libXmu;
    _XA_LENGTH  : TAtomPtr;cvar;external libXmu;
    _XA_LIST_LENGTH  : TAtomPtr;cvar;external libXmu;
    _XA_NAME  : TAtomPtr;cvar;external libXmu;
    _XA_NET_ADDRESS  : TAtomPtr;cvar;external libXmu;
    _XA_NULL  : TAtomPtr;cvar;external libXmu;
    _XA_OWNER_OS  : TAtomPtr;cvar;external libXmu;
    _XA_SPAN  : TAtomPtr;cvar;external libXmu;
    _XA_TARGETS  : TAtomPtr;cvar;external libXmu;
    _XA_TEXT  : TAtomPtr;cvar;external libXmu;
    _XA_TIMESTAMP  : TAtomPtr;cvar;external libXmu;
    _XA_USER  : TAtomPtr;cvar;external libXmu;
    _XA_UTF8_STRING  : TAtomPtr;cvar;external libXmu;


function XA_ATOM_PAIR(d: PDisplay) : TAtom;
function XA_CHARACTER_POSITION(d: PDisplay) : TAtom;
function XA_CLASS(d: PDisplay) : TAtom;
function XA_CLIENT_WINDOW(d: PDisplay) : TAtom;
function XA_CLIPBOARD(d: PDisplay) : TAtom;
function XA_COMPOUND_TEXT(d: PDisplay) : TAtom;
function XA_DECNET_ADDRESS(d: PDisplay) : TAtom;
function XA_DELETE(d: PDisplay) : TAtom;
function XA_FILENAME(d: PDisplay) : TAtom;
function XA_HOSTNAME(d: PDisplay) : TAtom;
function XA_IP_ADDRESS(d: PDisplay) : TAtom;
function XA_LENGTH(d: PDisplay) : TAtom;
function XA_LIST_LENGTH(d: PDisplay) : TAtom;
function XA_NAME(d: PDisplay) : TAtom;
function XA_NET_ADDRESS(d: PDisplay) : TAtom;
function XA_NULL(d: PDisplay) : TAtom;
function XA_OWNER_OS(d: PDisplay) : TAtom;
function XA_SPAN(d: PDisplay) : TAtom;
function XA_TARGETS(d: PDisplay) : TAtom;
function XA_TEXT(d: PDisplay) : TAtom;
function XA_TIMESTAMP(d: PDisplay) : TAtom;
function XA_USER(d: PDisplay) : TAtom;
function XA_UTF8_STRING(d: PDisplay) : TAtom;

function XmuGetAtomName(dpy:PDisplay; atom:TAtom):Pchar;cdecl;external libXmu;
function XmuInternAtom(dpy:PDisplay; atom_ptr:TAtomPtr):TAtom;cdecl;external libXmu;
procedure XmuInternStrings(dpy:PDisplay; names:PString; count:TCardinal; atoms_return:PAtom);cdecl;external libXmu;
function XmuMakeAtom(name:Pchar):TAtomPtr;cdecl;external libXmu;
function XmuNameOfAtom(atom_ptr:TAtomPtr):Pchar;cdecl;external libXmu;

implementation


function XA_ATOM_PAIR(d: PDisplay) : TAtom;
begin
  XA_ATOM_PAIR:=XmuInternAtom(d,_XA_ATOM_PAIR);
end;


function XA_CHARACTER_POSITION(d: PDisplay) : TAtom;
begin
  XA_CHARACTER_POSITION:=XmuInternAtom(d,_XA_CHARACTER_POSITION);
end;


function XA_CLASS(d: PDisplay) : TAtom;
begin
  XA_CLASS:=XmuInternAtom(d,_XA_CLASS);
end;


function XA_CLIENT_WINDOW(d: PDisplay) : TAtom;
begin
  XA_CLIENT_WINDOW:=XmuInternAtom(d,_XA_CLIENT_WINDOW);
end;


function XA_CLIPBOARD(d: PDisplay) : TAtom;
begin
  XA_CLIPBOARD:=XmuInternAtom(d,_XA_CLIPBOARD);
end;


function XA_COMPOUND_TEXT(d: PDisplay) : TAtom;
begin
  XA_COMPOUND_TEXT:=XmuInternAtom(d,_XA_COMPOUND_TEXT);
end;


function XA_DECNET_ADDRESS(d: PDisplay) : TAtom;
begin
  XA_DECNET_ADDRESS:=XmuInternAtom(d,_XA_DECNET_ADDRESS);
end;


function XA_DELETE(d: PDisplay) : TAtom;
begin
  XA_DELETE:=XmuInternAtom(d,_XA_DELETE);
end;


function XA_FILENAME(d: PDisplay) : TAtom;
begin
  XA_FILENAME:=XmuInternAtom(d,_XA_FILENAME);
end;


function XA_HOSTNAME(d: PDisplay) : TAtom;
begin
  XA_HOSTNAME:=XmuInternAtom(d,_XA_HOSTNAME);
end;


function XA_IP_ADDRESS(d: PDisplay) : TAtom;
begin
  XA_IP_ADDRESS:=XmuInternAtom(d,_XA_IP_ADDRESS);
end;


function XA_LENGTH(d: PDisplay) : TAtom;
begin
  XA_LENGTH:=XmuInternAtom(d,_XA_LENGTH);
end;


function XA_LIST_LENGTH(d: PDisplay) : TAtom;
begin
  XA_LIST_LENGTH:=XmuInternAtom(d,_XA_LIST_LENGTH);
end;


function XA_NAME(d: PDisplay) : TAtom;
begin
  XA_NAME:=XmuInternAtom(d,_XA_NAME);
end;


function XA_NET_ADDRESS(d: PDisplay) : TAtom;
begin
  XA_NET_ADDRESS:=XmuInternAtom(d,_XA_NET_ADDRESS);
end;


function XA_NULL(d: PDisplay) : TAtom;
begin
  XA_NULL:=XmuInternAtom(d,_XA_NULL);
end;


function XA_OWNER_OS(d: PDisplay) : TAtom;
begin
  XA_OWNER_OS:=XmuInternAtom(d,_XA_OWNER_OS);
end;


function XA_SPAN(d: PDisplay) : TAtom;
begin
  XA_SPAN:=XmuInternAtom(d,_XA_SPAN);
end;


function XA_TARGETS(d: PDisplay) : TAtom;
begin
  XA_TARGETS:=XmuInternAtom(d,_XA_TARGETS);
end;


function XA_TEXT(d: PDisplay) : TAtom;
begin
  XA_TEXT:=XmuInternAtom(d,_XA_TEXT);
end;


function XA_TIMESTAMP(d: PDisplay) : TAtom;
begin
  XA_TIMESTAMP:=XmuInternAtom(d,_XA_TIMESTAMP);
end;


function XA_USER(d: PDisplay) : TAtom;
begin
  XA_USER:=XmuInternAtom(d,_XA_USER);
end;


function XA_UTF8_STRING(d: PDisplay) : TAtom;
begin
  XA_UTF8_STRING:=XmuInternAtom(d,_XA_UTF8_STRING);
end;


end.
