/* rendered_list.c: illustrates all the features of
** render tables and renditions by creating a
** multi-column, multi-font, multi-color List widget.
*/
#include <Xm/Xm.h>
#include <Xm/RowColumn.h>
#include <Xm/List.h>
/* ConvertStringToPixel()
** A utility function to convert a color name to a Pixel
*/
Pixel ConvertStringToPixel (Widget widget, char *name)
{
    XrmValue from_value, to_value; /* For resource conversion */
    from_value.addr = name;
    from_value.size = strlen(name) + 1;
    to_value.addr = NULL;
    XtConvertAndStore (widget,
                       XmRString, &from_value,
                       XmRPixel, &to_value);
    if (to_value.addr)
    {
        return (*((Pixel*) to_value.addr));
    }
    return XmUNSPECIFIED_PIXEL;
}
/*
** A convenient structure to hold the data
** for creating various renditions
*/
typedef struct RenditionData_s
{
    char *tag;
    char *color;
    char *font;
} RenditionData_t;
#define MAX_COLUMNS 4
RenditionData_t rendition_data[MAX_COLUMNS] =
{
    { "one", "red", "fixed" },
    {
        "two", "green",
        "ghfgh"
    },
    { "three", "blue", "bembo-bold" },
    {
        "four", "orange",
        "-adobe-*-medium-i-normal--24-240-75-75-*-*-iso8859-1"
    }
};
/*
** Arbitrary data to display in the List
*/
static char *poem[] =
{
    "Mary", "had a", "little", "lamb",
    "Its", "fleece", "was white", "as snow",
    "And", "everywhere that", "Mary", "went",
    "The", "lamb was", "sure", "to follow",
    (char *) 0
};
/*
** CreateListData(): routine to convert the
** poem into an array of compound strings
*/
XmStringTable CreateListData (int *count)
{
    XmStringTable table = (XmStringTable) 0;
    int line = 0;
    int column = 0;
    int index = 0;
    XmString entry = (XmString) 0;
    XmString row = (XmString) 0;
    XmString tmp = (XmString) 0;
    XmString tab;
    tab = XmStringComponentCreate (XmSTRING_COMPONENT_TAB, NULL, 0);
    while (poem

            != (char *) 0)   /* create a compound string, using the rendition tag */
    {
        entry = XmStringGenerate ((XtPointer) poem, NULL, XmCHARSET_TEXT, rendition_data[column].tag);
        if (row != (XmString) 0)
        {
            tmp = XmStringConcat (row, tab);
            XmStringFree (row);
            row = XmStringConcatAndFree (tmp, entry);
        }
        else
        {
            row = entry;
        }
        ++column;
        if (column == MAX_COLUMNS)
        {
            if (table == (XmStringTable) 0)
            {
                table = (XmStringTable) XtMalloc ((unsigned) sizeof (XmString));
            }
            else
            {
                table = (XmStringTable) XtRealloc ((char *) table, (unsigned) (line + 1) * sizeof (XmString));
            }
            table[line++] = row;
            row = (XmString) 0;
            column = 0;
        }
        index++;
    }
    XmStringFree (tab);
    table[line] = (XmString) 0;
    *count = line;
    return table;
}


main (int argc, char *argv[])
{
    Widget toplevel, rowcol, list;
    XtAppContext app;
    Arg args[10];
    XmTab tabs[MAX_COLUMNS];
    XmTabList tablist;
    XmRendition renditions[MAX_COLUMNS];
    XmRenderTable rendertable;
    XmStringTable xmstring_table;
    int xmstring_count;
    Pixel pixels[MAX_COLUMNS];
    int n, i;
    XtSetLanguageProc (NULL, NULL, NULL);
    toplevel = XtVaOpenApplication (&app, "Demos", NULL, 0, &argc, argv, NULL, sessionShellWidgetClass, NULL);
    rowcol = XmCreateRowColumn (toplevel, "rowcol", NULL, 0);  /* Create some colors */ for (i = 0; i < MAX_COLUMNS; i++)
    {
        pixels[i] = ConvertStringToPixel (toplevel, rendition_data[i].color);
    }  /* Create tab stops for columnar output */ for (i = 0; i < MAX_COLUMNS; i++)
    {
        tabs[i] = XmTabCreate ((float) 1.5, XmINCHES, ((i == 0) ? XmABSOLUTE : XmRELATIVE), XmALIGNMENT_BEGINNING, ".");
    }  /* Create a tablist table which contains the tabs */ tablist = XmTabListInsertTabs (NULL, tabs, XtNumber (tabs), 0);
    /* Create some multi-font/color renditions, and use the tablist */
    /* This will be inherited if we use it on the first rendition */
    for (i = 0; i < MAX_COLUMNS; i++)
    {
        n = 0;
        if (i == 0)
        {
            XtSetArg (args[n], XmNtabList, tablist);
            n++;
        }
        XtSetArg (args[n], XmNrenditionForeground, pixels[i]);
        n++;
        XtSetArg (args[n], XmNfontName, rendition_data[i].font);
        n++;
        XtSetArg (args[n], XmNfontType, XmFONT_IS_FONT);
        n++;
        renditions[i] = XmRenditionCreate (toplevel, rendition_data[i].tag, args, n);
    }  /* Create the Render Table */

    rendertable = XmRenderTableAddRenditions ( NULL, renditions, XtNumber (renditions), XmMERGE_NEW);
    /* Create the multi-column data for the list */
    xmstring_table = CreateListData (&xmstring_count);  /* Create the List, using the render table */
    n = 0;
    XtSetArg (args[n], XmNrenderTable, rendertable);
    n++;
    XtSetArg (args[n], XmNitems, xmstring_table);
    n++;
    XtSetArg (args[n], XmNitemCount, xmstring_count);
    n++;
    XtSetArg (args[n], XmNwidth, 400);
    n++;
    XtSetArg (args[n], XmNvisibleItemCount, xmstring_count + 1);
    n++;
    list = XmCreateScrolledList (rowcol, "list", args, n);
    XtManageChild (list);  /* Free the memory now the widget has the data */ /* First, the compound strings */

    for (i = 0; i < xmstring_count; i++) XmStringFree (xmstring_table[i]);
    XtFree ((char *) xmstring_table);  /* Secondly, the XmTab objects */
    for (i = 0; i < XtNumber (tabs); i++) XmTabFree (tabs[i]);  /* Thirdly, the XmTabList object */
    XmTabListFree (tablist);  /* Fourthly, the XmRendition objects */
    for (i = 0; i < XtNumber (renditions); i++) XmRenditionFree (renditions[i]);  /* Lastly, the XmRenderTable object */
    XmRenderTableFree (rendertable);
    XtManageChild (rowcol);
    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}
