
unit Xlib;
interface

{
  Automatically converted by H2Pas 1.0.0 from Xlib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Xlib.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
P_XExtData  = ^_XExtData;
PAtom  = ^Atom;
PBool  = ^Bool;
Pbyte  = ^byte;
Pchar  = ^char;
PColormap  = ^Colormap;
PDepth  = ^Depth;
PDisplay  = ^Display;
Pdword  = ^dword;
PGC  = ^GC;
PKeyCode  = ^KeyCode;
PKeySym  = ^KeySym;
Plongint  = ^longint;
PPixmap  = ^Pixmap;
PScreen  = ^Screen;
PScreenFormat  = ^ScreenFormat;
PStatus  = ^Status;
PVisual  = ^Visual;
Pwchar_t  = ^wchar_t;
PWindow  = ^Window;
PXAnyEvent  = ^XAnyEvent;
PXArc  = ^XArc;
PXButtonEvent  = ^XButtonEvent;
PXButtonPressedEvent  = ^XButtonPressedEvent;
PXButtonReleasedEvent  = ^XButtonReleasedEvent;
PXChar2b  = ^XChar2b;
PXCharStruct  = ^XCharStruct;
PXCirculateEvent  = ^XCirculateEvent;
PXCirculateRequestEvent  = ^XCirculateRequestEvent;
PXClientMessageEvent  = ^XClientMessageEvent;
PXColor  = ^XColor;
PXColormapEvent  = ^XColormapEvent;
PXConfigureEvent  = ^XConfigureEvent;
PXConfigureRequestEvent  = ^XConfigureRequestEvent;
PXCreateWindowEvent  = ^XCreateWindowEvent;
PXCrossingEvent  = ^XCrossingEvent;
PXDestroyWindowEvent  = ^XDestroyWindowEvent;
PXDisplay  = ^XDisplay;
PXEDataObject  = ^XEDataObject;
PXEnterWindowEvent  = ^XEnterWindowEvent;
PXErrorEvent  = ^XErrorEvent;
PXEvent  = ^XEvent;
PXExposeEvent  = ^XExposeEvent;
PXExtCodes  = ^XExtCodes;
PXExtData  = ^XExtData;
PXFocusChangeEvent  = ^XFocusChangeEvent;
PXFocusInEvent  = ^XFocusInEvent;
PXFocusOutEvent  = ^XFocusOutEvent;
PXFontProp  = ^XFontProp;
PXFontSet  = ^XFontSet;
PXFontSetExtents  = ^XFontSetExtents;
PXFontStruct  = ^XFontStruct;
PXGC  = ^XGC;
PXGCValues  = ^XGCValues;
PXGenericEvent  = ^XGenericEvent;
PXGenericEventCookie  = ^XGenericEventCookie;
PXGraphicsExposeEvent  = ^XGraphicsExposeEvent;
PXGravityEvent  = ^XGravityEvent;
PXHostAddress  = ^XHostAddress;
PXIC  = ^XIC;
PXICCallback  = ^XICCallback;
PXIM  = ^XIM;
PXImage  = ^XImage;
PXIMCallback  = ^XIMCallback;
PXIMCaretDirection  = ^XIMCaretDirection;
PXIMCaretStyle  = ^XIMCaretStyle;
PXIMFeedback  = ^XIMFeedback;
PXIMHotKeyState  = ^XIMHotKeyState;
PXIMHotKeyTrigger  = ^XIMHotKeyTrigger;
PXIMHotKeyTriggers  = ^XIMHotKeyTriggers;
PXIMPreeditCaretCallbackStruct  = ^XIMPreeditCaretCallbackStruct;
PXIMPreeditDrawCallbackStruct  = ^XIMPreeditDrawCallbackStruct;
PXIMPreeditState  = ^XIMPreeditState;
PXIMPreeditStateNotifyCallbackStruct  = ^XIMPreeditStateNotifyCallbackStruct;
PXIMResetState  = ^XIMResetState;
PXIMStatusDataType  = ^XIMStatusDataType;
PXIMStatusDrawCallbackStruct  = ^XIMStatusDrawCallbackStruct;
PXIMStringConversionCallbackStruct  = ^XIMStringConversionCallbackStruct;
PXIMStringConversionFeedback  = ^XIMStringConversionFeedback;
PXIMStringConversionOperation  = ^XIMStringConversionOperation;
PXIMStringConversionPosition  = ^XIMStringConversionPosition;
PXIMStringConversionText  = ^XIMStringConversionText;
PXIMStringConversionType  = ^XIMStringConversionType;
PXIMStyle  = ^XIMStyle;
PXIMStyles  = ^XIMStyles;
PXIMText  = ^XIMText;
PXIMValuesList  = ^XIMValuesList;
PXKeyboardControl  = ^XKeyboardControl;
PXKeyboardState  = ^XKeyboardState;
PXKeyEvent  = ^XKeyEvent;
PXKeymapEvent  = ^XKeymapEvent;
PXKeyPressedEvent  = ^XKeyPressedEvent;
PXKeyReleasedEvent  = ^XKeyReleasedEvent;
PXLeaveWindowEvent  = ^XLeaveWindowEvent;
PXMapEvent  = ^XMapEvent;
PXMappingEvent  = ^XMappingEvent;
PXMapRequestEvent  = ^XMapRequestEvent;
PXmbTextItem  = ^XmbTextItem;
PXModifierKeymap  = ^XModifierKeymap;
PXMotionEvent  = ^XMotionEvent;
PXNoExposeEvent  = ^XNoExposeEvent;
PXOC  = ^XOC;
PXOM  = ^XOM;
PXOMCharSetList  = ^XOMCharSetList;
PXOMFontInfo  = ^XOMFontInfo;
PXOMOrientation  = ^XOMOrientation;
PXOrientation  = ^XOrientation;
PXPixmapFormatValues  = ^XPixmapFormatValues;
PXPoint  = ^XPoint;
PXPointer  = ^XPointer;
PXPointerMovedEvent  = ^XPointerMovedEvent;
PXPrivate  = ^XPrivate;
PXPrivDisplay  = ^XPrivDisplay;
PXPropertyEvent  = ^XPropertyEvent;
PXRectangle  = ^XRectangle;
PXReparentEvent  = ^XReparentEvent;
PXResizeRequestEvent  = ^XResizeRequestEvent;
PXrmHashBucketRec  = ^XrmHashBucketRec;
PXSegment  = ^XSegment;
PXSelectionClearEvent  = ^XSelectionClearEvent;
PXSelectionEvent  = ^XSelectionEvent;
PXSelectionRequestEvent  = ^XSelectionRequestEvent;
PXServerInterpretedAddress  = ^XServerInterpretedAddress;
PXSetWindowAttributes  = ^XSetWindowAttributes;
PXTextItem  = ^XTextItem;
PXTextItem16  = ^XTextItem16;
PXTimeCoord  = ^XTimeCoord;
PXUnmapEvent  = ^XUnmapEvent;
PXVaNestedList  = ^XVaNestedList;
PXVisibilityEvent  = ^XVisibilityEvent;
PXwcTextItem  = ^XwcTextItem;
PXWindowAttributes  = ^XWindowAttributes;
PXWindowChanges  = ^XWindowChanges;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{

Copyright 1985, 1986, 1987, 1991, 1998  The Open Group

Permission to use, copy, modify, distribute, and sell this software and its
documentation for any purpose is hereby granted without fee, provided that
the above copyright notice appear in all copies and that both that
copyright notice and this permission notice appear in supporting
documentation.

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Except as contained in this notice, the name of The Open Group shall not be
used in advertising or otherwise to promote the sale, use or other dealings
in this Software without prior written authorization from The Open Group.

 }
{
 *	Xlib.h - Header definition and support file for the C subroutine
 *	interface library (Xlib) to the X Window System Protocol (V11).
 *	Structures and symbols starting with "_" are private to the library.
  }
{$ifndef _X11_XLIB_H_}
{$define _X11_XLIB_H_}

const
  XlibSpecificationRelease = 6;  
{$include <sys/types.h>}
{$if defined(__SCO__) || defined(__UNIXWARE__)}
{$include <stdint.h>}
{$endif}
{$include <X11/X.h>}
{ applications should not depend on these two headers being included!  }
{$include <X11/Xfuncproto.h>}
{$include <X11/Xosdefs.h>}
{$ifndef X_WCHAR}
{$include <stddef.h>}
{$else}
{$ifdef __UNIXOS2__}
{$include <stdlib.h>}
{$else}
{ replace this with #include or typedef appropriate for your system  }
type
  Pwchar_t = ^Twchar_t;
  Twchar_t = dword;
{$endif}
{$endif}

function _Xmblen(str:Pchar; len:longint):longint;cdecl;external;
{ API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
   November 2000. Its presence is indicated through the following macro.  }
const
  X_HAVE_UTF8_STRING = 1;  
{ The Xlib structs are full of implicit padding to properly align members.
   We can't clean that up without breaking ABI, so tell clang not to bother
   complaining about it.  }
{$ifdef __clang__}
(** unsupported pragma#pragma clang diagnostic push*)
(** unsupported pragma#pragma clang diagnostic ignored "-Wpadded"*)
{$endif}
type
  PXPointer = ^TXPointer;
  TXPointer = Pchar;

const
  Bool = longint;  
  Status = longint;  
  True = 1;  
  False = 0;  
  QueuedAlready = 0;  
  QueuedAfterReading = 1;  
  QueuedAfterFlush = 2;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ConnectionNumber(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RootWindow(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultScreen(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultRootWindow(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultVisual(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultGC(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BlackPixel(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WhitePixel(dpy,scr : longint) : longint;

{ was #define dname def_expr }
function AllPlanes : dword;  

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function QLength(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayWidth(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayHeight(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayWidthMM(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayHeightMM(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayPlanes(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayCells(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ScreenCount(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ServerVendor(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ProtocolVersion(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ProtocolRevision(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VendorRelease(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayString(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultDepth(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultColormap(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BitmapUnit(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BitmapBitOrder(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BitmapPad(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ImageByteOrder(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NextRequest(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LastKnownRequestProcessed(dpy : longint) : longint;

{ macros for screen oriented applications (toolkit)  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ScreenOfDisplay(dpy,scr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultScreenOfDisplay(dpy : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RootWindowOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BlackPixelOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WhitePixelOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultColormapOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultDepthOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultGCOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultVisualOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WidthOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HeightOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WidthMMOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HeightMMOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PlanesOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CellsOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MinCmapsOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MaxCmapsOfScreen(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DoesSaveUnders(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DoesBackingStore(s : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EventMaskOfScreen(s : longint) : longint;

{
 * Extensions need a way to hang private data on some structures.
  }
{ number returned by XRegisterExtension  }
{ next item on list of data for structure  }
{ called to free private storage  }
{ data private to this extension.  }
type
  PXExtData = ^TXExtData;
  TXExtData = record
      number : longint;
      next : PXExtData;
      free_private : function (extension:PXExtData):longint;cdecl;
      private_data : TXPointer;
    end;
{
 * This file contains structures used by the extension mechanism.
  }
{ public to extension, cannot be changed  }
{ extension number  }
{ major op-code assigned by server  }
{ first event number for the extension  }
{ first error number for the extension  }

  PXExtCodes = ^TXExtCodes;
  TXExtCodes = record
      extension : longint;
      major_opcode : longint;
      first_event : longint;
      first_error : longint;
    end;
{
 * Data structure for retrieving info about pixmap formats.
  }

  PXPixmapFormatValues = ^TXPixmapFormatValues;
  TXPixmapFormatValues = record
      depth : longint;
      bits_per_pixel : longint;
      scanline_pad : longint;
    end;
{
 * Data structure for setting graphics context.
  }
{ logical operation  }
{ plane mask  }
{ foreground pixel  }
{ background pixel  }
{ line width  }
{ LineSolid, LineOnOffDash, LineDoubleDash  }
{ CapNotLast, CapButt,
				   CapRound, CapProjecting  }
{ JoinMiter, JoinRound, JoinBevel  }
{ FillSolid, FillTiled,
				   FillStippled, FillOpaqueStippled  }
{ EvenOddRule, WindingRule  }
{ ArcChord, ArcPieSlice  }
{ tile pixmap for tiling operations  }
{ stipple 1 plane pixmap for stippling  }
{ offset for tile or stipple operations  }
{ default text font for text operations  }
{ ClipByChildren, IncludeInferiors  }
{ boolean, should exposures be generated  }
{ origin for clipping  }
{ bitmap clipping; other calls for rects  }
{ patterned/dashed line information  }

  PXGCValues = ^TXGCValues;
  TXGCValues = record
      _function : longint;
      plane_mask : dword;
      foreground : dword;
      background : dword;
      line_width : longint;
      line_style : longint;
      cap_style : longint;
      join_style : longint;
      fill_style : longint;
      fill_rule : longint;
      arc_mode : longint;
      tile : TPixmap;
      stipple : TPixmap;
      ts_x_origin : longint;
      ts_y_origin : longint;
      font : TFont;
      subwindow_mode : longint;
      graphics_exposures : TBool;
      clip_x_origin : longint;
      clip_y_origin : longint;
      clip_mask : TPixmap;
      dash_offset : longint;
      dashes : char;
    end;
{
 * Graphics context.  The contents of this structure are implementation
 * dependent.  A GC should be treated as opaque by application code.
  }
{$ifdef XLIB_ILLEGAL_ACCESS}
{ hook for extension to hang data  }
{ protocol ID for graphics context  }
{ there is more to this structure, but it is private to Xlib  }
{$endif}
type
  PXGC = ^TXGC;
  TXGC = ^record
      ext_data : PXExtData;
      gid : TGContext;
    end;
  TGC = PXGC;
  PGC = ^TGC;
{
 * Visual structure; contains information about colormapping possible.
  }
{ hook for extension to hang data  }
{ visual id of this visual  }
{$if defined(__cplusplus) || defined(c_plusplus)}
{ C++ class of screen (monochrome, etc.)  }
{$else}
{ class of screen (monochrome, etc.)  }
{$endif}
{ mask values  }
{ log base 2 of distinct color values  }
{ color map entries  }
type
  PVisual = ^TVisual;
  TVisual = record
      ext_data : PXExtData;
      visualid : TVisualID;
      c_class : longint;
      _class : longint;
      red_mask : dword;
      green_mask : dword;
      blue_mask : dword;
      bits_per_rgb : longint;
      map_entries : longint;
    end;
{
 * Depth structure; contains information for each possible depth.
  }
{ this depth (Z) of the depth  }
{ number of Visual types at this depth  }
{ list of visuals possible at this depth  }

  PDepth = ^TDepth;
  TDepth = record
      depth : longint;
      nvisuals : longint;
      visuals : PVisual;
    end;
{
 * Information about the screen.  The contents of this structure are
 * implementation dependent.  A Screen should be treated as opaque
 * by application code.
  }
  PXDisplay = ^TXDisplay;
  TXDisplay = record
      {undefined structure}
    end;

{ Forward declare before use for C++  }
{ hook for extension to hang data  }
{ back pointer to display structure  }
{ Root window id.  }
{ width and height of screen  }
{ width and height of  in millimeters  }
{ number of depths possible  }
{ list of allowable depths on the screen  }
{ bits per pixel  }
{ root visual  }
{ GC for the root root visual  }
{ default color map  }
{ White and Black pixel values  }
{ max and min color maps  }
{ Never, WhenMapped, Always  }
{ initial root input mask  }

  PScreen = ^TScreen;
  TScreen = record
      ext_data : PXExtData;
      display : PXDisplay;
      root : TWindow;
      width : longint;
      height : longint;
      mwidth : longint;
      mheight : longint;
      ndepths : longint;
      depths : PDepth;
      root_depth : longint;
      root_visual : PVisual;
      default_gc : TGC;
      cmap : TColormap;
      white_pixel : dword;
      black_pixel : dword;
      max_maps : longint;
      min_maps : longint;
      backing_store : longint;
      save_unders : TBool;
      root_input_mask : longint;
    end;
{
 * Format structure; describes ZFormat data the screen will understand.
  }
{ hook for extension to hang data  }
{ depth of this image format  }
{ bits/pixel at this depth  }
{ scanline must padded to this multiple  }

  PScreenFormat = ^TScreenFormat;
  TScreenFormat = record
      ext_data : PXExtData;
      depth : longint;
      bits_per_pixel : longint;
      scanline_pad : longint;
    end;
{
 * Data structure for setting window attributes.
  }
{ background or None or ParentRelative  }
{ background pixel  }
{ border of the window  }
{ border pixel value  }
{ one of bit gravity values  }
{ one of the window gravity values  }
{ NotUseful, WhenMapped, Always  }
{ planes to be preserved if possible  }
{ value to use in restoring planes  }
{ should bits under be saved? (popups)  }
{ set of events that should be saved  }
{ set of events that should not propagate  }
{ boolean value for override-redirect  }
{ color map to be associated with window  }
{ cursor to be displayed (or None)  }

  PXSetWindowAttributes = ^TXSetWindowAttributes;
  TXSetWindowAttributes = record
      background_pixmap : TPixmap;
      background_pixel : dword;
      border_pixmap : TPixmap;
      border_pixel : dword;
      bit_gravity : longint;
      win_gravity : longint;
      backing_store : longint;
      backing_planes : dword;
      backing_pixel : dword;
      save_under : TBool;
      event_mask : longint;
      do_not_propagate_mask : longint;
      override_redirect : TBool;
      colormap : TColormap;
      cursor : TCursor;
    end;
{ location of window  }
{ width and height of window  }
{ border width of window  }
{ depth of window  }
{ the associated visual structure  }
{ root of screen containing window  }
{$if defined(__cplusplus) || defined(c_plusplus)}
{ C++ InputOutput, InputOnly }
{$else}
{ InputOutput, InputOnly }
{$endif}
{ one of bit gravity values  }
{ one of the window gravity values  }
{ NotUseful, WhenMapped, Always  }
{ planes to be preserved if possible  }
{ value to be used when restoring planes  }
{ boolean, should bits under be saved?  }
{ color map to be associated with window  }
{ boolean, is color map currently installed }
{ IsUnmapped, IsUnviewable, IsViewable  }
{ set of events all people have interest in }
{ my event mask  }
{ set of events that should not propagate  }
{ boolean value for override-redirect  }
{ back pointer to correct screen  }
type
  PXWindowAttributes = ^TXWindowAttributes;
  TXWindowAttributes = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      depth : longint;
      visual : PVisual;
      root : TWindow;
      c_class : longint;
      _class : longint;
      bit_gravity : longint;
      win_gravity : longint;
      backing_store : longint;
      backing_planes : dword;
      backing_pixel : dword;
      save_under : TBool;
      colormap : TColormap;
      map_installed : TBool;
      map_state : longint;
      all_event_masks : longint;
      your_event_mask : longint;
      do_not_propagate_mask : longint;
      override_redirect : TBool;
      screen : PScreen;
    end;
{
 * Data structure for host setting; getting routines.
 *
  }
{ for example FamilyInternet  }
{ length of address, in bytes  }
{ pointer to where to find the bytes  }

  PXHostAddress = ^TXHostAddress;
  TXHostAddress = record
      family : longint;
      length : longint;
      address : Pchar;
    end;
{
 * Data structure for ServerFamilyInterpreted addresses in host routines
  }
{ length of type string, in bytes  }
{ length of value string, in bytes  }
{ pointer to where to find the type string  }
{ pointer to where to find the address  }

  PXServerInterpretedAddress = ^TXServerInterpretedAddress;
  TXServerInterpretedAddress = record
      typelength : longint;
      valuelength : longint;
      _type : Pchar;
      value : Pchar;
    end;
{
 * Data structure for "image" data, used by image manipulation routines.
  }
{ size of image  }
{ number of pixels offset in X direction  }
{ XYBitmap, XYPixmap, ZPixmap  }
{ pointer to image data  }
{ data byte order, LSBFirst, MSBFirst  }
{ quant. of scanline 8, 16, 32  }
{ LSBFirst, MSBFirst  }
{ 8, 16, 32 either XY or ZPixmap  }
{ depth of image  }
{ accelerator to next line  }
{ bits per pixel (ZPixmap)  }
{ bits in z arrangement  }
{ hook for the object routines to hang on  }
{ image manipulation routines  }
{ display  }{ visual  }{ depth  }{ format  }{ offset  }{ data  }{ width  }{ height  }{ bitmap_pad  }{ bytes_per_line  }
  PXImage = ^TXImage;
  TXImage = record
      width : longint;
      height : longint;
      xoffset : longint;
      format : longint;
      data : Pchar;
      byte_order : longint;
      bitmap_unit : longint;
      bitmap_bit_order : longint;
      bitmap_pad : longint;
      depth : longint;
      bytes_per_line : longint;
      bits_per_pixel : longint;
      red_mask : dword;
      green_mask : dword;
      blue_mask : dword;
      obdata : TXPointer;
      f : record
          create_image : function (para1:PXDisplay; para2:PVisual; para3:dword; para4:longint; para5:longint; 
                       para6:Pchar; para7:dword; para8:dword; para9:longint; para10:longint):PXImage;cdecl;
          destroy_image : function (para1:PXImage):longint;cdecl;
          get_pixel : function (para1:PXImage; para2:longint; para3:longint):dword;cdecl;
          put_pixel : function (para1:PXImage; para2:longint; para3:longint; para4:dword):longint;cdecl;
          sub_image : function (para1:PXImage; para2:longint; para3:longint; para4:dword; para5:dword):PXImage;cdecl;
          add_pixel : function (para1:PXImage; para2:longint):longint;cdecl;
        end;
    end;
{
 * Data structure for XReconfigureWindow
  }

  PXWindowChanges = ^TXWindowChanges;
  TXWindowChanges = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      sibling : TWindow;
      stack_mode : longint;
    end;
{
 * Data structure used by color operations
  }
{ do_red, do_green, do_blue  }

  PXColor = ^TXColor;
  TXColor = record
      pixel : dword;
      red : word;
      green : word;
      blue : word;
      flags : char;
      pad : char;
    end;
{
 * Data structures for graphics operations.  On most machines, these are
 * congruent with the wire protocol structures, so reformatting the data
 * can be avoided on these architectures.
  }

  PXSegment = ^TXSegment;
  TXSegment = record
      x1 : smallint;
      y1 : smallint;
      x2 : smallint;
      y2 : smallint;
    end;

  PXPoint = ^TXPoint;
  TXPoint = record
      x : smallint;
      y : smallint;
    end;

  PXRectangle = ^TXRectangle;
  TXRectangle = record
      x : smallint;
      y : smallint;
      width : word;
      height : word;
    end;

  PXArc = ^TXArc;
  TXArc = record
      x : smallint;
      y : smallint;
      width : word;
      height : word;
      angle1 : smallint;
      angle2 : smallint;
    end;
{ Data structure for XChangeKeyboardControl  }
{ On, Off, Default  }

  PXKeyboardControl = ^TXKeyboardControl;
  TXKeyboardControl = record
      key_click_percent : longint;
      bell_percent : longint;
      bell_pitch : longint;
      bell_duration : longint;
      led : longint;
      led_mode : longint;
      key : longint;
      auto_repeat_mode : longint;
    end;
{ Data structure for XGetKeyboardControl  }

  PXKeyboardState = ^TXKeyboardState;
  TXKeyboardState = record
      key_click_percent : longint;
      bell_percent : longint;
      bell_pitch : dword;
      bell_duration : dword;
      led_mask : dword;
      global_auto_repeat : longint;
      auto_repeats : array[0..31] of char;
    end;
{ Data structure for XGetMotionEvents.   }

  PXTimeCoord = ^TXTimeCoord;
  TXTimeCoord = record
      time : TTime;
      x : smallint;
      y : smallint;
    end;
{ Data structure for XSet,GetModifierMapping  }
{ The server's max # of keys per modifier  }
{ An 8 by max_keypermod array of modifiers  }

  PXModifierKeymap = ^TXModifierKeymap;
  TXModifierKeymap = record
      max_keypermod : longint;
      modifiermap : PKeyCode;
    end;
{
 * Display datatype maintaining display specific data.
 * The contents of this structure are implementation dependent.
 * A Display should be treated as opaque by application code.
  }
{$ifndef XLIB_ILLEGAL_ACCESS}
type
  TXDisplay = TDisplay;
{$endif}
type
  PXPrivate = ^TXPrivate;
  TXPrivate = record
      {undefined structure}
    end;

{ Forward declare before use for C++  }
  PXrmHashBucketRec = ^TXrmHashBucketRec;
  TXrmHashBucketRec = record
      {undefined structure}
    end;

{$ifdef XLIB_ILLEGAL_ACCESS}
{$endif}
{ hook for extension to hang data  }
{ Network socket.  }
{ major version of server's X protocol  }
{ minor version of servers X protocol  }
{ vendor of the server hardware  }
{ allocator function  }
{ screen byte order, LSBFirst, MSBFirst  }
{ padding and data requirements  }
{ padding requirements on bitmaps  }
{ LeastSignificant or MostSignificant  }
{ number of pixmap formats in list  }
{ pixmap format list  }
{ release of the server  }
{ Length of input event queue  }
{ seq number of last event read  }
{ sequence number of last request.  }
{ maximum number 32 bit words in request }
{ "host:display" string used on this connect }
{ default screen for operations  }
{ number of screens on this server }
{ pointer to list of screens  }
{ size of motion buffer  }
{ minimum defined keycode  }
{ maximum defined keycode  }
{ contents of defaults from server  }
{ there is more to this structure, but it is private to Xlib  }
{$ifdef XLIB_ILLEGAL_ACCESS}
{$endif}
type
  PXDisplay = ^TXDisplay;
  TXDisplay = record
      ext_data : PXExtData;
      private1 : PXPrivate;
      fd : longint;
      private2 : longint;
      proto_major_version : longint;
      proto_minor_version : longint;
      vendor : Pchar;
      private3 : TXID;
      private4 : TXID;
      private5 : TXID;
      private6 : longint;
      resource_alloc : function (para1:PXDisplay):TXID;cdecl;
      byte_order : longint;
      bitmap_unit : longint;
      bitmap_pad : longint;
      bitmap_bit_order : longint;
      nformats : longint;
      pixmap_format : PScreenFormat;
      private8 : longint;
      release : longint;
      private9 : PXPrivate;
      private10 : PXPrivate;
      qlen : longint;
      last_request_read : dword;
      request : dword;
      private11 : TXPointer;
      private12 : TXPointer;
      private13 : TXPointer;
      private14 : TXPointer;
      max_request_size : dword;
      db : PXrmHashBucketRec;
      private15 : function (para1:PXDisplay):longint;cdecl;
      display_name : Pchar;
      default_screen : longint;
      nscreens : longint;
      screens : PScreen;
      motion_buffer : dword;
      private16 : dword;
      min_keycode : longint;
      max_keycode : longint;
      private17 : TXPointer;
      private18 : TXPointer;
      private19 : longint;
      xdefaults : Pchar;
    end;
  TDisplay = TXDisplay;
  PDisplay = ^TDisplay;
  TXPrivDisplay = PXDisplay;
  PXPrivDisplay = ^TXPrivDisplay;
{$undef _XEVENT_}
{$ifndef _XEVENT_}
{
 * Definitions of specific events.
  }
{ of event  }
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ "event" window it is reported relative to  }
{ root window that the event occurred on  }
{ child window  }
{ milliseconds  }
{ pointer x, y coordinates in event window  }
{ coordinates relative to root  }
{ key or button mask  }
{ detail  }
{ same screen flag  }
type
  PXKeyEvent = ^TXKeyEvent;
  TXKeyEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      state : dword;
      keycode : dword;
      same_screen : TBool;
    end;

  PXKeyPressedEvent = ^TXKeyPressedEvent;
  TXKeyPressedEvent = TXKeyEvent;

  PXKeyReleasedEvent = ^TXKeyReleasedEvent;
  TXKeyReleasedEvent = TXKeyEvent;
{ of event  }
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ "event" window it is reported relative to  }
{ root window that the event occurred on  }
{ child window  }
{ milliseconds  }
{ pointer x, y coordinates in event window  }
{ coordinates relative to root  }
{ key or button mask  }
{ detail  }
{ same screen flag  }

  PXButtonEvent = ^TXButtonEvent;
  TXButtonEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      state : dword;
      button : dword;
      same_screen : TBool;
    end;

  PXButtonPressedEvent = ^TXButtonPressedEvent;
  TXButtonPressedEvent = TXButtonEvent;

  PXButtonReleasedEvent = ^TXButtonReleasedEvent;
  TXButtonReleasedEvent = TXButtonEvent;
{ of event  }
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ "event" window reported relative to  }
{ root window that the event occurred on  }
{ child window  }
{ milliseconds  }
{ pointer x, y coordinates in event window  }
{ coordinates relative to root  }
{ key or button mask  }
{ detail  }
{ same screen flag  }

  PXMotionEvent = ^TXMotionEvent;
  TXMotionEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      state : dword;
      is_hint : char;
      same_screen : TBool;
    end;

  PXPointerMovedEvent = ^TXPointerMovedEvent;
  TXPointerMovedEvent = TXMotionEvent;
{ of event  }
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ "event" window reported relative to  }
{ root window that the event occurred on  }
{ child window  }
{ milliseconds  }
{ pointer x, y coordinates in event window  }
{ coordinates relative to root  }
{ NotifyNormal, NotifyGrab, NotifyUngrab  }
{
	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
	 * NotifyNonlinear,NotifyNonlinearVirtual
	  }
{ same screen flag  }
{ boolean focus  }
{ key or button mask  }

  PXCrossingEvent = ^TXCrossingEvent;
  TXCrossingEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      mode : longint;
      detail : longint;
      same_screen : TBool;
      focus : TBool;
      state : dword;
    end;

  PXEnterWindowEvent = ^TXEnterWindowEvent;
  TXEnterWindowEvent = TXCrossingEvent;

  PXLeaveWindowEvent = ^TXLeaveWindowEvent;
  TXLeaveWindowEvent = TXCrossingEvent;
{ FocusIn or FocusOut  }
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ window of event  }
{ NotifyNormal, NotifyWhileGrabbed,
				   NotifyGrab, NotifyUngrab  }
{
	 * NotifyAncestor, NotifyVirtual, NotifyInferior,
	 * NotifyNonlinear,NotifyNonlinearVirtual, NotifyPointer,
	 * NotifyPointerRoot, NotifyDetailNone
	  }

  PXFocusChangeEvent = ^TXFocusChangeEvent;
  TXFocusChangeEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      mode : longint;
      detail : longint;
    end;

  PXFocusInEvent = ^TXFocusInEvent;
  TXFocusInEvent = TXFocusChangeEvent;

  PXFocusOutEvent = ^TXFocusOutEvent;
  TXFocusOutEvent = TXFocusChangeEvent;
{ generated on EnterWindow and FocusIn  when KeyMapState selected  }
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXKeymapEvent = ^TXKeymapEvent;
  TXKeymapEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      key_vector : array[0..31] of char;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ if non-zero, at least this many more  }

  PXExposeEvent = ^TXExposeEvent;
  TXExposeEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      count : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ if non-zero, at least this many more  }
{ core is CopyArea or CopyPlane  }
{ not defined in the core  }

  PXGraphicsExposeEvent = ^TXGraphicsExposeEvent;
  TXGraphicsExposeEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      drawable : TDrawable;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      count : longint;
      major_code : longint;
      minor_code : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ core is CopyArea or CopyPlane  }
{ not defined in the core  }

  PXNoExposeEvent = ^TXNoExposeEvent;
  TXNoExposeEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      drawable : TDrawable;
      major_code : longint;
      minor_code : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ Visibility state  }

  PXVisibilityEvent = ^TXVisibilityEvent;
  TXVisibilityEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      state : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ parent of the window  }
{ window id of window created  }
{ window location  }
{ size of window  }
{ border width  }
{ creation should be overridden  }

  PXCreateWindowEvent = ^TXCreateWindowEvent;
  TXCreateWindowEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      parent : TWindow;
      window : TWindow;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      override_redirect : TBool;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXDestroyWindowEvent = ^TXDestroyWindowEvent;
  TXDestroyWindowEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXUnmapEvent = ^TXUnmapEvent;
  TXUnmapEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      from_configure : TBool;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ boolean, is override set...  }

  PXMapEvent = ^TXMapEvent;
  TXMapEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      override_redirect : TBool;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXMapRequestEvent = ^TXMapRequestEvent;
  TXMapRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      parent : TWindow;
      window : TWindow;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXReparentEvent = ^TXReparentEvent;
  TXReparentEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      parent : TWindow;
      x : longint;
      y : longint;
      override_redirect : TBool;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXConfigureEvent = ^TXConfigureEvent;
  TXConfigureEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      above : TWindow;
      override_redirect : TBool;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXGravityEvent = ^TXGravityEvent;
  TXGravityEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      x : longint;
      y : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXResizeRequestEvent = ^TXResizeRequestEvent;
  TXResizeRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      width : longint;
      height : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ Above, Below, TopIf, BottomIf, Opposite  }

  PXConfigureRequestEvent = ^TXConfigureRequestEvent;
  TXConfigureRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      parent : TWindow;
      window : TWindow;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      above : TWindow;
      detail : longint;
      value_mask : dword;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ PlaceOnTop, PlaceOnBottom  }

  PXCirculateEvent = ^TXCirculateEvent;
  TXCirculateEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      place : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ PlaceOnTop, PlaceOnBottom  }

  PXCirculateRequestEvent = ^TXCirculateRequestEvent;
  TXCirculateRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      parent : TWindow;
      window : TWindow;
      place : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ NewValue, Deleted  }

  PXPropertyEvent = ^TXPropertyEvent;
  TXPropertyEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      atom : TAtom;
      time : TTime;
      state : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXSelectionClearEvent = ^TXSelectionClearEvent;
  TXSelectionClearEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      selection : TAtom;
      time : TTime;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXSelectionRequestEvent = ^TXSelectionRequestEvent;
  TXSelectionRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      owner : TWindow;
      requestor : TWindow;
      selection : TAtom;
      target : TAtom;
      _property : TAtom;
      time : TTime;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ ATOM or None  }

  PXSelectionEvent = ^TXSelectionEvent;
  TXSelectionEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      requestor : TWindow;
      selection : TAtom;
      target : TAtom;
      _property : TAtom;
      time : TTime;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ COLORMAP or None  }
{$if defined(__cplusplus) || defined(c_plusplus)}
{ C++  }
{$else}
{$endif}
{ ColormapInstalled, ColormapUninstalled  }
type
  PXColormapEvent = ^TXColormapEvent;
  TXColormapEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      colormap : TColormap;
      c_new : TBool;
      _new : TBool;
      state : longint;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }

  PXClientMessageEvent = ^TXClientMessageEvent;
  TXClientMessageEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      message_type : TAtom;
      format : longint;
      data : record
          case longint of
            0 : ( b : array[0..19] of char );
            1 : ( s : array[0..9] of smallint );
            2 : ( l : array[0..4] of longint );
          end;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ unused  }
{ one of MappingModifier, MappingKeyboard,
				   MappingPointer  }
{ first keycode  }
{ defines range of change w. first_keycode }

  PXMappingEvent = ^TXMappingEvent;
  TXMappingEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
      request : longint;
      first_keycode : longint;
      count : longint;
    end;
{ Display the event was read from  }
{ resource id  }
{ serial number of failed request  }
{ error code of failed request  }
{ Major op-code of failed request  }
{ Minor op-code of failed request  }

  PXErrorEvent = ^TXErrorEvent;
  TXErrorEvent = record
      _type : longint;
      display : PDisplay;
      resourceid : TXID;
      serial : dword;
      error_code : byte;
      request_code : byte;
      minor_code : byte;
    end;
{ # of last request processed by server  }
{ true if this came from a SendEvent request  }
{ Display the event was read from  }
{ window on which event was requested in event mask  }

  PXAnyEvent = ^TXAnyEvent;
  TXAnyEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
    end;
{**************************************************************
 *
 * GenericEvent.  This event is the standard event for all newer extensions.
  }
{ of event. Always GenericEvent  }
{ # of last request processed  }
{ true if from SendEvent request  }
{ Display the event was read from  }
{ major opcode of extension that caused the event  }
{ actual event type.  }

  PXGenericEvent = ^TXGenericEvent;
  TXGenericEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      extension : longint;
      evtype : longint;
    end;
{ of event. Always GenericEvent  }
{ # of last request processed  }
{ true if from SendEvent request  }
{ Display the event was read from  }
{ major opcode of extension that caused the event  }
{ actual event type.  }

  PXGenericEventCookie = ^TXGenericEventCookie;
  TXGenericEventCookie = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      extension : longint;
      evtype : longint;
      cookie : dword;
      data : pointer;
    end;
{
 * this union is defined so Xlib can always use the same sized
 * event structure internally, to avoid memory fragmentation.
  }
{ must not be changed; first element  }

  PXEvent = ^TXEvent;
  TXEvent = record
      case longint of
        0 : ( _type : longint );
        1 : ( xany : TXAnyEvent );
        2 : ( xkey : TXKeyEvent );
        3 : ( xbutton : TXButtonEvent );
        4 : ( xmotion : TXMotionEvent );
        5 : ( xcrossing : TXCrossingEvent );
        6 : ( xfocus : TXFocusChangeEvent );
        7 : ( xexpose : TXExposeEvent );
        8 : ( xgraphicsexpose : TXGraphicsExposeEvent );
        9 : ( xnoexpose : TXNoExposeEvent );
        10 : ( xvisibility : TXVisibilityEvent );
        11 : ( xcreatewindow : TXCreateWindowEvent );
        12 : ( xdestroywindow : TXDestroyWindowEvent );
        13 : ( xunmap : TXUnmapEvent );
        14 : ( xmap : TXMapEvent );
        15 : ( xmaprequest : TXMapRequestEvent );
        16 : ( xreparent : TXReparentEvent );
        17 : ( xconfigure : TXConfigureEvent );
        18 : ( xgravity : TXGravityEvent );
        19 : ( xresizerequest : TXResizeRequestEvent );
        20 : ( xconfigurerequest : TXConfigureRequestEvent );
        21 : ( xcirculate : TXCirculateEvent );
        22 : ( xcirculaterequest : TXCirculateRequestEvent );
        23 : ( xproperty : TXPropertyEvent );
        24 : ( xselectionclear : TXSelectionClearEvent );
        25 : ( xselectionrequest : TXSelectionRequestEvent );
        26 : ( xselection : TXSelectionEvent );
        27 : ( xcolormap : TXColormapEvent );
        28 : ( xclient : TXClientMessageEvent );
        29 : ( xmapping : TXMappingEvent );
        30 : ( xerror : TXErrorEvent );
        31 : ( xkeymap : TXKeymapEvent );
        32 : ( xgeneric : TXGenericEvent );
        33 : ( xcookie : TXGenericEventCookie );
        34 : ( pad : array[0..23] of longint );
      end;
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function XAllocID(dpy : longint) : longint;

{
 * per character font metric information.
  }
{ origin to left edge of raster  }
{ origin to right edge of raster  }
{ advance to next char's origin  }
{ baseline to top edge of raster  }
{ baseline to bottom edge of raster  }
{ per char flags (not predefined)  }
type
  PXCharStruct = ^TXCharStruct;
  TXCharStruct = record
      lbearing : smallint;
      rbearing : smallint;
      width : smallint;
      ascent : smallint;
      descent : smallint;
      attributes : word;
    end;
{
 * To allow arbitrary information with fonts, there are additional properties
 * returned.
  }

  PXFontProp = ^TXFontProp;
  TXFontProp = record
      name : TAtom;
      card32 : dword;
    end;
{ hook for extension to hang data  }
{ Font id for this font  }
{ hint about direction the font is painted  }
{ first character  }
{ last character  }
{ first row that exists  }
{ last row that exists  }
{ flag if all characters have non-zero size }
{ char to print for undefined character  }
{ how many properties there are  }
{ pointer to array of additional properties }
{ minimum bounds over all existing char }
{ maximum bounds over all existing char }
{ first_char to last_char information  }
{ log. extent above baseline for spacing  }
{ log. descent below baseline for spacing  }

  PXFontStruct = ^TXFontStruct;
  TXFontStruct = record
      ext_data : PXExtData;
      fid : TFont;
      direction : dword;
      min_char_or_byte2 : dword;
      max_char_or_byte2 : dword;
      min_byte1 : dword;
      max_byte1 : dword;
      all_chars_exist : TBool;
      default_char : dword;
      n_properties : longint;
      properties : PXFontProp;
      min_bounds : TXCharStruct;
      max_bounds : TXCharStruct;
      per_char : PXCharStruct;
      ascent : longint;
      descent : longint;
    end;
{
 * PolyText routines take these as arguments.
  }
{ pointer to string  }
{ number of characters  }
{ delta between strings  }
{ font to print it in, None don't change  }

  PXTextItem = ^TXTextItem;
  TXTextItem = record
      chars : Pchar;
      nchars : longint;
      delta : longint;
      font : TFont;
    end;
{ normal 16 bit characters are two bytes  }

  PXChar2b = ^TXChar2b;
  TXChar2b = record
      byte1 : byte;
      byte2 : byte;
    end;
{ two byte characters  }
{ number of characters  }
{ delta between strings  }
{ font to print it in, None don't change  }

  PXTextItem16 = ^TXTextItem16;
  TXTextItem16 = record
      chars : PXChar2b;
      nchars : longint;
      delta : longint;
      font : TFont;
    end;

  PXEDataObject = ^TXEDataObject;
  TXEDataObject = record
      case longint of
        0 : ( display : PDisplay );
        1 : ( gc : TGC );
        2 : ( visual : PVisual );
        3 : ( screen : PScreen );
        4 : ( pixmap_format : PScreenFormat );
        5 : ( font : PXFontStruct );
      end;

  PXFontSetExtents = ^TXFontSetExtents;
  TXFontSetExtents = record
      max_ink_extent : TXRectangle;
      max_logical_extent : TXRectangle;
    end;
{ unused:
typedef void (*XOMProc)();
  }

  PXOM = ^TXOM;
  TXOM = PXOM;

  PXOC = ^TXOC;
  TXOC = PXOC;
  TXFontSet = PXOC;
  PXFontSet = ^TXFontSet;

  PXmbTextItem = ^TXmbTextItem;
  TXmbTextItem = record
      chars : Pchar;
      nchars : longint;
      delta : longint;
      font_set : TXFontSet;
    end;

  PXwcTextItem = ^TXwcTextItem;
  TXwcTextItem = record
      chars : Pwchar_t;
      nchars : longint;
      delta : longint;
      font_set : TXFontSet;
    end;

const
  XNRequiredCharSet = 'requiredCharSet';  
  XNQueryOrientation = 'queryOrientation';  
  XNBaseFontName = 'baseFontName';  
  XNOMAutomatic = 'omAutomatic';  
  XNMissingCharSet = 'missingCharSet';  
  XNDefaultString = 'defaultString';  
  XNOrientation = 'orientation';  
  XNDirectionalDependentDrawing = 'directionalDependentDrawing';  
  XNContextualDrawing = 'contextualDrawing';  
  XNFontInfo = 'fontInfo';  
type
  PXOMCharSetList = ^TXOMCharSetList;
  TXOMCharSetList = record
      charset_count : longint;
      charset_list : ^Pchar;
    end;

  PXOrientation = ^TXOrientation;
  TXOrientation =  Longint;
  Const
    XOMOrientation_LTR_TTB = 0;
    XOMOrientation_RTL_TTB = 1;
    XOMOrientation_TTB_LTR = 2;
    XOMOrientation_TTB_RTL = 3;
    XOMOrientation_Context = 4;
;
{ Input Text description  }
type
  PXOMOrientation = ^TXOMOrientation;
  TXOMOrientation = record
      num_orientation : longint;
      orientation : PXOrientation;
    end;

  PXOMFontInfo = ^TXOMFontInfo;
  TXOMFontInfo = record
      num_font : longint;
      font_struct_list : ^PXFontStruct;
      font_name_list : ^Pchar;
    end;

  PXIM = ^TXIM;
  TXIM = PXIM;

  PXIC = ^TXIC;
  TXIC = PXIC;

  TXIMProc = procedure (para1:TXIM; para2:TXPointer; para3:TXPointer);cdecl;

  TXICProc = function (para1:TXIC; para2:TXPointer; para3:TXPointer):TBool;cdecl;

  TXIDProc = procedure (para1:PDisplay; para2:TXPointer; para3:TXPointer);cdecl;

  PXIMStyle = ^TXIMStyle;
  TXIMStyle = dword;

  PXIMStyles = ^TXIMStyles;
  TXIMStyles = record
      count_styles : word;
      supported_styles : PXIMStyle;
    end;

const
  XIMPreeditArea = $0001;  
  XIMPreeditCallbacks = $0002;  
  XIMPreeditPosition = $0004;  
  XIMPreeditNothing = $0008;  
  XIMPreeditNone = $0010;  
  XIMStatusArea = $0100;  
  XIMStatusCallbacks = $0200;  
  XIMStatusNothing = $0400;  
  XIMStatusNone = $0800;  
  XNVaNestedList = 'XNVaNestedList';  
  XNQueryInputStyle = 'queryInputStyle';  
  XNClientWindow = 'clientWindow';  
  XNInputStyle = 'inputStyle';  
  XNFocusWindow = 'focusWindow';  
  XNResourceName = 'resourceName';  
  XNResourceClass = 'resourceClass';  
  XNGeometryCallback = 'geometryCallback';  
  XNDestroyCallback = 'destroyCallback';  
  XNFilterEvents = 'filterEvents';  
  XNPreeditStartCallback = 'preeditStartCallback';  
  XNPreeditDoneCallback = 'preeditDoneCallback';  
  XNPreeditDrawCallback = 'preeditDrawCallback';  
  XNPreeditCaretCallback = 'preeditCaretCallback';  
  XNPreeditStateNotifyCallback = 'preeditStateNotifyCallback';  
  XNPreeditAttributes = 'preeditAttributes';  
  XNStatusStartCallback = 'statusStartCallback';  
  XNStatusDoneCallback = 'statusDoneCallback';  
  XNStatusDrawCallback = 'statusDrawCallback';  
  XNStatusAttributes = 'statusAttributes';  
  XNArea = 'area';  
  XNAreaNeeded = 'areaNeeded';  
  XNSpotLocation = 'spotLocation';  
  XNColormap = 'colorMap';  
  XNStdColormap = 'stdColorMap';  
  XNForeground = 'foreground';  
  XNBackground = 'background';  
  XNBackgroundPixmap = 'backgroundPixmap';  
  XNFontSet = 'fontSet';  
  XNLineSpace = 'lineSpace';  
  XNCursor = 'cursor';  
  XNQueryIMValuesList = 'queryIMValuesList';  
  XNQueryICValuesList = 'queryICValuesList';  
  XNVisiblePosition = 'visiblePosition';  
  XNR6PreeditCallback = 'r6PreeditCallback';  
  XNStringConversionCallback = 'stringConversionCallback';  
  XNStringConversion = 'stringConversion';  
  XNResetState = 'resetState';  
  XNHotKey = 'hotKey';  
  XNHotKeyState = 'hotKeyState';  
  XNPreeditState = 'preeditState';  
  XNSeparatorofNestedList = 'separatorofNestedList';  
  XBufferOverflow = -(1);  
  XLookupNone = 1;  
  XLookupChars = 2;  
  XLookupKeySym = 3;  
  XLookupBoth = 4;  
type
  PXVaNestedList = ^TXVaNestedList;
  TXVaNestedList = pointer;

  PXIMCallback = ^TXIMCallback;
  TXIMCallback = record
      client_data : TXPointer;
      callback : TXIMProc;
    end;

  PXICCallback = ^TXICCallback;
  TXICCallback = record
      client_data : TXPointer;
      callback : TXICProc;
    end;

  PXIMFeedback = ^TXIMFeedback;
  TXIMFeedback = dword;

const
  XIMReverse = 1;  
  XIMUnderline = 1 shl 1;  
  XIMHighlight = 1 shl 2;  
  XIMPrimary = 1 shl 5;  
  XIMSecondary = 1 shl 6;  
  XIMTertiary = 1 shl 7;  
  XIMVisibleToForward = 1 shl 8;  
  XIMVisibleToBackword = 1 shl 9;  
  XIMVisibleToCenter = 1 shl 10;  
type
  PXIMText = ^TXIMText;
  TXIMText = record
      length : word;
      feedback : PXIMFeedback;
      encoding_is_wchar : TBool;
      _string : record
          case longint of
            0 : ( multi_byte : Pchar );
            1 : ( wide_char : Pwchar_t );
          end;
    end;

  PXIMPreeditState = ^TXIMPreeditState;
  TXIMPreeditState = dword;

const
  XIMPreeditUnKnown = 0;  
  XIMPreeditEnable = 1;  
  XIMPreeditDisable = 1 shl 1;  
type
  PXIMPreeditStateNotifyCallbackStruct = ^TXIMPreeditStateNotifyCallbackStruct;
  TXIMPreeditStateNotifyCallbackStruct = record
      state : TXIMPreeditState;
    end;

  PXIMResetState = ^TXIMResetState;
  TXIMResetState = dword;

const
  XIMInitialState = 1;  
  XIMPreserveState = 1 shl 1;  
type
  PXIMStringConversionFeedback = ^TXIMStringConversionFeedback;
  TXIMStringConversionFeedback = dword;

const
  XIMStringConversionLeftEdge = $00000001;  
  XIMStringConversionRightEdge = $00000002;  
  XIMStringConversionTopEdge = $00000004;  
  XIMStringConversionBottomEdge = $00000008;  
  XIMStringConversionConcealed = $00000010;  
  XIMStringConversionWrapped = $00000020;  
type
  PXIMStringConversionText = ^TXIMStringConversionText;
  TXIMStringConversionText = record
      length : word;
      feedback : PXIMStringConversionFeedback;
      encoding_is_wchar : TBool;
      _string : record
          case longint of
            0 : ( mbs : Pchar );
            1 : ( wcs : Pwchar_t );
          end;
    end;

  PXIMStringConversionPosition = ^TXIMStringConversionPosition;
  TXIMStringConversionPosition = word;

  PXIMStringConversionType = ^TXIMStringConversionType;
  TXIMStringConversionType = word;

const
  XIMStringConversionBuffer = $0001;  
  XIMStringConversionLine = $0002;  
  XIMStringConversionWord = $0003;  
  XIMStringConversionChar = $0004;  
type
  PXIMStringConversionOperation = ^TXIMStringConversionOperation;
  TXIMStringConversionOperation = word;

const
  XIMStringConversionSubstitution = $0001;  
  XIMStringConversionRetrieval = $0002;  
type
  PXIMCaretDirection = ^TXIMCaretDirection;
  TXIMCaretDirection =  Longint;
  Const
    XIMForwardChar = 0;
    XIMBackwardChar = 1;
    XIMForwardWord = 2;
    XIMBackwardWord = 3;
    XIMCaretUp = 4;
    XIMCaretDown = 5;
    XIMNextLine = 6;
    XIMPreviousLine = 7;
    XIMLineStart = 8;
    XIMLineEnd = 9;
    XIMAbsolutePosition = 10;
    XIMDontChange = 11;
;
type
  PXIMStringConversionCallbackStruct = ^TXIMStringConversionCallbackStruct;
  TXIMStringConversionCallbackStruct = record
      position : TXIMStringConversionPosition;
      direction : TXIMCaretDirection;
      operation : TXIMStringConversionOperation;
      factor : word;
      text : PXIMStringConversionText;
    end;
{ Cursor offset within pre-edit string  }
{ Starting change position  }
{ Length of the change in character count  }

  PXIMPreeditDrawCallbackStruct = ^TXIMPreeditDrawCallbackStruct;
  TXIMPreeditDrawCallbackStruct = record
      caret : longint;
      chg_first : longint;
      chg_length : longint;
      text : PXIMText;
    end;
{ Disable caret feedback  }
{ UI defined caret feedback  }
{ UI defined caret feedback  }

  PXIMCaretStyle = ^TXIMCaretStyle;
  TXIMCaretStyle =  Longint;
  Const
    XIMIsInvisible = 0;
    XIMIsPrimary = 1;
    XIMIsSecondary = 2;
;
{ Caret offset within pre-edit string  }
{ Caret moves direction  }
{ Feedback of the caret  }
type
  PXIMPreeditCaretCallbackStruct = ^TXIMPreeditCaretCallbackStruct;
  TXIMPreeditCaretCallbackStruct = record
      position : longint;
      direction : TXIMCaretDirection;
      style : TXIMCaretStyle;
    end;

  PXIMStatusDataType = ^TXIMStatusDataType;
  TXIMStatusDataType =  Longint;
  Const
    XIMTextType = 0;
    XIMBitmapType = 1;
;
type
  PXIMStatusDrawCallbackStruct = ^TXIMStatusDrawCallbackStruct;
  TXIMStatusDrawCallbackStruct = record
      _type : TXIMStatusDataType;
      data : record
          case longint of
            0 : ( text : PXIMText );
            1 : ( bitmap : TPixmap );
          end;
    end;

  PXIMHotKeyTrigger = ^TXIMHotKeyTrigger;
  TXIMHotKeyTrigger = record
      keysym : TKeySym;
      modifier : longint;
      modifier_mask : longint;
    end;

  PXIMHotKeyTriggers = ^TXIMHotKeyTriggers;
  TXIMHotKeyTriggers = record
      num_hot_key : longint;
      key : PXIMHotKeyTrigger;
    end;

  PXIMHotKeyState = ^TXIMHotKeyState;
  TXIMHotKeyState = dword;

const
  XIMHotKeyStateON = $0001;  
  XIMHotKeyStateOFF = $0002;  
type
  PXIMValuesList = ^TXIMValuesList;
  TXIMValuesList = record
      count_values : word;
      supported_values : ^Pchar;
    end;
{_XFUNCPROTOBEGIN }
{#if defined(WIN32) && !defined(_XLIBINT_) }
{#define _Xdebug (*_Xdebug_p) }
{#endif }
  var
    _Xdebug : longint;cvar;external;
{ display  }{ name  }

function XLoadQueryFont(para1:PDisplay; para2:Pchar):PXFontStruct;cdecl;external;
{ display  }{ font_ID  }
function XQueryFont(para1:PDisplay; para2:TXID):PXFontStruct;cdecl;external;
{ display  }{ w  }{ start  }{ stop  }{ nevents_return  }
function XGetMotionEvents(para1:PDisplay; para2:TWindow; para3:TTime; para4:TTime; para5:Plongint):PXTimeCoord;cdecl;external;
{ modmap  }{$if NeedWidePrototypes}
{ keycode_entry  }{$else}
{ keycode_entry  }{$endif}
{ modifier  }

function XDeleteModifiermapEntry(para1:PXModifierKeymap; para2:dword; para3:TKeyCode; para4:longint):PXModifierKeymap;cdecl;external;
{ display  }
function XGetModifierMapping(para1:PDisplay):PXModifierKeymap;cdecl;external;
{ modmap  }{$if NeedWidePrototypes}
{ keycode_entry  }{$else}
{ keycode_entry  }{$endif}
{ modifier  }

function XInsertModifiermapEntry(para1:PXModifierKeymap; para2:dword; para3:TKeyCode; para4:longint):PXModifierKeymap;cdecl;external;
{ max_keys_per_mod  }
function XNewModifiermap(para1:longint):PXModifierKeymap;cdecl;external;
{ display  }{ visual  }{ depth  }{ format  }{ offset  }{ data  }{ width  }{ height  }{ bitmap_pad  }{ bytes_per_line  }
function XCreateImage(para1:PDisplay; para2:PVisual; para3:dword; para4:longint; para5:longint; 
           para6:Pchar; para7:dword; para8:dword; para9:longint; para10:longint):PXImage;cdecl;external;
{ image  }
function XInitImage(para1:PXImage):TStatus;cdecl;external;
{ display  }{ d  }{ x  }{ y  }{ width  }{ height  }{ plane_mask  }{ format  }
function XGetImage(para1:PDisplay; para2:TDrawable; para3:longint; para4:longint; para5:dword; 
           para6:dword; para7:dword; para8:longint):PXImage;cdecl;external;
{ display  }{ d  }{ x  }{ y  }{ width  }{ height  }{ plane_mask  }{ format  }{ dest_image  }{ dest_x  }{ dest_y  }
function XGetSubImage(para1:PDisplay; para2:TDrawable; para3:longint; para4:longint; para5:dword; 
           para6:dword; para7:dword; para8:longint; para9:PXImage; para10:longint; 
           para11:longint):PXImage;cdecl;external;
{
 * X function declarations.
  }
{ display_name  }
function XOpenDisplay(para1:Pchar):PDisplay;cdecl;external;
procedure XrmInitialize;cdecl;external;
{ display  }{ nbytes_return  }
function XFetchBytes(para1:PDisplay; para2:Plongint):Pchar;cdecl;external;
{ display  }{ nbytes_return  }{ buffer  }
function XFetchBuffer(para1:PDisplay; para2:Plongint; para3:longint):Pchar;cdecl;external;
{ display  }{ atom  }
function XGetAtomName(para1:PDisplay; para2:TAtom):Pchar;cdecl;external;
{ dpy  }{ atoms  }{ count  }{ names_return  }
function XGetAtomNames(para1:PDisplay; para2:PAtom; para3:longint; para4:PPchar):TStatus;cdecl;external;
{ display  }{ program  }{ option  }
function XGetDefault(para1:PDisplay; para2:Pchar; para3:Pchar):Pchar;cdecl;external;
{ string  }
function XDisplayName(para1:Pchar):Pchar;cdecl;external;
{ keysym  }
function XKeysymToString(para1:TKeySym):Pchar;cdecl;external;
{ display  }{ onoff  }
{ display  }
function XSynchronize(para1:PDisplay; para2:TBool):function (para1:PDisplay):longint;cdecl;external;
{ display  }{ display  }
{ procedure  }
{ display  }
function XSetAfterFunction(para1:PDisplay; para2:function (para1:PDisplay):longint):function (para1:PDisplay):longint;cdecl;external;
{ display  }{ atom_name  }{ only_if_exists  }
function XInternAtom(para1:PDisplay; para2:Pchar; para3:TBool):TAtom;cdecl;external;
{ dpy  }{ names  }{ count  }{ onlyIfExists  }{ atoms_return  }
function XInternAtoms(para1:PDisplay; para2:PPchar; para3:longint; para4:TBool; para5:PAtom):TStatus;cdecl;external;
{ display  }{ colormap  }
function XCopyColormapAndFree(para1:PDisplay; para2:TColormap):TColormap;cdecl;external;
{ display  }{ w  }{ visual  }{ alloc  }
function XCreateColormap(para1:PDisplay; para2:TWindow; para3:PVisual; para4:longint):TColormap;cdecl;external;
{ display  }{ source  }{ mask  }{ foreground_color  }{ background_color  }{ x  }{ y  }
function XCreatePixmapCursor(para1:PDisplay; para2:TPixmap; para3:TPixmap; para4:PXColor; para5:PXColor; 
           para6:dword; para7:dword):TCursor;cdecl;external;
{ display  }{ source_font  }{ mask_font  }{ source_char  }{ mask_char  }{ foreground_color  }{ background_color  }
function XCreateGlyphCursor(para1:PDisplay; para2:TFont; para3:TFont; para4:dword; para5:dword; 
           para6:PXColor; para7:PXColor):TCursor;cdecl;external;
{ display  }{ shape  }
function XCreateFontCursor(para1:PDisplay; para2:dword):TCursor;cdecl;external;
{ display  }{ name  }
function XLoadFont(para1:PDisplay; para2:Pchar):TFont;cdecl;external;
{ display  }{ d  }{ valuemask  }{ values  }
function XCreateGC(para1:PDisplay; para2:TDrawable; para3:dword; para4:PXGCValues):TGC;cdecl;external;
{ gc  }
function XGContextFromGC(para1:TGC):TGContext;cdecl;external;
{ display  }{ gc  }
procedure XFlushGC(para1:PDisplay; para2:TGC);cdecl;external;
{ display  }{ d  }{ width  }{ height  }{ depth  }
function XCreatePixmap(para1:PDisplay; para2:TDrawable; para3:dword; para4:dword; para5:dword):TPixmap;cdecl;external;
{ display  }{ d  }{ data  }{ width  }{ height  }
function XCreateBitmapFromData(para1:PDisplay; para2:TDrawable; para3:Pchar; para4:dword; para5:dword):TPixmap;cdecl;external;
{ display  }{ d  }{ data  }{ width  }{ height  }{ fg  }{ bg  }{ depth  }
function XCreatePixmapFromBitmapData(para1:PDisplay; para2:TDrawable; para3:Pchar; para4:dword; para5:dword; 
           para6:dword; para7:dword; para8:dword):TPixmap;cdecl;external;
{ display  }{ parent  }{ x  }{ y  }{ width  }{ height  }{ border_width  }{ border  }{ background  }
function XCreateSimpleWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:longint; para5:dword; 
           para6:dword; para7:dword; para8:dword; para9:dword):TWindow;cdecl;external;
{ display  }{ selection  }
function XGetSelectionOwner(para1:PDisplay; para2:TAtom):TWindow;cdecl;external;
{ display  }{ parent  }{ x  }{ y  }{ width  }{ height  }{ border_width  }{ depth  }{ class  }{ visual  }{ valuemask  }{ attributes  }
function XCreateWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:longint; para5:dword; 
           para6:dword; para7:dword; para8:longint; para9:dword; para10:PVisual; 
           para11:dword; para12:PXSetWindowAttributes):TWindow;cdecl;external;
{ display  }{ w  }{ num_return  }
function XListInstalledColormaps(para1:PDisplay; para2:TWindow; para3:Plongint):PColormap;cdecl;external;
{ display  }{ pattern  }{ maxnames  }{ actual_count_return  }
function XListFonts(para1:PDisplay; para2:Pchar; para3:longint; para4:Plongint):^Pchar;cdecl;external;
{ display  }{ pattern  }{ maxnames  }{ count_return  }{ info_return  }
function XListFontsWithInfo(para1:PDisplay; para2:Pchar; para3:longint; para4:Plongint; para5:PPXFontStruct):^Pchar;cdecl;external;
{ display  }{ npaths_return  }
function XGetFontPath(para1:PDisplay; para2:Plongint):^Pchar;cdecl;external;
{ display  }{ nextensions_return  }
function XListExtensions(para1:PDisplay; para2:Plongint):^Pchar;cdecl;external;
{ display  }{ w  }{ num_prop_return  }
function XListProperties(para1:PDisplay; para2:TWindow; para3:Plongint):PAtom;cdecl;external;
{ display  }{ nhosts_return  }{ state_return  }
function XListHosts(para1:PDisplay; para2:Plongint; para3:PBool):PXHostAddress;cdecl;external;
{ display  }{$if NeedWidePrototypes}
{ keycode  }{$else}
{ keycode  }{$endif}
{ index  }

function XKeycodeToKeysym(para1:PDisplay; para2:dword; para3:TKeyCode; para4:longint):TKeySym;cdecl;external;
{ key_event  }{ index  }
function XLookupKeysym(para1:PXKeyEvent; para2:longint):TKeySym;cdecl;external;
{ display  }{$if NeedWidePrototypes}
{ first_keycode  }{$else}
{ first_keycode  }{$endif}
{ keycode_count  }{ keysyms_per_keycode_return  }

function XGetKeyboardMapping(para1:PDisplay; para2:dword; para3:TKeyCode; para4:longint; para5:Plongint):PKeySym;cdecl;external;
{ string  }
function XStringToKeysym(para1:Pchar):TKeySym;cdecl;external;
{ display  }
function XMaxRequestSize(para1:PDisplay):longint;cdecl;external;
{ display  }
function XExtendedMaxRequestSize(para1:PDisplay):longint;cdecl;external;
{ display  }
function XResourceManagerString(para1:PDisplay):Pchar;cdecl;external;
{ screen  }
function XScreenResourceString(para1:PScreen):Pchar;cdecl;external;
{ display  }
function XDisplayMotionBufferSize(para1:PDisplay):dword;cdecl;external;
{ visual  }
function XVisualIDFromVisual(para1:PVisual):TVisualID;cdecl;external;
{ multithread routines  }
function XInitThreads:TStatus;cdecl;external;
{ display  }
procedure XLockDisplay(para1:PDisplay);cdecl;external;
{ display  }
procedure XUnlockDisplay(para1:PDisplay);cdecl;external;
{ routines for dealing with extensions  }
{ display  }{ name  }
function XInitExtension(para1:PDisplay; para2:Pchar):PXExtCodes;cdecl;external;
{ display  }
function XAddExtension(para1:PDisplay):PXExtCodes;cdecl;external;
{ structure  }{ number  }
function XFindOnExtensionList(para1:PPXExtData; para2:longint):PXExtData;cdecl;external;
{ object  }
function XEHeadOfExtensionList(para1:TXEDataObject):^PXExtData;cdecl;external;
{ these are routines for which there are also macros  }
{ display  }{ screen_number  }
function XRootWindow(para1:PDisplay; para2:longint):TWindow;cdecl;external;
{ display  }
function XDefaultRootWindow(para1:PDisplay):TWindow;cdecl;external;
{ screen  }
function XRootWindowOfScreen(para1:PScreen):TWindow;cdecl;external;
{ display  }{ screen_number  }
function XDefaultVisual(para1:PDisplay; para2:longint):PVisual;cdecl;external;
{ screen  }
function XDefaultVisualOfScreen(para1:PScreen):PVisual;cdecl;external;
{ display  }{ screen_number  }
function XDefaultGC(para1:PDisplay; para2:longint):TGC;cdecl;external;
{ screen  }
function XDefaultGCOfScreen(para1:PScreen):TGC;cdecl;external;
{ display  }{ screen_number  }
function XBlackPixel(para1:PDisplay; para2:longint):dword;cdecl;external;
{ display  }{ screen_number  }
function XWhitePixel(para1:PDisplay; para2:longint):dword;cdecl;external;
function XAllPlanes:dword;cdecl;external;
{ screen  }
function XBlackPixelOfScreen(para1:PScreen):dword;cdecl;external;
{ screen  }
function XWhitePixelOfScreen(para1:PScreen):dword;cdecl;external;
{ display  }
function XNextRequest(para1:PDisplay):dword;cdecl;external;
{ display  }
function XLastKnownRequestProcessed(para1:PDisplay):dword;cdecl;external;
{ display  }
function XServerVendor(para1:PDisplay):Pchar;cdecl;external;
{ display  }
function XDisplayString(para1:PDisplay):Pchar;cdecl;external;
{ display  }{ screen_number  }
function XDefaultColormap(para1:PDisplay; para2:longint):TColormap;cdecl;external;
{ screen  }
function XDefaultColormapOfScreen(para1:PScreen):TColormap;cdecl;external;
{ screen  }
function XDisplayOfScreen(para1:PScreen):PDisplay;cdecl;external;
{ display  }{ screen_number  }
function XScreenOfDisplay(para1:PDisplay; para2:longint):PScreen;cdecl;external;
{ display  }
function XDefaultScreenOfDisplay(para1:PDisplay):PScreen;cdecl;external;
{ screen  }
function XEventMaskOfScreen(para1:PScreen):longint;cdecl;external;
{ screen  }
function XScreenNumberOfScreen(para1:PScreen):longint;cdecl;external;
{ WARNING, this type not in Xlib spec  }
{ display  }{ error_event  }
type

  TXErrorHandler = function (para1:PDisplay; para2:PXErrorEvent):longint;cdecl;
{ handler  }

function XSetErrorHandler(para1:TXErrorHandler):TXErrorHandler;cdecl;external;
{ WARNING, this type not in Xlib spec  }
{ display  }
type

  TXIOErrorHandler = function (para1:PDisplay):longint;cdecl;
{ handler  }

function XSetIOErrorHandler(para1:TXIOErrorHandler):TXIOErrorHandler;cdecl;external;
{ WARNING, this type not in Xlib spec  }
{ display  }
{ user_data  }
type

  TXIOErrorExitHandler = procedure (para1:PDisplay; para2:pointer);cdecl;
{ display  }
{ handler  }
{ user_data  }

procedure XSetIOErrorExitHandler(para1:PDisplay; para2:TXIOErrorExitHandler; para3:pointer);cdecl;external;
{ display  }{ count_return  }
function XListPixmapFormats(para1:PDisplay; para2:Plongint):PXPixmapFormatValues;cdecl;external;
{ display  }{ screen_number  }{ count_return  }
function XListDepths(para1:PDisplay; para2:longint; para3:Plongint):Plongint;cdecl;external;
{ ICCCM routines for things that don't require special include files;  }
{ other declarations are given in Xutil.h                              }
{ display  }{ w  }{ screen_number  }{ mask  }{ changes  }
function XReconfigureWMWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:dword; para5:PXWindowChanges):TStatus;cdecl;external;
{ display  }{ w  }{ protocols_return  }{ count_return  }
function XGetWMProtocols(para1:PDisplay; para2:TWindow; para3:PPAtom; para4:Plongint):TStatus;cdecl;external;
{ display  }{ w  }{ protocols  }{ count  }
function XSetWMProtocols(para1:PDisplay; para2:TWindow; para3:PAtom; para4:longint):TStatus;cdecl;external;
{ display  }{ w  }{ screen_number  }
function XIconifyWindow(para1:PDisplay; para2:TWindow; para3:longint):TStatus;cdecl;external;
{ display  }{ w  }{ screen_number  }
function XWithdrawWindow(para1:PDisplay; para2:TWindow; para3:longint):TStatus;cdecl;external;
{ display  }{ w  }{ argv_return  }{ argc_return  }
function XGetCommand(para1:PDisplay; para2:TWindow; para3:PPPchar; para4:Plongint):TStatus;cdecl;external;
{ display  }{ w  }{ windows_return  }{ count_return  }
function XGetWMColormapWindows(para1:PDisplay; para2:TWindow; para3:PPWindow; para4:Plongint):TStatus;cdecl;external;
{ display  }{ w  }{ colormap_windows  }{ count  }
function XSetWMColormapWindows(para1:PDisplay; para2:TWindow; para3:PWindow; para4:longint):TStatus;cdecl;external;
{ list  }
procedure XFreeStringList(para1:PPchar);cdecl;external;
{ display  }{ w  }{ prop_window  }
function XSetTransientForHint(para1:PDisplay; para2:TWindow; para3:TWindow):longint;cdecl;external;
{ The following are given in alphabetical order  }
{ display  }
function XActivateScreenSaver(para1:PDisplay):longint;cdecl;external;
{ display  }{ host  }
function XAddHost(para1:PDisplay; para2:PXHostAddress):longint;cdecl;external;
{ display  }{ hosts  }{ num_hosts  }
function XAddHosts(para1:PDisplay; para2:PXHostAddress; para3:longint):longint;cdecl;external;
{ structure  }{ ext_data  }
function XAddToExtensionList(para1:PPXExtData; para2:PXExtData):longint;cdecl;external;
{ display  }{ w  }
function XAddToSaveSet(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ colormap  }{ screen_in_out  }
function XAllocColor(para1:PDisplay; para2:TColormap; para3:PXColor):TStatus;cdecl;external;
{ display  }{ colormap  }{ contig  }{ plane_masks_return  }{ nplanes  }{ pixels_return  }{ npixels  }
function XAllocColorCells(para1:PDisplay; para2:TColormap; para3:TBool; para4:Pdword; para5:dword; 
           para6:Pdword; para7:dword):TStatus;cdecl;external;
{ display  }{ colormap  }{ contig  }{ pixels_return  }{ ncolors  }{ nreds  }{ ngreens  }{ nblues  }{ rmask_return  }{ gmask_return  }{ bmask_return  }
function XAllocColorPlanes(para1:PDisplay; para2:TColormap; para3:TBool; para4:Pdword; para5:longint; 
           para6:longint; para7:longint; para8:longint; para9:Pdword; para10:Pdword; 
           para11:Pdword):TStatus;cdecl;external;
{ display  }{ colormap  }{ color_name  }{ screen_def_return  }{ exact_def_return  }
function XAllocNamedColor(para1:PDisplay; para2:TColormap; para3:Pchar; para4:PXColor; para5:PXColor):TStatus;cdecl;external;
{ display  }{ event_mode  }{ time  }
function XAllowEvents(para1:PDisplay; para2:longint; para3:TTime):longint;cdecl;external;
{ display  }
function XAutoRepeatOff(para1:PDisplay):longint;cdecl;external;
{ display  }
function XAutoRepeatOn(para1:PDisplay):longint;cdecl;external;
{ display  }{ percent  }
function XBell(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }
function XBitmapBitOrder(para1:PDisplay):longint;cdecl;external;
{ display  }
function XBitmapPad(para1:PDisplay):longint;cdecl;external;
{ display  }
function XBitmapUnit(para1:PDisplay):longint;cdecl;external;
{ screen  }
function XCellsOfScreen(para1:PScreen):longint;cdecl;external;
{ display  }{ event_mask  }{ cursor  }{ time  }
function XChangeActivePointerGrab(para1:PDisplay; para2:dword; para3:TCursor; para4:TTime):longint;cdecl;external;
{ display  }{ gc  }{ valuemask  }{ values  }
function XChangeGC(para1:PDisplay; para2:TGC; para3:dword; para4:PXGCValues):longint;cdecl;external;
{ display  }{ value_mask  }{ values  }
function XChangeKeyboardControl(para1:PDisplay; para2:dword; para3:PXKeyboardControl):longint;cdecl;external;
{ display  }{ first_keycode  }{ keysyms_per_keycode  }{ keysyms  }{ num_codes  }
function XChangeKeyboardMapping(para1:PDisplay; para2:longint; para3:longint; para4:PKeySym; para5:longint):longint;cdecl;external;
{ display  }{ do_accel  }{ do_threshold  }{ accel_numerator  }{ accel_denominator  }{ threshold  }
function XChangePointerControl(para1:PDisplay; para2:TBool; para3:TBool; para4:longint; para5:longint; 
           para6:longint):longint;cdecl;external;
{ display  }{ w  }{ property  }{ type  }{ format  }{ mode  }{ data  }{ nelements  }
function XChangeProperty(para1:PDisplay; para2:TWindow; para3:TAtom; para4:TAtom; para5:longint; 
           para6:longint; para7:Pbyte; para8:longint):longint;cdecl;external;
{ display  }{ w  }{ change_mode  }
function XChangeSaveSet(para1:PDisplay; para2:TWindow; para3:longint):longint;cdecl;external;
{ display  }{ w  }{ valuemask  }{ attributes  }
function XChangeWindowAttributes(para1:PDisplay; para2:TWindow; para3:dword; para4:PXSetWindowAttributes):longint;cdecl;external;
{ display  }{ event_return  }{ display  }{ event  }{ arg  }
{ predicate  }{ arg  }
function XCheckIfEvent(para1:PDisplay; para2:PXEvent; para3:function (para1:PDisplay; para2:PXEvent; para3:TXPointer):TBool; para4:TXPointer):TBool;cdecl;external;
{ display  }{ event_mask  }{ event_return  }
function XCheckMaskEvent(para1:PDisplay; para2:longint; para3:PXEvent):TBool;cdecl;external;
{ display  }{ event_type  }{ event_return  }
function XCheckTypedEvent(para1:PDisplay; para2:longint; para3:PXEvent):TBool;cdecl;external;
{ display  }{ w  }{ event_type  }{ event_return  }
function XCheckTypedWindowEvent(para1:PDisplay; para2:TWindow; para3:longint; para4:PXEvent):TBool;cdecl;external;
{ display  }{ w  }{ event_mask  }{ event_return  }
function XCheckWindowEvent(para1:PDisplay; para2:TWindow; para3:longint; para4:PXEvent):TBool;cdecl;external;
{ display  }{ w  }{ direction  }
function XCirculateSubwindows(para1:PDisplay; para2:TWindow; para3:longint):longint;cdecl;external;
{ display  }{ w  }
function XCirculateSubwindowsDown(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ w  }
function XCirculateSubwindowsUp(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ w  }{ x  }{ y  }{ width  }{ height  }{ exposures  }
function XClearArea(para1:PDisplay; para2:TWindow; para3:longint; para4:longint; para5:dword; 
           para6:dword; para7:TBool):longint;cdecl;external;
{ display  }{ w  }
function XClearWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }
function XCloseDisplay(para1:PDisplay):longint;cdecl;external;
{ display  }{ w  }{ value_mask  }{ values  }
function XConfigureWindow(para1:PDisplay; para2:TWindow; para3:dword; para4:PXWindowChanges):longint;cdecl;external;
{ display  }
function XConnectionNumber(para1:PDisplay):longint;cdecl;external;
{ display  }{ selection  }{ target  }{ property  }{ requestor  }{ time  }
function XConvertSelection(para1:PDisplay; para2:TAtom; para3:TAtom; para4:TAtom; para5:TWindow; 
           para6:TTime):longint;cdecl;external;
{ display  }{ src  }{ dest  }{ gc  }{ src_x  }{ src_y  }{ width  }{ height  }{ dest_x  }{ dest_y  }
function XCopyArea(para1:PDisplay; para2:TDrawable; para3:TDrawable; para4:TGC; para5:longint; 
           para6:longint; para7:dword; para8:dword; para9:longint; para10:longint):longint;cdecl;external;
{ display  }{ src  }{ valuemask  }{ dest  }
function XCopyGC(para1:PDisplay; para2:TGC; para3:dword; para4:TGC):longint;cdecl;external;
{ display  }{ src  }{ dest  }{ gc  }{ src_x  }{ src_y  }{ width  }{ height  }{ dest_x  }{ dest_y  }{ plane  }
function XCopyPlane(para1:PDisplay; para2:TDrawable; para3:TDrawable; para4:TGC; para5:longint; 
           para6:longint; para7:dword; para8:dword; para9:longint; para10:longint; 
           para11:dword):longint;cdecl;external;
{ display  }{ screen_number  }
function XDefaultDepth(para1:PDisplay; para2:longint):longint;cdecl;external;
{ screen  }
function XDefaultDepthOfScreen(para1:PScreen):longint;cdecl;external;
{ display  }
function XDefaultScreen(para1:PDisplay):longint;cdecl;external;
{ display  }{ w  }{ cursor  }
function XDefineCursor(para1:PDisplay; para2:TWindow; para3:TCursor):longint;cdecl;external;
{ display  }{ w  }{ property  }
function XDeleteProperty(para1:PDisplay; para2:TWindow; para3:TAtom):longint;cdecl;external;
{ display  }{ w  }
function XDestroyWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ w  }
function XDestroySubwindows(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ screen  }
function XDoesBackingStore(para1:PScreen):longint;cdecl;external;
{ screen  }
function XDoesSaveUnders(para1:PScreen):TBool;cdecl;external;
{ display  }
function XDisableAccessControl(para1:PDisplay):longint;cdecl;external;
{ display  }{ screen_number  }
function XDisplayCells(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ screen_number  }
function XDisplayHeight(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ screen_number  }
function XDisplayHeightMM(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ min_keycodes_return  }{ max_keycodes_return  }
function XDisplayKeycodes(para1:PDisplay; para2:Plongint; para3:Plongint):longint;cdecl;external;
{ display  }{ screen_number  }
function XDisplayPlanes(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ screen_number  }
function XDisplayWidth(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ screen_number  }
function XDisplayWidthMM(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ width  }{ height  }{ angle1  }{ angle2  }
function XDrawArc(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:dword; para7:dword; para8:longint; para9:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ arcs  }{ narcs  }
function XDrawArcs(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXArc; para5:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ string  }{ length  }
function XDrawImageString(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:Pchar; para7:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ string  }{ length  }
function XDrawImageString16(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:PXChar2b; para7:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x1  }{ y1  }{ x2  }{ y2  }
function XDrawLine(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:longint; para7:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ points  }{ npoints  }{ mode  }
function XDrawLines(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXPoint; para5:longint; 
           para6:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }
function XDrawPoint(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ points  }{ npoints  }{ mode  }
function XDrawPoints(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXPoint; para5:longint; 
           para6:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ width  }{ height  }
function XDrawRectangle(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:dword; para7:dword):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ rectangles  }{ nrectangles  }
function XDrawRectangles(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXRectangle; para5:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ segments  }{ nsegments  }
function XDrawSegments(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXSegment; para5:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ string  }{ length  }
function XDrawString(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:Pchar; para7:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ string  }{ length  }
function XDrawString16(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:PXChar2b; para7:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ items  }{ nitems  }
function XDrawText(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:PXTextItem; para7:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ items  }{ nitems  }
function XDrawText16(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:PXTextItem16; para7:longint):longint;cdecl;external;
{ display  }
function XEnableAccessControl(para1:PDisplay):longint;cdecl;external;
{ display  }{ mode  }
function XEventsQueued(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ w  }{ window_name_return  }
function XFetchName(para1:PDisplay; para2:TWindow; para3:PPchar):TStatus;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ width  }{ height  }{ angle1  }{ angle2  }
function XFillArc(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:dword; para7:dword; para8:longint; para9:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ arcs  }{ narcs  }
function XFillArcs(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXArc; para5:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ points  }{ npoints  }{ shape  }{ mode  }
function XFillPolygon(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXPoint; para5:longint; 
           para6:longint; para7:longint):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ width  }{ height  }
function XFillRectangle(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:dword; para7:dword):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ rectangles  }{ nrectangles  }
function XFillRectangles(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXRectangle; para5:longint):longint;cdecl;external;
{ display  }
function XFlush(para1:PDisplay):longint;cdecl;external;
{ display  }{ mode  }
function XForceScreenSaver(para1:PDisplay; para2:longint):longint;cdecl;external;
{ data  }
function XFree(para1:pointer):longint;cdecl;external;
{ display  }{ colormap  }
function XFreeColormap(para1:PDisplay; para2:TColormap):longint;cdecl;external;
{ display  }{ colormap  }{ pixels  }{ npixels  }{ planes  }
function XFreeColors(para1:PDisplay; para2:TColormap; para3:Pdword; para4:longint; para5:dword):longint;cdecl;external;
{ display  }{ cursor  }
function XFreeCursor(para1:PDisplay; para2:TCursor):longint;cdecl;external;
{ list  }
function XFreeExtensionList(para1:PPchar):longint;cdecl;external;
{ display  }{ font_struct  }
function XFreeFont(para1:PDisplay; para2:PXFontStruct):longint;cdecl;external;
{ names  }{ free_info  }{ actual_count  }
function XFreeFontInfo(para1:PPchar; para2:PXFontStruct; para3:longint):longint;cdecl;external;
{ list  }
function XFreeFontNames(para1:PPchar):longint;cdecl;external;
{ list  }
function XFreeFontPath(para1:PPchar):longint;cdecl;external;
{ display  }{ gc  }
function XFreeGC(para1:PDisplay; para2:TGC):longint;cdecl;external;
{ modmap  }
function XFreeModifiermap(para1:PXModifierKeymap):longint;cdecl;external;
{ display  }{ pixmap  }
function XFreePixmap(para1:PDisplay; para2:TPixmap):longint;cdecl;external;
{ display  }{ screen  }{ position  }{ default_position  }{ bwidth  }{ fwidth  }{ fheight  }{ xadder  }{ yadder  }{ x_return  }{ y_return  }{ width_return  }{ height_return  }
function XGeometry(para1:PDisplay; para2:longint; para3:Pchar; para4:Pchar; para5:dword; 
           para6:dword; para7:dword; para8:longint; para9:longint; para10:Plongint; 
           para11:Plongint; para12:Plongint; para13:Plongint):longint;cdecl;external;
{ display  }{ name  }{ message  }{ default_string  }{ buffer_return  }{ length  }
function XGetErrorDatabaseText(para1:PDisplay; para2:Pchar; para3:Pchar; para4:Pchar; para5:Pchar; 
           para6:longint):longint;cdecl;external;
{ display  }{ code  }{ buffer_return  }{ length  }
function XGetErrorText(para1:PDisplay; para2:longint; para3:Pchar; para4:longint):longint;cdecl;external;
{ font_struct  }{ atom  }{ value_return  }
function XGetFontProperty(para1:PXFontStruct; para2:TAtom; para3:Pdword):TBool;cdecl;external;
{ display  }{ gc  }{ valuemask  }{ values_return  }
function XGetGCValues(para1:PDisplay; para2:TGC; para3:dword; para4:PXGCValues):TStatus;cdecl;external;
{ display  }{ d  }{ root_return  }{ x_return  }{ y_return  }{ width_return  }{ height_return  }{ border_width_return  }{ depth_return  }
function XGetGeometry(para1:PDisplay; para2:TDrawable; para3:PWindow; para4:Plongint; para5:Plongint; 
           para6:Pdword; para7:Pdword; para8:Pdword; para9:Pdword):TStatus;cdecl;external;
{ display  }{ w  }{ icon_name_return  }
function XGetIconName(para1:PDisplay; para2:TWindow; para3:PPchar):TStatus;cdecl;external;
{ display  }{ focus_return  }{ revert_to_return  }
function XGetInputFocus(para1:PDisplay; para2:PWindow; para3:Plongint):longint;cdecl;external;
{ display  }{ values_return  }
function XGetKeyboardControl(para1:PDisplay; para2:PXKeyboardState):longint;cdecl;external;
{ display  }{ accel_numerator_return  }{ accel_denominator_return  }{ threshold_return  }
function XGetPointerControl(para1:PDisplay; para2:Plongint; para3:Plongint; para4:Plongint):longint;cdecl;external;
{ display  }{ map_return  }{ nmap  }
function XGetPointerMapping(para1:PDisplay; para2:Pbyte; para3:longint):longint;cdecl;external;
{ display  }{ timeout_return  }{ interval_return  }{ prefer_blanking_return  }{ allow_exposures_return  }
function XGetScreenSaver(para1:PDisplay; para2:Plongint; para3:Plongint; para4:Plongint; para5:Plongint):longint;cdecl;external;
{ display  }{ w  }{ prop_window_return  }
function XGetTransientForHint(para1:PDisplay; para2:TWindow; para3:PWindow):TStatus;cdecl;external;
{ display  }{ w  }{ property  }{ long_offset  }{ long_length  }{ delete  }{ req_type  }{ actual_type_return  }{ actual_format_return  }{ nitems_return  }{ bytes_after_return  }{ prop_return  }
function XGetWindowProperty(para1:PDisplay; para2:TWindow; para3:TAtom; para4:longint; para5:longint; 
           para6:TBool; para7:TAtom; para8:PAtom; para9:Plongint; para10:Pdword; 
           para11:Pdword; para12:PPbyte):longint;cdecl;external;
{ display  }{ w  }{ window_attributes_return  }
function XGetWindowAttributes(para1:PDisplay; para2:TWindow; para3:PXWindowAttributes):TStatus;cdecl;external;
{ display  }{ button  }{ modifiers  }{ grab_window  }{ owner_events  }{ event_mask  }{ pointer_mode  }{ keyboard_mode  }{ confine_to  }{ cursor  }
function XGrabButton(para1:PDisplay; para2:dword; para3:dword; para4:TWindow; para5:TBool; 
           para6:dword; para7:longint; para8:longint; para9:TWindow; para10:TCursor):longint;cdecl;external;
{ display  }{ keycode  }{ modifiers  }{ grab_window  }{ owner_events  }{ pointer_mode  }{ keyboard_mode  }
function XGrabKey(para1:PDisplay; para2:longint; para3:dword; para4:TWindow; para5:TBool; 
           para6:longint; para7:longint):longint;cdecl;external;
{ display  }{ grab_window  }{ owner_events  }{ pointer_mode  }{ keyboard_mode  }{ time  }
function XGrabKeyboard(para1:PDisplay; para2:TWindow; para3:TBool; para4:longint; para5:longint; 
           para6:TTime):longint;cdecl;external;
{ display  }{ grab_window  }{ owner_events  }{ event_mask  }{ pointer_mode  }{ keyboard_mode  }{ confine_to  }{ cursor  }{ time  }
function XGrabPointer(para1:PDisplay; para2:TWindow; para3:TBool; para4:dword; para5:longint; 
           para6:longint; para7:TWindow; para8:TCursor; para9:TTime):longint;cdecl;external;
{ display  }
function XGrabServer(para1:PDisplay):longint;cdecl;external;
{ screen  }
function XHeightMMOfScreen(para1:PScreen):longint;cdecl;external;
{ screen  }
function XHeightOfScreen(para1:PScreen):longint;cdecl;external;
{ display  }{ event_return  }{ display  }{ event  }{ arg  }
{ predicate  }{ arg  }
function XIfEvent(para1:PDisplay; para2:PXEvent; para3:function (para1:PDisplay; para2:PXEvent; para3:TXPointer):TBool; para4:TXPointer):longint;cdecl;external;
{ display  }
function XImageByteOrder(para1:PDisplay):longint;cdecl;external;
{ display  }{ colormap  }
function XInstallColormap(para1:PDisplay; para2:TColormap):longint;cdecl;external;
{ display  }{ keysym  }
function XKeysymToKeycode(para1:PDisplay; para2:TKeySym):TKeyCode;cdecl;external;
{ display  }{ resource  }
function XKillClient(para1:PDisplay; para2:TXID):longint;cdecl;external;
{ display  }{ colormap  }{ color_name  }{ exact_def_return  }{ screen_def_return  }
function XLookupColor(para1:PDisplay; para2:TColormap; para3:Pchar; para4:PXColor; para5:PXColor):TStatus;cdecl;external;
{ display  }{ w  }
function XLowerWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ w  }
function XMapRaised(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ w  }
function XMapSubwindows(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ w  }
function XMapWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ event_mask  }{ event_return  }
function XMaskEvent(para1:PDisplay; para2:longint; para3:PXEvent):longint;cdecl;external;
{ screen  }
function XMaxCmapsOfScreen(para1:PScreen):longint;cdecl;external;
{ screen  }
function XMinCmapsOfScreen(para1:PScreen):longint;cdecl;external;
{ display  }{ w  }{ x  }{ y  }{ width  }{ height  }
function XMoveResizeWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:longint; para5:dword; 
           para6:dword):longint;cdecl;external;
{ display  }{ w  }{ x  }{ y  }
function XMoveWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:longint):longint;cdecl;external;
{ display  }{ event_return  }
function XNextEvent(para1:PDisplay; para2:PXEvent):longint;cdecl;external;
{ display  }
function XNoOp(para1:PDisplay):longint;cdecl;external;
{ display  }{ colormap  }{ spec  }{ exact_def_return  }
function XParseColor(para1:PDisplay; para2:TColormap; para3:Pchar; para4:PXColor):TStatus;cdecl;external;
{ parsestring  }{ x_return  }{ y_return  }{ width_return  }{ height_return  }
function XParseGeometry(para1:Pchar; para2:Plongint; para3:Plongint; para4:Pdword; para5:Pdword):longint;cdecl;external;
{ display  }{ event_return  }
function XPeekEvent(para1:PDisplay; para2:PXEvent):longint;cdecl;external;
{ display  }{ event_return  }{ display  }{ event  }{ arg  }
{ predicate  }{ arg  }
function XPeekIfEvent(para1:PDisplay; para2:PXEvent; para3:function (para1:PDisplay; para2:PXEvent; para3:TXPointer):TBool; para4:TXPointer):longint;cdecl;external;
{ display  }
function XPending(para1:PDisplay):longint;cdecl;external;
{ screen  }
function XPlanesOfScreen(para1:PScreen):longint;cdecl;external;
{ display  }
function XProtocolRevision(para1:PDisplay):longint;cdecl;external;
{ display  }
function XProtocolVersion(para1:PDisplay):longint;cdecl;external;
{ display  }{ event  }
function XPutBackEvent(para1:PDisplay; para2:PXEvent):longint;cdecl;external;
{ display  }{ d  }{ gc  }{ image  }{ src_x  }{ src_y  }{ dest_x  }{ dest_y  }{ width  }{ height  }
function XPutImage(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXImage; para5:longint; 
           para6:longint; para7:longint; para8:longint; para9:dword; para10:dword):longint;cdecl;external;
{ display  }
function XQLength(para1:PDisplay):longint;cdecl;external;
{ display  }{ d  }{ width  }{ height  }{ width_return  }{ height_return  }
function XQueryBestCursor(para1:PDisplay; para2:TDrawable; para3:dword; para4:dword; para5:Pdword; 
           para6:Pdword):TStatus;cdecl;external;
{ display  }{ class  }{ which_screen  }{ width  }{ height  }{ width_return  }{ height_return  }
function XQueryBestSize(para1:PDisplay; para2:longint; para3:TDrawable; para4:dword; para5:dword; 
           para6:Pdword; para7:Pdword):TStatus;cdecl;external;
{ display  }{ which_screen  }{ width  }{ height  }{ width_return  }{ height_return  }
function XQueryBestStipple(para1:PDisplay; para2:TDrawable; para3:dword; para4:dword; para5:Pdword; 
           para6:Pdword):TStatus;cdecl;external;
{ display  }{ which_screen  }{ width  }{ height  }{ width_return  }{ height_return  }
function XQueryBestTile(para1:PDisplay; para2:TDrawable; para3:dword; para4:dword; para5:Pdword; 
           para6:Pdword):TStatus;cdecl;external;
{ display  }{ colormap  }{ def_in_out  }
function XQueryColor(para1:PDisplay; para2:TColormap; para3:PXColor):longint;cdecl;external;
{ display  }{ colormap  }{ defs_in_out  }{ ncolors  }
function XQueryColors(para1:PDisplay; para2:TColormap; para3:PXColor; para4:longint):longint;cdecl;external;
{ display  }{ name  }{ major_opcode_return  }{ first_event_return  }{ first_error_return  }
function XQueryExtension(para1:PDisplay; para2:Pchar; para3:Plongint; para4:Plongint; para5:Plongint):TBool;cdecl;external;
{ display  }{ keys_return  }
function XQueryKeymap(para1:PDisplay; para2:array[0..31] of char):longint;cdecl;external;
{ display  }{ w  }{ root_return  }{ child_return  }{ root_x_return  }{ root_y_return  }{ win_x_return  }{ win_y_return  }{ mask_return  }
function XQueryPointer(para1:PDisplay; para2:TWindow; para3:PWindow; para4:PWindow; para5:Plongint; 
           para6:Plongint; para7:Plongint; para8:Plongint; para9:Pdword):TBool;cdecl;external;
{ display  }{ font_ID  }{ string  }{ nchars  }{ direction_return  }{ font_ascent_return  }{ font_descent_return  }{ overall_return  }
function XQueryTextExtents(para1:PDisplay; para2:TXID; para3:Pchar; para4:longint; para5:Plongint; 
           para6:Plongint; para7:Plongint; para8:PXCharStruct):longint;cdecl;external;
{ display  }{ font_ID  }{ string  }{ nchars  }{ direction_return  }{ font_ascent_return  }{ font_descent_return  }{ overall_return  }
function XQueryTextExtents16(para1:PDisplay; para2:TXID; para3:PXChar2b; para4:longint; para5:Plongint; 
           para6:Plongint; para7:Plongint; para8:PXCharStruct):longint;cdecl;external;
{ display  }{ w  }{ root_return  }{ parent_return  }{ children_return  }{ nchildren_return  }
function XQueryTree(para1:PDisplay; para2:TWindow; para3:PWindow; para4:PWindow; para5:PPWindow; 
           para6:Pdword):TStatus;cdecl;external;
{ display  }{ w  }
function XRaiseWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ d  }{ filename  }{ width_return  }{ height_return  }{ bitmap_return  }{ x_hot_return  }{ y_hot_return  }
function XReadBitmapFile(para1:PDisplay; para2:TDrawable; para3:Pchar; para4:Pdword; para5:Pdword; 
           para6:PPixmap; para7:Plongint; para8:Plongint):longint;cdecl;external;
{ filename  }{ width_return  }{ height_return  }{ data_return  }{ x_hot_return  }{ y_hot_return  }
function XReadBitmapFileData(para1:Pchar; para2:Pdword; para3:Pdword; para4:PPbyte; para5:Plongint; 
           para6:Plongint):longint;cdecl;external;
{ display  }{ keysym  }{ list  }{ mod_count  }{ string  }{ bytes_string  }
function XRebindKeysym(para1:PDisplay; para2:TKeySym; para3:PKeySym; para4:longint; para5:Pbyte; 
           para6:longint):longint;cdecl;external;
{ display  }{ cursor  }{ foreground_color  }{ background_color  }
function XRecolorCursor(para1:PDisplay; para2:TCursor; para3:PXColor; para4:PXColor):longint;cdecl;external;
{ event_map  }
function XRefreshKeyboardMapping(para1:PXMappingEvent):longint;cdecl;external;
{ display  }{ w  }
function XRemoveFromSaveSet(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ host  }
function XRemoveHost(para1:PDisplay; para2:PXHostAddress):longint;cdecl;external;
{ display  }{ hosts  }{ num_hosts  }
function XRemoveHosts(para1:PDisplay; para2:PXHostAddress; para3:longint):longint;cdecl;external;
{ display  }{ w  }{ parent  }{ x  }{ y  }
function XReparentWindow(para1:PDisplay; para2:TWindow; para3:TWindow; para4:longint; para5:longint):longint;cdecl;external;
{ display  }
function XResetScreenSaver(para1:PDisplay):longint;cdecl;external;
{ display  }{ w  }{ width  }{ height  }
function XResizeWindow(para1:PDisplay; para2:TWindow; para3:dword; para4:dword):longint;cdecl;external;
{ display  }{ windows  }{ nwindows  }
function XRestackWindows(para1:PDisplay; para2:PWindow; para3:longint):longint;cdecl;external;
{ display  }{ rotate  }
function XRotateBuffers(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ w  }{ properties  }{ num_prop  }{ npositions  }
function XRotateWindowProperties(para1:PDisplay; para2:TWindow; para3:PAtom; para4:longint; para5:longint):longint;cdecl;external;
{ display  }
function XScreenCount(para1:PDisplay):longint;cdecl;external;
{ display  }{ w  }{ event_mask  }
function XSelectInput(para1:PDisplay; para2:TWindow; para3:longint):longint;cdecl;external;
{ display  }{ w  }{ propagate  }{ event_mask  }{ event_send  }
function XSendEvent(para1:PDisplay; para2:TWindow; para3:TBool; para4:longint; para5:PXEvent):TStatus;cdecl;external;
{ display  }{ mode  }
function XSetAccessControl(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ gc  }{ arc_mode  }
function XSetArcMode(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external;
{ display  }{ gc  }{ background  }
function XSetBackground(para1:PDisplay; para2:TGC; para3:dword):longint;cdecl;external;
{ display  }{ gc  }{ pixmap  }
function XSetClipMask(para1:PDisplay; para2:TGC; para3:TPixmap):longint;cdecl;external;
{ display  }{ gc  }{ clip_x_origin  }{ clip_y_origin  }
function XSetClipOrigin(para1:PDisplay; para2:TGC; para3:longint; para4:longint):longint;cdecl;external;
{ display  }{ gc  }{ clip_x_origin  }{ clip_y_origin  }{ rectangles  }{ n  }{ ordering  }
function XSetClipRectangles(para1:PDisplay; para2:TGC; para3:longint; para4:longint; para5:PXRectangle; 
           para6:longint; para7:longint):longint;cdecl;external;
{ display  }{ close_mode  }
function XSetCloseDownMode(para1:PDisplay; para2:longint):longint;cdecl;external;
{ display  }{ w  }{ argv  }{ argc  }
function XSetCommand(para1:PDisplay; para2:TWindow; para3:PPchar; para4:longint):longint;cdecl;external;
{ display  }{ gc  }{ dash_offset  }{ dash_list  }{ n  }
function XSetDashes(para1:PDisplay; para2:TGC; para3:longint; para4:Pchar; para5:longint):longint;cdecl;external;
{ display  }{ gc  }{ fill_rule  }
function XSetFillRule(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external;
{ display  }{ gc  }{ fill_style  }
function XSetFillStyle(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external;
{ display  }{ gc  }{ font  }
function XSetFont(para1:PDisplay; para2:TGC; para3:TFont):longint;cdecl;external;
{ display  }{ directories  }{ ndirs  }
function XSetFontPath(para1:PDisplay; para2:PPchar; para3:longint):longint;cdecl;external;
{ display  }{ gc  }{ foreground  }
function XSetForeground(para1:PDisplay; para2:TGC; para3:dword):longint;cdecl;external;
{ display  }{ gc  }{ function  }
function XSetFunction(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external;
{ display  }{ gc  }{ graphics_exposures  }
function XSetGraphicsExposures(para1:PDisplay; para2:TGC; para3:TBool):longint;cdecl;external;
{ display  }{ w  }{ icon_name  }
function XSetIconName(para1:PDisplay; para2:TWindow; para3:Pchar):longint;cdecl;external;
{ display  }{ focus  }{ revert_to  }{ time  }
function XSetInputFocus(para1:PDisplay; para2:TWindow; para3:longint; para4:TTime):longint;cdecl;external;
{ display  }{ gc  }{ line_width  }{ line_style  }{ cap_style  }{ join_style  }
function XSetLineAttributes(para1:PDisplay; para2:TGC; para3:dword; para4:longint; para5:longint; 
           para6:longint):longint;cdecl;external;
{ display  }{ modmap  }
function XSetModifierMapping(para1:PDisplay; para2:PXModifierKeymap):longint;cdecl;external;
{ display  }{ gc  }{ plane_mask  }
function XSetPlaneMask(para1:PDisplay; para2:TGC; para3:dword):longint;cdecl;external;
{ display  }{ map  }{ nmap  }
function XSetPointerMapping(para1:PDisplay; para2:Pbyte; para3:longint):longint;cdecl;external;
{ display  }{ timeout  }{ interval  }{ prefer_blanking  }{ allow_exposures  }
function XSetScreenSaver(para1:PDisplay; para2:longint; para3:longint; para4:longint; para5:longint):longint;cdecl;external;
{ display  }{ selection  }{ owner  }{ time  }
function XSetSelectionOwner(para1:PDisplay; para2:TAtom; para3:TWindow; para4:TTime):longint;cdecl;external;
{ display  }{ gc  }{ foreground  }{ background  }{ function  }{ plane_mask  }
function XSetState(para1:PDisplay; para2:TGC; para3:dword; para4:dword; para5:longint; 
           para6:dword):longint;cdecl;external;
{ display  }{ gc  }{ stipple  }
function XSetStipple(para1:PDisplay; para2:TGC; para3:TPixmap):longint;cdecl;external;
{ display  }{ gc  }{ subwindow_mode  }
function XSetSubwindowMode(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external;
{ display  }{ gc  }{ ts_x_origin  }{ ts_y_origin  }
function XSetTSOrigin(para1:PDisplay; para2:TGC; para3:longint; para4:longint):longint;cdecl;external;
{ display  }{ gc  }{ tile  }
function XSetTile(para1:PDisplay; para2:TGC; para3:TPixmap):longint;cdecl;external;
{ display  }{ w  }{ background_pixel  }
function XSetWindowBackground(para1:PDisplay; para2:TWindow; para3:dword):longint;cdecl;external;
{ display  }{ w  }{ background_pixmap  }
function XSetWindowBackgroundPixmap(para1:PDisplay; para2:TWindow; para3:TPixmap):longint;cdecl;external;
{ display  }{ w  }{ border_pixel  }
function XSetWindowBorder(para1:PDisplay; para2:TWindow; para3:dword):longint;cdecl;external;
{ display  }{ w  }{ border_pixmap  }
function XSetWindowBorderPixmap(para1:PDisplay; para2:TWindow; para3:TPixmap):longint;cdecl;external;
{ display  }{ w  }{ width  }
function XSetWindowBorderWidth(para1:PDisplay; para2:TWindow; para3:dword):longint;cdecl;external;
{ display  }{ w  }{ colormap  }
function XSetWindowColormap(para1:PDisplay; para2:TWindow; para3:TColormap):longint;cdecl;external;
{ display  }{ bytes  }{ nbytes  }{ buffer  }
function XStoreBuffer(para1:PDisplay; para2:Pchar; para3:longint; para4:longint):longint;cdecl;external;
{ display  }{ bytes  }{ nbytes  }
function XStoreBytes(para1:PDisplay; para2:Pchar; para3:longint):longint;cdecl;external;
{ display  }{ colormap  }{ color  }
function XStoreColor(para1:PDisplay; para2:TColormap; para3:PXColor):longint;cdecl;external;
{ display  }{ colormap  }{ color  }{ ncolors  }
function XStoreColors(para1:PDisplay; para2:TColormap; para3:PXColor; para4:longint):longint;cdecl;external;
{ display  }{ w  }{ window_name  }
function XStoreName(para1:PDisplay; para2:TWindow; para3:Pchar):longint;cdecl;external;
{ display  }{ colormap  }{ color  }{ pixel  }{ flags  }
function XStoreNamedColor(para1:PDisplay; para2:TColormap; para3:Pchar; para4:dword; para5:longint):longint;cdecl;external;
{ display  }{ discard  }
function XSync(para1:PDisplay; para2:TBool):longint;cdecl;external;
{ font_struct  }{ string  }{ nchars  }{ direction_return  }{ font_ascent_return  }{ font_descent_return  }{ overall_return  }
function XTextExtents(para1:PXFontStruct; para2:Pchar; para3:longint; para4:Plongint; para5:Plongint; 
           para6:Plongint; para7:PXCharStruct):longint;cdecl;external;
{ font_struct  }{ string  }{ nchars  }{ direction_return  }{ font_ascent_return  }{ font_descent_return  }{ overall_return  }
function XTextExtents16(para1:PXFontStruct; para2:PXChar2b; para3:longint; para4:Plongint; para5:Plongint; 
           para6:Plongint; para7:PXCharStruct):longint;cdecl;external;
{ font_struct  }{ string  }{ count  }
function XTextWidth(para1:PXFontStruct; para2:Pchar; para3:longint):longint;cdecl;external;
{ font_struct  }{ string  }{ count  }
function XTextWidth16(para1:PXFontStruct; para2:PXChar2b; para3:longint):longint;cdecl;external;
{ display  }{ src_w  }{ dest_w  }{ src_x  }{ src_y  }{ dest_x_return  }{ dest_y_return  }{ child_return  }
function XTranslateCoordinates(para1:PDisplay; para2:TWindow; para3:TWindow; para4:longint; para5:longint; 
           para6:Plongint; para7:Plongint; para8:PWindow):TBool;cdecl;external;
{ display  }{ w  }
function XUndefineCursor(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ button  }{ modifiers  }{ grab_window  }
function XUngrabButton(para1:PDisplay; para2:dword; para3:dword; para4:TWindow):longint;cdecl;external;
{ display  }{ keycode  }{ modifiers  }{ grab_window  }
function XUngrabKey(para1:PDisplay; para2:longint; para3:dword; para4:TWindow):longint;cdecl;external;
{ display  }{ time  }
function XUngrabKeyboard(para1:PDisplay; para2:TTime):longint;cdecl;external;
{ display  }{ time  }
function XUngrabPointer(para1:PDisplay; para2:TTime):longint;cdecl;external;
{ display  }
function XUngrabServer(para1:PDisplay):longint;cdecl;external;
{ display  }{ colormap  }
function XUninstallColormap(para1:PDisplay; para2:TColormap):longint;cdecl;external;
{ display  }{ font  }
function XUnloadFont(para1:PDisplay; para2:TFont):longint;cdecl;external;
{ display  }{ w  }
function XUnmapSubwindows(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }{ w  }
function XUnmapWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external;
{ display  }
function XVendorRelease(para1:PDisplay):longint;cdecl;external;
{ display  }{ src_w  }{ dest_w  }{ src_x  }{ src_y  }{ src_width  }{ src_height  }{ dest_x  }{ dest_y  }
function XWarpPointer(para1:PDisplay; para2:TWindow; para3:TWindow; para4:longint; para5:longint; 
           para6:dword; para7:dword; para8:longint; para9:longint):longint;cdecl;external;
{ screen  }
function XWidthMMOfScreen(para1:PScreen):longint;cdecl;external;
{ screen  }
function XWidthOfScreen(para1:PScreen):longint;cdecl;external;
{ display  }{ w  }{ event_mask  }{ event_return  }
function XWindowEvent(para1:PDisplay; para2:TWindow; para3:longint; para4:PXEvent):longint;cdecl;external;
{ display  }{ filename  }{ bitmap  }{ width  }{ height  }{ x_hot  }{ y_hot  }
function XWriteBitmapFile(para1:PDisplay; para2:Pchar; para3:TPixmap; para4:dword; para5:dword; 
           para6:longint; para7:longint):longint;cdecl;external;
function XSupportsLocale:TBool;cdecl;external;
(* Const before type ignored *)
{ modifier_list  }
function XSetLocaleModifiers(para1:Pchar):Pchar;cdecl;external;
{ display  }{ rdb  }{ res_name  }{ res_class  }
function XOpenOM(para1:PDisplay; para2:PXrmHashBucketRec; para3:Pchar; para4:Pchar):TXOM;cdecl;external;
{ om  }
function XCloseOM(para1:TXOM):TStatus;cdecl;external;
{ om  }function XSetOMValues(para1:TXOM; args:array of const):Pchar;cdecl;external;
function XSetOMValues(para1:TXOM):Pchar;cdecl;external;
{ om  }function XGetOMValues(para1:TXOM; args:array of const):Pchar;cdecl;external;
function XGetOMValues(para1:TXOM):Pchar;cdecl;external;
{ om  }
function XDisplayOfOM(para1:TXOM):PDisplay;cdecl;external;
{ om  }
function XLocaleOfOM(para1:TXOM):Pchar;cdecl;external;
{ om  }function XCreateOC(para1:TXOM; args:array of const):TXOC;cdecl;external;
function XCreateOC(para1:TXOM):TXOC;cdecl;external;
{ oc  }
procedure XDestroyOC(para1:TXOC);cdecl;external;
{ oc  }
function XOMOfOC(para1:TXOC):TXOM;cdecl;external;
{ oc  }function XSetOCValues(para1:TXOC; args:array of const):Pchar;cdecl;external;
function XSetOCValues(para1:TXOC):Pchar;cdecl;external;
{ oc  }function XGetOCValues(para1:TXOC; args:array of const):Pchar;cdecl;external;
function XGetOCValues(para1:TXOC):Pchar;cdecl;external;
{ display  }{ base_font_name_list  }{ missing_charset_list  }{ missing_charset_count  }{ def_string  }
function XCreateFontSet(para1:PDisplay; para2:Pchar; para3:PPPchar; para4:Plongint; para5:PPchar):TXFontSet;cdecl;external;
{ display  }{ font_set  }
procedure XFreeFontSet(para1:PDisplay; para2:TXFontSet);cdecl;external;
{ font_set  }{ font_struct_list  }{ font_name_list  }
function XFontsOfFontSet(para1:TXFontSet; para2:PPPXFontStruct; para3:PPPchar):longint;cdecl;external;
{ font_set  }
function XBaseFontNameListOfFontSet(para1:TXFontSet):Pchar;cdecl;external;
{ font_set  }
function XLocaleOfFontSet(para1:TXFontSet):Pchar;cdecl;external;
{ font_set  }
function XContextDependentDrawing(para1:TXFontSet):TBool;cdecl;external;
{ font_set  }
function XDirectionalDependentDrawing(para1:TXFontSet):TBool;cdecl;external;
{ font_set  }
function XContextualDrawing(para1:TXFontSet):TBool;cdecl;external;
{ font_set  }
function XExtentsOfFontSet(para1:TXFontSet):PXFontSetExtents;cdecl;external;
{ font_set  }{ text  }{ bytes_text  }
function XmbTextEscapement(para1:TXFontSet; para2:Pchar; para3:longint):longint;cdecl;external;
{ font_set  }{ text  }{ num_wchars  }
function XwcTextEscapement(para1:TXFontSet; para2:Pwchar_t; para3:longint):longint;cdecl;external;
{ font_set  }{ text  }{ bytes_text  }
function Xutf8TextEscapement(para1:TXFontSet; para2:Pchar; para3:longint):longint;cdecl;external;
{ font_set  }{ text  }{ bytes_text  }{ overall_ink_return  }{ overall_logical_return  }
function XmbTextExtents(para1:TXFontSet; para2:Pchar; para3:longint; para4:PXRectangle; para5:PXRectangle):longint;cdecl;external;
{ font_set  }{ text  }{ num_wchars  }{ overall_ink_return  }{ overall_logical_return  }
function XwcTextExtents(para1:TXFontSet; para2:Pwchar_t; para3:longint; para4:PXRectangle; para5:PXRectangle):longint;cdecl;external;
{ font_set  }{ text  }{ bytes_text  }{ overall_ink_return  }{ overall_logical_return  }
function Xutf8TextExtents(para1:TXFontSet; para2:Pchar; para3:longint; para4:PXRectangle; para5:PXRectangle):longint;cdecl;external;
{ font_set  }{ text  }{ bytes_text  }{ ink_extents_buffer  }{ logical_extents_buffer  }{ buffer_size  }{ num_chars  }{ overall_ink_return  }{ overall_logical_return  }
function XmbTextPerCharExtents(para1:TXFontSet; para2:Pchar; para3:longint; para4:PXRectangle; para5:PXRectangle; 
           para6:longint; para7:Plongint; para8:PXRectangle; para9:PXRectangle):TStatus;cdecl;external;
{ font_set  }{ text  }{ num_wchars  }{ ink_extents_buffer  }{ logical_extents_buffer  }{ buffer_size  }{ num_chars  }{ overall_ink_return  }{ overall_logical_return  }
function XwcTextPerCharExtents(para1:TXFontSet; para2:Pwchar_t; para3:longint; para4:PXRectangle; para5:PXRectangle; 
           para6:longint; para7:Plongint; para8:PXRectangle; para9:PXRectangle):TStatus;cdecl;external;
{ font_set  }{ text  }{ bytes_text  }{ ink_extents_buffer  }{ logical_extents_buffer  }{ buffer_size  }{ num_chars  }{ overall_ink_return  }{ overall_logical_return  }
function Xutf8TextPerCharExtents(para1:TXFontSet; para2:Pchar; para3:longint; para4:PXRectangle; para5:PXRectangle; 
           para6:longint; para7:Plongint; para8:PXRectangle; para9:PXRectangle):TStatus;cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ text_items  }{ nitems  }
procedure XmbDrawText(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
            para6:PXmbTextItem; para7:longint);cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ text_items  }{ nitems  }
procedure XwcDrawText(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
            para6:PXwcTextItem; para7:longint);cdecl;external;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ text_items  }{ nitems  }
procedure Xutf8DrawText(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
            para6:PXmbTextItem; para7:longint);cdecl;external;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ bytes_text  }
procedure XmbDrawString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pchar; para8:longint);cdecl;external;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ num_wchars  }
procedure XwcDrawString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pwchar_t; para8:longint);cdecl;external;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ bytes_text  }
procedure Xutf8DrawString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pchar; para8:longint);cdecl;external;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ bytes_text  }
procedure XmbDrawImageString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pchar; para8:longint);cdecl;external;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ num_wchars  }
procedure XwcDrawImageString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pwchar_t; para8:longint);cdecl;external;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ bytes_text  }
procedure Xutf8DrawImageString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pchar; para8:longint);cdecl;external;
{ dpy  }{ rdb  }{ res_name  }{ res_class  }
function XOpenIM(para1:PDisplay; para2:PXrmHashBucketRec; para3:Pchar; para4:Pchar):TXIM;cdecl;external;
{ im  }
function XCloseIM(para1:TXIM):TStatus;cdecl;external;
{ im  }function XGetIMValues(para1:TXIM; args:array of const):Pchar;cdecl;external;
function XGetIMValues(para1:TXIM):Pchar;cdecl;external;
{ im  }function XSetIMValues(para1:TXIM; args:array of const):Pchar;cdecl;external;
function XSetIMValues(para1:TXIM):Pchar;cdecl;external;
{ im  }
function XDisplayOfIM(para1:TXIM):PDisplay;cdecl;external;
{ im }
function XLocaleOfIM(para1:TXIM):Pchar;cdecl;external;
{ im  }function XCreateIC(para1:TXIM; args:array of const):TXIC;cdecl;external;
function XCreateIC(para1:TXIM):TXIC;cdecl;external;
{ ic  }
procedure XDestroyIC(para1:TXIC);cdecl;external;
{ ic  }
procedure XSetICFocus(para1:TXIC);cdecl;external;
{ ic  }
procedure XUnsetICFocus(para1:TXIC);cdecl;external;
{ ic  }
function XwcResetIC(para1:TXIC):Pwchar_t;cdecl;external;
{ ic  }
function XmbResetIC(para1:TXIC):Pchar;cdecl;external;
{ ic  }
function Xutf8ResetIC(para1:TXIC):Pchar;cdecl;external;
{ ic  }function XSetICValues(para1:TXIC; args:array of const):Pchar;cdecl;external;
function XSetICValues(para1:TXIC):Pchar;cdecl;external;
{ ic  }function XGetICValues(para1:TXIC; args:array of const):Pchar;cdecl;external;
function XGetICValues(para1:TXIC):Pchar;cdecl;external;
{ ic  }
function XIMOfIC(para1:TXIC):TXIM;cdecl;external;
{ event  }{ window  }
function XFilterEvent(para1:PXEvent; para2:TWindow):TBool;cdecl;external;
{ ic  }{ event  }{ buffer_return  }{ bytes_buffer  }{ keysym_return  }{ status_return  }
function XmbLookupString(para1:TXIC; para2:PXKeyPressedEvent; para3:Pchar; para4:longint; para5:PKeySym; 
           para6:PStatus):longint;cdecl;external;
{ ic  }{ event  }{ buffer_return  }{ wchars_buffer  }{ keysym_return  }{ status_return  }
function XwcLookupString(para1:TXIC; para2:PXKeyPressedEvent; para3:Pwchar_t; para4:longint; para5:PKeySym; 
           para6:PStatus):longint;cdecl;external;
{ ic  }{ event  }{ buffer_return  }{ bytes_buffer  }{ keysym_return  }{ status_return  }
function Xutf8LookupString(para1:TXIC; para2:PXKeyPressedEvent; para3:Pchar; para4:longint; para5:PKeySym; 
           para6:PStatus):longint;cdecl;external;
{unused }function XVaCreateNestedList(para1:longint; args:array of const):TXVaNestedList;cdecl;external;
function XVaCreateNestedList(para1:longint):TXVaNestedList;cdecl;external;
{ internal connections for IMs  }
{ dpy  }{ rdb  }{ res_name  }{ res_class  }{ callback  }{ client_data  }
function XRegisterIMInstantiateCallback(para1:PDisplay; para2:PXrmHashBucketRec; para3:Pchar; para4:Pchar; para5:TXIDProc; 
           para6:TXPointer):TBool;cdecl;external;
{ dpy  }{ rdb  }{ res_name  }{ res_class  }{ callback  }{ client_data  }
function XUnregisterIMInstantiateCallback(para1:PDisplay; para2:PXrmHashBucketRec; para3:Pchar; para4:Pchar; para5:TXIDProc; 
           para6:TXPointer):TBool;cdecl;external;
{ dpy  }{ client_data  }{ fd  }{ opening  }{ open or close flag  }
{ watch_data  }{ open sets, close uses  }
type

  TXConnectionWatchProc = procedure (para1:PDisplay; para2:TXPointer; para3:longint; para4:TBool; para5:PXPointer);cdecl;
{ dpy  }{ fd_return  }{ count_return  }

function XInternalConnectionNumbers(para1:PDisplay; para2:PPlongint; para3:Plongint):TStatus;cdecl;external;
{ dpy  }{ fd  }
procedure XProcessInternalConnection(para1:PDisplay; para2:longint);cdecl;external;
{ dpy  }{ callback  }{ client_data  }
function XAddConnectionWatch(para1:PDisplay; para2:TXConnectionWatchProc; para3:TXPointer):TStatus;cdecl;external;
{ dpy  }{ callback  }{ client_data  }
procedure XRemoveConnectionWatch(para1:PDisplay; para2:TXConnectionWatchProc; para3:TXPointer);cdecl;external;
{ name  }{ namelen  }{ data  }{ datalen  }
procedure XSetAuthorization(para1:Pchar; para2:longint; para3:Pchar; para4:longint);cdecl;external;
{ wstr  }{ str  }{ len  }
function _Xmbtowc(para1:Pwchar_t; para2:Pchar; para3:longint):longint;cdecl;external;
{ str  }{ wc  }
function _Xwctomb(para1:Pchar; para2:Twchar_t):longint;cdecl;external;
{ dpy  }{ cookie }
function XGetEventData(para1:PDisplay; para2:PXGenericEventCookie):TBool;cdecl;external;
{ dpy  }{ cookie }
procedure XFreeEventData(para1:PDisplay; para2:PXGenericEventCookie);cdecl;external;
{$ifdef __clang__}
(** unsupported pragma#pragma clang diagnostic pop*)
{$endif}
{$endif}
{ _X11_XLIB_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ConnectionNumber(dpy : longint) : longint;
begin
  ConnectionNumber:=(TXPrivDisplay(dpy))^.fd;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RootWindow(dpy,scr : longint) : longint;
begin
  RootWindow:=(ScreenOfDisplay(dpy,scr))^.root;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultScreen(dpy : longint) : longint;
begin
  DefaultScreen:=(TXPrivDisplay(dpy))^.default_screen;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultRootWindow(dpy : longint) : longint;
begin
  DefaultRootWindow:=(ScreenOfDisplay(dpy,DefaultScreen(dpy)))^.root;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultVisual(dpy,scr : longint) : longint;
begin
  DefaultVisual:=(ScreenOfDisplay(dpy,scr))^.root_visual;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultGC(dpy,scr : longint) : longint;
begin
  DefaultGC:=(ScreenOfDisplay(dpy,scr))^.default_gc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BlackPixel(dpy,scr : longint) : longint;
begin
  BlackPixel:=(ScreenOfDisplay(dpy,scr))^.black_pixel;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WhitePixel(dpy,scr : longint) : longint;
begin
  WhitePixel:=(ScreenOfDisplay(dpy,scr))^.white_pixel;
end;

{ was #define dname def_expr }
function AllPlanes : dword;
  begin
    AllPlanes:=dword( not (0));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function QLength(dpy : longint) : longint;
begin
  QLength:=(TXPrivDisplay(dpy))^.qlen;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayWidth(dpy,scr : longint) : longint;
begin
  DisplayWidth:=(ScreenOfDisplay(dpy,scr))^.width;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayHeight(dpy,scr : longint) : longint;
begin
  DisplayHeight:=(ScreenOfDisplay(dpy,scr))^.height;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayWidthMM(dpy,scr : longint) : longint;
begin
  DisplayWidthMM:=(ScreenOfDisplay(dpy,scr))^.mwidth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayHeightMM(dpy,scr : longint) : longint;
begin
  DisplayHeightMM:=(ScreenOfDisplay(dpy,scr))^.mheight;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayPlanes(dpy,scr : longint) : longint;
begin
  DisplayPlanes:=(ScreenOfDisplay(dpy,scr))^.root_depth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayCells(dpy,scr : longint) : longint;
begin
  DisplayCells:=(DefaultVisual(dpy,scr))^.map_entries;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ScreenCount(dpy : longint) : longint;
begin
  ScreenCount:=(TXPrivDisplay(dpy))^.nscreens;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ServerVendor(dpy : longint) : longint;
begin
  ServerVendor:=(TXPrivDisplay(dpy))^.vendor;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ProtocolVersion(dpy : longint) : longint;
begin
  ProtocolVersion:=(TXPrivDisplay(dpy))^.proto_major_version;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ProtocolRevision(dpy : longint) : longint;
begin
  ProtocolRevision:=(TXPrivDisplay(dpy))^.proto_minor_version;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VendorRelease(dpy : longint) : longint;
begin
  VendorRelease:=(TXPrivDisplay(dpy))^.release;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayString(dpy : longint) : longint;
begin
  DisplayString:=(TXPrivDisplay(dpy))^.display_name;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultDepth(dpy,scr : longint) : longint;
begin
  DefaultDepth:=(ScreenOfDisplay(dpy,scr))^.root_depth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultColormap(dpy,scr : longint) : longint;
begin
  DefaultColormap:=(ScreenOfDisplay(dpy,scr))^.cmap;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BitmapUnit(dpy : longint) : longint;
begin
  BitmapUnit:=(TXPrivDisplay(dpy))^.bitmap_unit;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BitmapBitOrder(dpy : longint) : longint;
begin
  BitmapBitOrder:=(TXPrivDisplay(dpy))^.bitmap_bit_order;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BitmapPad(dpy : longint) : longint;
begin
  BitmapPad:=(TXPrivDisplay(dpy))^.bitmap_pad;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ImageByteOrder(dpy : longint) : longint;
begin
  ImageByteOrder:=(TXPrivDisplay(dpy))^.byte_order;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NextRequest(dpy : longint) : longint;
begin
  NextRequest:=((TXPrivDisplay(dpy))^.request)+1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LastKnownRequestProcessed(dpy : longint) : longint;
begin
  LastKnownRequestProcessed:=(TXPrivDisplay(dpy))^.last_request_read;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ScreenOfDisplay(dpy,scr : longint) : longint;
begin
  ScreenOfDisplay:=@((TXPrivDisplay(dpy))^.(screens[scr]));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultScreenOfDisplay(dpy : longint) : longint;
begin
  DefaultScreenOfDisplay:=ScreenOfDisplay(dpy,DefaultScreen(dpy));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DisplayOfScreen(s : longint) : longint;
begin
  DisplayOfScreen:=s^.display;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RootWindowOfScreen(s : longint) : longint;
begin
  RootWindowOfScreen:=s^.root;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BlackPixelOfScreen(s : longint) : longint;
begin
  BlackPixelOfScreen:=s^.black_pixel;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WhitePixelOfScreen(s : longint) : longint;
begin
  WhitePixelOfScreen:=s^.white_pixel;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultColormapOfScreen(s : longint) : longint;
begin
  DefaultColormapOfScreen:=s^.cmap;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultDepthOfScreen(s : longint) : longint;
begin
  DefaultDepthOfScreen:=s^.root_depth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultGCOfScreen(s : longint) : longint;
begin
  DefaultGCOfScreen:=s^.default_gc;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DefaultVisualOfScreen(s : longint) : longint;
begin
  DefaultVisualOfScreen:=s^.root_visual;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WidthOfScreen(s : longint) : longint;
begin
  WidthOfScreen:=s^.width;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HeightOfScreen(s : longint) : longint;
begin
  HeightOfScreen:=s^.height;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WidthMMOfScreen(s : longint) : longint;
begin
  WidthMMOfScreen:=s^.mwidth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HeightMMOfScreen(s : longint) : longint;
begin
  HeightMMOfScreen:=s^.mheight;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PlanesOfScreen(s : longint) : longint;
begin
  PlanesOfScreen:=s^.root_depth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CellsOfScreen(s : longint) : longint;
begin
  CellsOfScreen:=(DefaultVisualOfScreen(s))^.map_entries;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MinCmapsOfScreen(s : longint) : longint;
begin
  MinCmapsOfScreen:=s^.min_maps;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MaxCmapsOfScreen(s : longint) : longint;
begin
  MaxCmapsOfScreen:=s^.max_maps;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DoesSaveUnders(s : longint) : longint;
begin
  DoesSaveUnders:=s^.save_unders;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DoesBackingStore(s : longint) : longint;
begin
  DoesBackingStore:=s^.backing_store;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EventMaskOfScreen(s : longint) : longint;
begin
  EventMaskOfScreen:=s^.root_input_mask;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XAllocID(dpy : longint) : longint;
begin
  XAllocID:=(TXPrivDisplay(dpy))^.resource_alloc(dpy);
end;


end.
