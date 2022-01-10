# Simple lua plugin for [xournal++](https://github.com/xournalpp/xournalpp)

This is a simple xournal++ plugin that integrates work from [Ben Smith](https://github.com/ave-63/xournal-keys) and [Roland Lötscher](https://github.com/xournalpp/xournalpp/tree/master/plugins/ColorCycle). I just used their lua setups and added a few key bindings to easily select colors with digit keys. So, the merit is fully theirs.

To install, follow the instructions at https://xournalpp.github.io/guide/plugins/plugins/ 

# Quick recipe to use and activate the plugin conf

1. Install LUA
   - This should be easy in any GNU/Linux box
   - In windows, you can follow https://www.youtube.com/watch?v=4lRVNiFt130 (you only have to follo the process up to minute 3:00 or so). Remember to get the binaries for the 64-bit or 32-bit version. In the video you will see that it unzips the zip into a directory, renames luaXX.exe to lua.exe and then adds that directory to the system path.

2. Install configuration

   1. Copy the files in this repository in a directory under (you can use any name for this directory, e.g. `xournal-jmg`):
      - /usr/share/xournalpp/plugins/ in GNU/Linux machines 
      - C:\Program Files\Xournal++\share\xournalpp\plugins\ in Windows boxes
      - Contents/Resources/plugins inside the Xournal++.app package in MacOS

   2. Start Xournal++
   3. Go to "Plugin Menu | Plugin Manager" and in the list you will see at the bottom an entry for `xournal-jmg` (or any name you used for the directory under which you copied the files). Mark the checkbox and accept that dialog box.
   4. Exit xournal++ and start it up again
   5. That's it
   
I use the "Toolbar left" layout and there you will see the color bar vertically, where I have defined the numeric keybindings following the sequence in which they are placed. I'm not sure what sequence your version of Xournal++ has defined, but with 1.1.0+dev it should fine (the color order in the toolbar changed from 1.1.0).  If it is not the good sequence or you want to change it for another one that you like more, you can simply modify the main.lua file (you'll find it very easy to do).
