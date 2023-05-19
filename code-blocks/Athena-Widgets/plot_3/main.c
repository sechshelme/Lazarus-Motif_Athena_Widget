#include <stdio.h>
#include <plot.h>
#include <math.h>
#define SIZE 100.0   /* nominal size of user coordinate frame */
#define EXPAND 2.2   /* expansion factor for elliptical box */

void draw_boxed_string (char *s, double size, double angle)
{
  double true_size, width;

  pl_ftextangle (angle);         /* text inclination angle (degrees) */
  true_size = pl_ffontsize (size);  /* choose font size */
  width = pl_flabelwidth (s);    /* compute width of text string */
  pl_fellipserel (0.0, 0.0,      /* draw surrounding ellipse */
               EXPAND * 0.5 * width, EXPAND * 0.5 * true_size, angle);
  pl_alabel ('c', 'c', s);       /* draw centered text string */
}

int main()
{
  int handle, i;

  /* set a Plotter parameter */
  pl_parampl ("PAGESIZE", "letter");

  /* create a Postscript Plotter that writes to standard output */
  if ((handle = pl_newpl ("ps", stdin, stdout, stderr)) < 0)
    {
      fprintf (stderr, "Couldn't create Plotter\n");
      return 1;
    }
  pl_selectpl (handle);         /* select the Plotter for use */

  if (pl_openpl () < 0)         /* open Plotter */
    {
      fprintf (stderr, "Couldn't open Plotter\n");
      return 1;
    }
  pl_fspace (-(SIZE), -(SIZE), SIZE, SIZE); /* spec. user coor system */
  pl_pencolorname ("blue");     /* pen color will be blue */
  pl_fillcolorname ("white");
  pl_filltype (1);              /* ellipses will be filled with white */
  pl_fontname ("NewCenturySchlbk-Roman"); /* choose a Postscript font */

  for (i = 80; i > 1; i--)      /* loop through angles */
    {
      double theta, radius;

      theta = 0.5 * (double)i;  /* theta is in radians */
      radius = SIZE / pow (theta, 0.35);  /* this yields a spiral */
      pl_fmove (radius * cos (theta), radius * sin (theta));
      draw_boxed_string ("GNU libplot!", 0.04 * radius,
                          (180.0 * theta / M_PI) - 90.0);
    }

  if (pl_closepl () < 0)        /* close Plotter */
    {
      fprintf (stderr, "Couldn't close Plotter\n");
      return 1;
    }
  pl_selectpl (0);
  if (pl_deletepl (handle) < 0) /* delete Plotter we used */
    {
      fprintf (stderr, "Couldn't delete Plotter\n");
      return 1;
    }
  return 0;
}
