unit Xm;

interface

uses
  ctypes, x, xlib,
   xutil,xresource,
  XT;

const
  {$IFDEF Linux}
  libXm = 'libXm.so';
  {$ENDIF}

  {$IFDEF Windows}
//  libXu = 'libXm.so';
//  sdl3_lib = 'SDL3.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include Xm_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include Xm_includes.inc}
{$UNDEF read_implementation}

end.
