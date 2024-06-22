
// g++ hello.cpp -o hello -lfltk


#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Text_Display.H>
int main() {
   Fl_Text_Display::Style_Table_Entry stable[] = {
       {  FL_GREEN,         FL_COURIER, 8 }, // A - Red
       {  FL_DARK_YELLOW, FL_COURIER, 18 }, // B - Yellow
       {  FL_DARK_GREEN,  FL_COURIER, 28 }, // C - Green
       {  FL_BLUE,        FL_COURIER, 38 }, // D - Blue
   };
   Fl_Window *win = new Fl_Window(640, 480, "Simple Text Display With Colors");
   Fl_Text_Display *disp = new Fl_Text_Display(20, 20, 640-40, 480-40);
   Fl_Text_Buffer *tbuff = new Fl_Text_Buffer();	// text buffer
   Fl_Text_Buffer *sbuff = new Fl_Text_Buffer();	// style buffer
   disp->buffer(tbuff);
   int stable_size = sizeof(stable)/sizeof(stable[0]);	// # entries in style table (4)
   disp->highlight_data(sbuff, stable, stable_size, 'A', 0, 0);
   // Text
   tbuff->text("Red Line 1\nYel Line 2\nGrn Line 3\nBlu Line 4\nRed Line 5\nYel Line 6\nGrn Line 7\nBlu Line 8\n");
   // Style for text
   sbuff->text("AAAAAAAAAA\nBBBBBBBBBB\nCCCCCCCCCC\nDDDDDDDDDD\nAAAAAAAAAA\nBBBBBBBBBB\nCCCCCCCCCC\nDDDDDDDDDD\n");
   win->resizable(*disp);
   win->show();
   return(Fl::run());
}

