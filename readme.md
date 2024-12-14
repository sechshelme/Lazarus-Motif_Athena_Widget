# FPC X11 Tutorial
## Einleitung:
Die Unit **Xaw** oder **Xm** muss immer **vor** der Unit **XT** deklariert sein ! Ansonsten wird das Fenster nicht aktiv.

## Externe Beispiele:
Diese sind alle in C/C++
- [Rheinwerk openbook - Linux Programmierung Kapitel 14](https://openbook.rheinwerk-verlag.de/linux_unix_programmierung/Kap14-007.htm) (DE)
- [Programmieren mit der Xlib](http://eggdrop.ch/texts/xlib/) (DE)
- [The X Window system](https://tronche.com/gui/x)
- [Xlib - C Language X Interface](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html)
- [Xlib tutorial](http://xopendisplay.hilltopia.ca/2009/Jan/Xlib-tutorial-part-1----Beginnings.html)
- [Cours X-Window/MOTIF](http://users.polytech.unice.fr/~buffa/cours/X11_Motif/cours/) (FR)
- [X11 OpenGL Window](https://github.com/gamedevtech/X11OpenGLWindow)
- [Mesa Demos](https://github.com/JoakimSoderberg/mesademos)

## Hintergrundwissen von X11
- [X Window System](http://x11.gweb.info/index.html)
- [The X Window system](https://tronche.com/gui/x)

## Tool für X, welche vonrinstalliert sind
- [Tools von Linux/X11](xtool.md)

## X-Client auf einem Windows-PC mit SSH
- [Anleitung](SSH-Server_einrichten.md)

## Neuerungen:

| Datum | Änderungen 
| :---: | ---
| 14.12.2024 | Includes in einzelne Ordner ausgelagert
| 16.04.2024 | Include anstelle von Units
| 02.04.2023 | Package **Motif Widgets** erstellt
| 20.03.2023 | Erste Gehversuche mit **Motif Widgets**
| 18.03.2023 | Package **Athen Widgets** ersellt
| 10.03.2023 | Erste Gehversuche mit **Athena Widgets**

<img src="image.png">

## Zusätliche XToolKit Widget
- (https://sourceforge.net/projects/sf-xpaint/files/libxaw3dxft/)

## Infos zu benötigten Paketen
- (https://tronche.com/gui/x/xlib/introduction/header.html)

## Sourcen Pakete Quellen von X11
### x11proto
- (https://github.com/freedesktop/xorg-x11proto.git)
- (https://cgit.freedesktop.org/xorg/proto/xorgproto)

### libx
- (https://github.com/freedesktop/xorg-libX11)
- (https://cgit.freedesktop.org/xorg/lib/libx)

### lixXt XToolkit Extension
- (https://github.com/freedesktop/xorg-libXt)
- (https://cgit.freedesktop.org/xorg/lib/libXt)

### libXaw Athena Widget
- (https://github.com/freedesktop/xorg-libXaw)
- (https://cgit.freedesktop.org/xorg/lib/libXaw)

### libXaw Athena Widget 3D
- (https://github.com/freedesktop/xorg-libXaw3d)
- (https://cgit.freedesktop.org/xorg/lib/libXaw3d)

## Open-Motif Widget
- (https://sourceforge.net/projects/motif/files/)
- (https://sourceforge.net/p/motif/code/ci/master/tree/)

```
sudo apt install libmotif-dev
```

### libXmu
- (https://github.com/freedesktop/libXmu)
- (http://cgit.freedesktop.org/xorg/lib/libXmu)

# Klassische motif Anwendungen

## Nostalgie Editot ( neditk )
Sourcen: (https://sourceforge.net/projects/nedit/)
```
apt install nedit 
```


## Nostalgie Desktop ( tkdesk )
Sourcen: (https://tkdesk.sourceforge.net)
```
apt install tkdesk 
```

# Sonstige Widgets Set
## FLTK
- https://www.fltk.org/
- https://www.fltk.org/doc-2.0/html/example1.html
- https://github.com/fltk/fltk

### Linux
```bash
cmake -S .. -B . 
```

### Windows
```bash
cmake -S .. -B . -DCMAKE_CXX_COMPILER="/usr/bin/x86_64-w64-mingw32-g++" -DCMAKE_C_COMPILER="/usr/bin/x86_64-w64-mingw32-gcc" -DCMAKE_RC_COMPILER="/usr/bin/x86_64-w64-mingw32-windres" -DCMAKE_FIND_ROOT_PATH="/usr/x86_64-w64-mingw32" -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" -DCMAKE_SYSTEM_NAME="Windows"
```



# Schlagwörter
Lazarus fpc pascal XToolkit Toolkit libx x11 xserver linux Athena Widget Modif Motif OpenMotif











