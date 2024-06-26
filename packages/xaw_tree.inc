/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



{*****************************************************************************
 *
 * Tree Widget (subclass of ConstraintClass)
 *
 ******************************************************************************
 *
 * Parameters:
 *
 *  Name                Class              Type            Default
 *  ----                -----              ----            -------
 *
 *  autoReconfigure     AutoReconfigure    Boolean         FALSE
 *  background          Background         Pixel           XtDefaultBackground
 *  foreground          Foreground         Pixel           XtDefaultForeground
 *  gravity             Gravity            XtGravity       West
 *  hSpace              HSpace             Dimension       20
 *  lineWidth           LineWidth          Dimension       0
 *  vSpace              VSpace             Dimension       6
 *
 *
 * Constraint Resources attached to children:
 *
 *  treeGC              TreeGC             GC              NULL
 *  treeParent          TreeParent         Widget          NULL
 *
 *
 **************************************************************************** }
{ new instance field names  }

const
  XtNhSpace = 'hSpace';  
  XtNvSpace = 'vSpace';  
  XtCHSpace = 'HSpace';  
  XtCVSpace = 'VSpace';  

const
  XtNautoReconfigure = 'autoReconfigure';  
  XtNlineWidth = 'lineWidth';  
  XtNtreeGC = 'treeGC';  
  XtNtreeParent = 'treeParent';  
  XtNgravity = 'gravity';  
{ new class field names  }
  XtCAutoReconfigure = 'AutoReconfigure';  
  XtCLineWidth = 'LineWidth';  
  XtCTreeGC = 'TreeGC';  
  XtCTreeParent = 'TreeParent';  
  XtCGravity = 'Gravity';  
  XtRGC = 'GC';  

//const
//  XawNdisplayList = 'displayList';  

//const
//  XawCDisplayList = 'DisplayList';  

//const
//  XawRDisplayList = 'XawDisplayList';  
{ external declarations  }
  var
    treeWidgetClass : TWidgetClass;cvar;external libXaw;

//type
//  PTreeWidgetClass = ^TTreeWidgetClass;
//  TTreeWidgetClass = PTreeClassRec;
//
//  PTreeWidget = ^TTreeWidget;
//  TTreeWidget = PTreeRec;

procedure XawTreeForceLayout(tree:TWidget);cdecl;external libXaw;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
