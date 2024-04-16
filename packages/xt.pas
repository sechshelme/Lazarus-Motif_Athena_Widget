unit XT;

interface

uses
  ctypes, x, xlib, xutil,xresource;

const
  {$IFDEF Linux}
  libXt = 'libXt.so';
  {$ENDIF}

  {$IFDEF Windows}
//  libXt = 'libXt.so'
//  sdl3_lib = 'SDL3.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include XT_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include XT_includes.inc}
{$UNDEF read_implementation}

end.

