unit Xaw;

interface

uses
  ctypes, x, xlib, xutil,xresource,
  XT, xmu;

const
  {$IFDEF Linux}
  libXaw = 'libXaw.so';
  {$ENDIF}

  {$IFDEF Windows}
//  libXaw = 'libXaw.so';
//  sdl3_lib = 'SDL3.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include Xaw_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include Xaw_includes.inc}
{$UNDEF read_implementation}

end.

