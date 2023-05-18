 #include <stdio.h>
     #include <plot.h>

     int main ()
     {
       plPlotter *plotter;
       plPlotterParams *plotter_params;
       int i = 0, j;

       /* set Plotter parameters */
       plotter_params = pl_newplparams ();
       pl_setplparam (plotter_params, "BITMAPSIZE", "300x150");
       pl_setplparam (plotter_params, "VANISH_ON_DELETE", "yes");
       pl_setplparam (plotter_params, "USE_DOUBLE_BUFFERING", "yes");

       /* create an X Plotter with the specified parameters */
       if ((plotter = pl_newpl_r ("X", stdin, stdout, stderr,
                                  plotter_params)) == NULL)
         {
           fprintf (stderr, "Couldn't create Plotter\n");
           return 1;
         }

       if (pl_openpl_r (plotter) < 0)         /* open Plotter */
         {
           fprintf (stderr, "Couldn't open Plotter\n");
           return 1;
         }
       pl_fspace_r (plotter,
                    -0.5, -0.5, 299.5, 149.5);  /* set user coor system */
       pl_linewidth_r (plotter, 8);           /* set line thickness */
       pl_filltype_r (plotter, 1);            /* objects will be filled */
       pl_bgcolorname_r (plotter, "saddle brown"); /* set background color */
       for (j = 0; j < 300; j++)
         {
           pl_erase_r (plotter);                 /* erase window */
           pl_pencolorname_r (plotter, "red");   /* use red pen */
           pl_fillcolorname_r (plotter, "cyan"); /* use cyan filling */
           pl_ellipse_r (plotter, i, 75, 35, 50, i);  /* draw an ellipse */
           pl_colorname_r (plotter, "black"); /* use black pen and filling */
           pl_circle_r (plotter, i, 75, 12);  /* draw a circle [the pupil] */
           i = (i + 2) % 300;                 /* shift rightwards */
         }
       if (pl_closepl_r (plotter) < 0)        /* close Plotter */
         {
           fprintf (stderr, "Couldn't close Plotter\n");
           return 1;
         }

       if (pl_deletepl_r (plotter) < 0)       /* delete Plotter */
         {
           fprintf (stderr, "Couldn't delete Plotter\n");
           return 1;
         }
       return 0;
     }
