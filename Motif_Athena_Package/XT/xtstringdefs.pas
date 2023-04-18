
unit XTStringdefs;

interface

const
  libXt = 'libXt.so';

{ $Xorg: makestrs.c,v 1.6 2001/02/09 02:03:17 xorgcvs Exp $  }
{ This file is automatically generated.  }
{ Default ABI version -- Do not edit  }

const
  XtNaccelerators = 'accelerators';
  XtNallowHoriz = 'allowHoriz';
  XtNallowVert = 'allowVert';
  XtNancestorSensitive = 'ancestorSensitive';
  XtNbackground = 'background';
  XtNbackgroundPixmap = 'backgroundPixmap';
  XtNbitmap = 'bitmap';
  XtNborderColor = 'borderColor';
  XtNborder = 'borderColor';
  XtNborderPixmap = 'borderPixmap';
  XtNborderWidth = 'borderWidth';
  XtNcallback = 'callback';
  XtNchildren = 'children';
  XtNcolormap = 'colormap';
  XtNdepth = 'depth';
  XtNdestroyCallback = 'destroyCallback';
  XtNeditType = 'editType';
  XtNfile = 'file';
  XtNfont = 'font';
  XtNforceBars = 'forceBars';
  XtNforeground = 'foreground';
  XtNfunction = 'function';
  XtNheight = 'height';
  XtNhighlight = 'highlight';
  XtNhSpace = 'hSpace';
  XtNindex = 'index';
  XtNinitialResourcesPersistent = 'initialResourcesPersistent';
  XtNinnerHeight = 'innerHeight';
  XtNinnerWidth = 'innerWidth';
  XtNinnerWindow = 'innerWindow';
  XtNinsertPosition = 'insertPosition';
  XtNinternalHeight = 'internalHeight';
  XtNinternalWidth = 'internalWidth';
  XtNjumpProc = 'jumpProc';
  XtNjustify = 'justify';
  XtNknobHeight = 'knobHeight';
  XtNknobIndent = 'knobIndent';
  XtNknobPixel = 'knobPixel';
  XtNknobWidth = 'knobWidth';
  XtNlabel = 'label';
  XtNlength = 'length';
  XtNlowerRight = 'lowerRight';
  XtNmappedWhenManaged = 'mappedWhenManaged';
  XtNmenuEntry = 'menuEntry';
  XtNname = 'name';
  XtNnotify = 'notify';
  XtNnumChildren = 'numChildren';
  XtNorientation = 'orientation';
  XtNparameter = 'parameter';
  XtNpixmap = 'pixmap';
  XtNpopupCallback = 'popupCallback';
  XtNpopdownCallback = 'popdownCallback';
  XtNresize = 'resize';
  XtNreverseVideo = 'reverseVideo';
  XtNscreen = 'screen';
  XtNscrollProc = 'scrollProc';
  XtNscrollDCursor = 'scrollDCursor';
  XtNscrollHCursor = 'scrollHCursor';
  XtNscrollLCursor = 'scrollLCursor';
  XtNscrollRCursor = 'scrollRCursor';
  XtNscrollUCursor = 'scrollUCursor';
  XtNscrollVCursor = 'scrollVCursor';
  XtNselection = 'selection';
  XtNselectionArray = 'selectionArray';
  XtNsensitive = 'sensitive';
  XtNshown = 'shown';
  XtNspace = 'space';
  XtNstring = 'string';
  XtNtextOptions = 'textOptions';
  XtNtextSink = 'textSink';
  XtNtextSource = 'textSource';
  XtNthickness = 'thickness';
  XtNthumb = 'thumb';
  XtNthumbProc = 'thumbProc';
  XtNtop = 'top';
  XtNtranslations = 'translations';
  XtNunrealizeCallback = 'unrealizeCallback';
  XtNupdate = 'update';
  XtNuseBottom = 'useBottom';
  XtNuseRight = 'useRight';
  XtNvalue = 'value';
  XtNvSpace = 'vSpace';
  XtNwidth = 'width';
  XtNwindow = 'window';
  XtNx  ='x'+'';
  XtNy = 'y'+'';

  XtCAccelerators = 'Accelerators';
  XtCBackground = 'Background';
  XtCBitmap = 'Bitmap';
  XtCBoolean = 'Boolean';
  XtCBorderColor = 'BorderColor';
  XtCBorderWidth = 'BorderWidth';
  XtCCallback = 'Callback';
  XtCColormap = 'Colormap';
  XtCColor = 'Color';
  XtCCursor = 'Cursor';
  XtCDepth = 'Depth';
  XtCEditType = 'EditType';
  XtCEventBindings = 'EventBindings';
  XtCFile = 'File';
  XtCFont = 'Font';
  XtCForeground = 'Foreground';
  XtCFraction = 'Fraction';
  XtCFunction = 'Function';
  XtCHeight = 'Height';
  XtCHSpace = 'HSpace';
  XtCIndex = 'Index';
  XtCInitialResourcesPersistent = 'InitialResourcesPersistent';
  XtCInsertPosition = 'InsertPosition';
  XtCInterval = 'Interval';
  XtCJustify = 'Justify';
  XtCKnobIndent = 'KnobIndent';
  XtCKnobPixel = 'KnobPixel';
  XtCLabel = 'Label';
  XtCLength = 'Length';
  XtCMappedWhenManaged = 'MappedWhenManaged';
  XtCMargin = 'Margin';
  XtCMenuEntry = 'MenuEntry';
  XtCNotify = 'Notify';
  XtCOrientation = 'Orientation';
  XtCParameter = 'Parameter';
  XtCPixmap = 'Pixmap';
  XtCPosition = 'Position';
  XtCReadOnly = 'ReadOnly';
  XtCResize = 'Resize';
  XtCReverseVideo = 'ReverseVideo';
  XtCScreen = 'Screen';
  XtCScrollProc = 'ScrollProc';
  XtCScrollDCursor = 'ScrollDCursor';
  XtCScrollHCursor = 'ScrollHCursor';
  XtCScrollLCursor = 'ScrollLCursor';
  XtCScrollRCursor = 'ScrollRCursor';
  XtCScrollUCursor = 'ScrollUCursor';
  XtCScrollVCursor = 'ScrollVCursor';
  XtCSelection = 'Selection';
  XtCSensitive = 'Sensitive';
  XtCSelectionArray = 'SelectionArray';
  XtCSpace = 'Space';
  XtCString = 'String';
  XtCTextOptions = 'TextOptions';
  XtCTextPosition = 'TextPosition';
  XtCTextSink = 'TextSink';
  XtCTextSource = 'TextSource';
  XtCThickness = 'Thickness';
  XtCThumb = 'Thumb';
  XtCTranslations = 'Translations';
  XtCValue = 'Value';
  XtCVSpace = 'VSpace';
  XtCWidth = 'Width';
  XtCWindow = 'Window';
  XtCX = 'X' + '';
  XtCY = 'Y' + '';
  XtRAcceleratorTable = 'AcceleratorTable';

