unit xmu;

interface

uses
  ctypes, x, xlib,
   xutil,xresource,
  XT;

const
  {$IFDEF Linux}
  libXmu = 'libXmu.so';
  {$ENDIF}

  {$IFDEF Windows}
//  libXmu = 'libXmu.so';
//  sdl3_lib = 'SDL3.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include Xmu_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include Xmu_includes.inc}
{$UNDEF read_implementation}

end.
