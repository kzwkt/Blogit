******  General Settings  ******
   *show Line Number:      File-->Settings-->Editor-->General-->Appearance
   *show Method Seprator:  File-->Settings-->Editor-->General-->Appearance
   *Auto Import:           File-->Settings-->Editor-->General-->Auto Import(select optimez import on the fly)
   *Show Quick Doc:        File > Settings > Editor > General and check Show quick documentation on mouse move
   *reOpen Last Project On StartUp: File-->Settings-->Appearances And Behaviour-->System Settings
      *** Issues ****
      Auto complete not Working with Small Letters:  File-->Settings-->Editor-->General-->Code Completion(set "case sensitive completion" to: "none")
    
******  Most Popular actions in Edit Files  ******

    *Search EveryWeher:       Shift+Shift
    *Find Mehtods and Files:  Ctrl+F12
    *generate popUp Menu:     Alt+Insert(Shift+G)
    *Collapse/Expand CodeBlk: Ctrl+Shift+Plus/Minus
    *class Hierarchey:        Ctrl+H
    *Generate Local Varialb:  CTRL+ALT+V(Alt+ENTER)
    *View Parameter Info:     CTRL+P
    *Call Hierarchy PopUp:    Ctrl+Alt+H
    *go to Refrence:          Ctrl+B
    *Expand/Shrink Selection: ctrl+w / ctrl+shift+w
    *Sourrond With:           ctrl+alt+t
    *Recencts:                ctrl+E
    *Live Template:           Ctrl+J
    *Last Edit Location:      Ctrl+Shift+BACKSPACE
    *Join Lines And Literals: Ctrl+Shift+J
    *Complete Statement:      Ctrl+Shift+ENTER
    *UnWrap/Remove:           Ctrl+Shift+DELETE
    *HighLight:               Ctrl+SHift+F7
    *Move Between Methods:    Alt+Up/Down
    *Quick Definition LookUp: Ctrl+Shift+I
    *BookMark:                F11
    *Find Actions:            Ctrl+Shift+A
    *Show Quick Fix Bulb:     ALT+ENTER
    
******  Most Popular Actions in Android Studio  ******
    *move Lines up:           Ctrl+Shift+Up
    *move Lines down:         Ctrl+Shift+Down
    *duplicate line:          Ctrl+D
    *delete line:             Ctrl+Y,Ctrl+X
    *column Selection:        Alt+Shif+Insert(Shift+I)
    
*****   Fix Some Bugs   *****
  when launching android studio 2.2 emulator got this error:
     libGL error: unable to load driver: i965_dri.so.
  Solved: 
    mv ~/Android/Sdk/tools/lib64/libstdc++/libstdc++.so.6{,.bak}
    mv ~/Android/Sdk/tools/lib64/libstdc++/libstdc++.so.6.0.18{,.bak}
    ln -s /usr/lib/libstdc++.so  ~/Android/Sdk/tools/lib64/libstdc++/