const
  XtRAtom = 'Atom';

const
  XtRBitmap = 'Bitmap';
  XtRBool = 'Bool';
  XtRBoolean = 'Boolean';
  XtRCallback = 'Callback';
  XtRCallProc = 'CallProc';
  XtRCardinal = 'Cardinal';
  XtRColor = 'Color';
  XtRColormap = 'Colormap';
  XtRCursor = 'Cursor';
  XtRDimension = 'Dimension';
  XtRDisplay = 'Display';
  XtREditMode = 'EditMode';
  XtREnum = 'Enum';
  XtRFile = 'File';
  XtRFloat = 'Float';
  XtRFont = 'Font';
  XtRFontStruct = 'FontStruct';
  XtRFunction = 'Function';
  XtRGeometry = 'Geometry';
  XtRImmediate = 'Immediate';
  XtRInitialState = 'InitialState';
  XtRInt = 'Int';
  XtRJustify = 'Justify';
  XtRLongBoolean = 'Bool';
  XtRObject = 'Object';
  XtROrientation = 'Orientation';
  XtRPixel = 'Pixel';
  XtRPixmap = 'Pixmap';
  XtRPointer = 'Pointer';
  XtRPosition = 'Position';
  XtRScreen = 'Screen';
  XtRShort = 'Short';
  XtRString = 'String';
  XtRStringArray = 'StringArray';
  XtRStringTable = 'StringTable';
  XtRUnsignedChar = 'UnsignedChar';
  XtRTranslationTable = 'TranslationTable';
  XtRVisual = 'Visual';
  XtRWidget = 'Widget';
  XtRWidgetClass = 'WidgetClass';
  XtRWidgetList = 'WidgetList';
  XtRWindow = 'Window';
  XtEoff = 'off';
  XtEfalse = 'false';
  XtEno = 'no';
  XtEon = 'on';
  XtEtrue = 'true';
  XtEyes = 'yes';
  XtEvertical = 'vertical';
  XtEhorizontal = 'horizontal';
  XtEtextRead = 'read';
  XtEtextAppend = 'append';
  XtEtextEdit = 'edit';
  XtExtdefaultbackground = 'xtdefaultbackground';
  XtExtdefaultforeground = 'xtdefaultforeground';
  XtExtdefaultfont = 'xtdefaultfont';
  XtNfontSet = 'fontSet';
  XtRFontSet = 'FontSet';
  XtCFontSet = 'FontSet';
  XtRGravity = 'Gravity';
  XtNcreateHook = 'createHook';
  XtNchangeHook = 'changeHook';
  XtNconfigureHook = 'configureHook';
  XtNgeometryHook = 'geometryHook';
  XtNdestroyHook = 'destroyHook';
  XtNshells = 'shells';
  XtNnumShells = 'numShells';
  XtRCommandArgArray = 'CommandArgArray';
  XtRDirectoryString = 'DirectoryString';
  XtREnvironmentArray = 'EnvironmentArray';
  XtRRestartStyle = 'RestartStyle';
  XtRSmcConn = 'SmcConn';
  XtHcreate = 'Xtcreate';
  XtHsetValues = 'XtsetValues';
  XtHmanageChildren = 'XtmanageChildren';
  XtHunmanageChildren = 'XtunmanageChildren';
  XtHmanageSet = 'XtmanageSet';
  XtHunmanageSet = 'XtunmanageSet';
  XtHrealizeWidget = 'XtrealizeWidget';
  XtHunrealizeWidget = 'XtunrealizeWidget';
  XtHaddCallback = 'XtaddCallback';
  XtHaddCallbacks = 'XtaddCallbacks';
  XtHremoveCallback = 'XtremoveCallback';
  XtHremoveCallbacks = 'XtremoveCallbacks';
  XtHremoveAllCallbacks = 'XtremoveAllCallbacks';
  XtHaugmentTranslations = 'XtaugmentTranslations';
  XtHoverrideTranslations = 'XtoverrideTranslations';
  XtHuninstallTranslations = 'XtuninstallTranslations';
  XtHsetKeyboardFocus = 'XtsetKeyboardFocus';
  XtHsetWMColormapWindows = 'XtsetWMColormapWindows';
  XtHsetMappedWhenManaged = 'XtsetMappedWhenManaged';
  XtHmapWidget = 'XtmapWidget';
  XtHunmapWidget = 'XtunmapWidget';
  XtHpopup = 'Xtpopup';
  XtHpopupSpringLoaded = 'XtpopupSpringLoaded';
  XtHpopdown = 'Xtpopdown';
  XtHconfigure = 'Xtconfigure';
  XtHpreGeometry = 'XtpreGeometry';
  XtHpostGeometry = 'XtpostGeometry';
  XtHdestroy = 'Xtdestroy';

var
  XtShellStrings : Pchar;cvar;external libXt;

implementation

end.
