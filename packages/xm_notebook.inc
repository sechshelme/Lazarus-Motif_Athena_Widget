/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



var
    xmNotebookWidgetClass : TWidgetClass;cvar;external libXm;

type
//  PXmNotebookWidgetClass = ^TXmNotebookWidgetClass;
//  TXmNotebookWidgetClass = PXmNotebookClassRec;
//
//  PXmNotebookWidget = ^TXmNotebookWidget;
//  TXmNotebookWidget = PXmNotebookRec;

{***********************************************************************
 *  Notebook Defines
 *********************************************************************** }
{ XmNotebookPageStatus  }
{ page widget found  }
{ page number out of the range  }
{ no page widget found  }
{ there are more than one page widgets  }

  PXmNotebookPageStatus = ^TXmNotebookPageStatus;
  TXmNotebookPageStatus =  Longint;
  Const
    XmPAGE_FOUND = 0;
    XmPAGE_INVALID = 1;
    XmPAGE_EMPTY = 2;
    XmPAGE_DUPLICATED = 3;

{ Notebook page information structure  }
type
  PXmNotebookPageInfo = ^TXmNotebookPageInfo;
  TXmNotebookPageInfo = record
      page_number : longint;
      page_widget : TWidget;
      status_area_widget : TWidget;
      major_tab_widget : TWidget;
      minor_tab_widget : TWidget;
    end;
{***********************************************************************
 *  Public Functions
 *********************************************************************** }

function XmIsNotebook(w : TWidget) : TBoolean;

function XmCreateNotebook(parent:TWidget; name:TXtString; arglist:TArgList; argcount:TCardinal):TWidget;cdecl;external libXm;
function XmNotebookGetPageInfo(notebook:TWidget; page_number:longint; page_info:PXmNotebookPageInfo):TXmNotebookPageStatus;cdecl;external libXm;
//function XmVaCreateNotebook(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateNotebook(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;
//function XmVaCreateManagedNotebook(parent:TWidget; name:Pchar; args:array of const):TWidget;cdecl;external libXm;
function XmVaCreateManagedNotebook(parent:TWidget; name:Pchar):TWidget;cdecl; varargs external libXm;

{ _XmNotebook_h   }

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsNotebook(w: TWidget): TBoolean;
begin
  XmIsNotebook:=XtIsSubclass(w,xmNotebookWidgetClass);
end;


{$ENDIF read_implementation}
