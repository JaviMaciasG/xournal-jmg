-- Register all Toolbar actions and intialize all UI stuff
function initUi()
  -- From xournal-keys by Ben Smith -- START
  app.registerUi({["menu"] = "Pen", ["callback"] = "pen", ["accelerator"] = "p"});
  app.registerUi({["menu"] = "Eraser", ["callback"] = "eraser", ["accelerator"] = "e"});
  --  app.registerUi({["menu"] = "Select Region", ["callback"] = "lasso", ["accelerator"] = "g"});
  --  app.registerUi({["menu"] = "Highlighter", ["callback"] = "highlighter", ["accelerator"] = "<Shift>f"});
  --  app.registerUi({["menu"] = "Undo", ["callback"] = "undo", ["accelerator"] = "r"});
  --  app.registerUi({["menu"] = "Redo", ["callback"] = "redo", ["accelerator"] = "<Shift>r"});
  --  app.registerUi({["menu"] = "Copy", ["callback"] = "copy", ["accelerator"] = "c"});
  --  app.registerUi({["menu"] = "Paste", ["callback"] = "paste", ["accelerator"] = "v"});
  --  app.registerUi({["menu"] = "Cut", ["callback"] = "cut", ["accelerator"] = "x"});
  --  app.registerUi({["menu"] = "Delete", ["callback"] = "delete", ["accelerator"] = "t"});
  --  app.registerUi({["menu"] = "Ruler", ["callback"] = "ruler", ["accelerator"] = "w"});
  -- From xournal-keys by Ben Smith -- END
  -- From ColorCycle by Roland Lötscher -- START
  -- app.registerUi({["menu"] = "Cycle through color list", ["callback"] = "cycle", ["accelerator"] = "<Alt>c"});
  -- if you want to have multiple color lists you must use the app.registerUi function multiple times
  -- with different callback functions and accelerators
  -- From ColorCycle by Roland Lötscher -- END
  -- JMG: My color selection
  app.registerUi({["menu"] = "White",      ["callback"] = "white",      ["accelerator"] = "0"});
  app.registerUi({["menu"] = "White",      ["callback"] = "white",      ["accelerator"] = "KP_0"});
  app.registerUi({["menu"] = "Yellow",     ["callback"] = "yellow",     ["accelerator"] = "1"});
  app.registerUi({["menu"] = "Yellow",     ["callback"] = "yellow",     ["accelerator"] = "KP_1"});
  app.registerUi({["menu"] = "Orange",     ["callback"] = "orange",     ["accelerator"] = "2"});
  app.registerUi({["menu"] = "Orange",     ["callback"] = "orange",     ["accelerator"] = "KP_2"});
  app.registerUi({["menu"] = "Magenta",    ["callback"] = "magenta",    ["accelerator"] = "3"});
  app.registerUi({["menu"] = "Magenta",    ["callback"] = "magenta",    ["accelerator"] = "KP_3"});
  app.registerUi({["menu"] = "LightGreen", ["callback"] = "lightgreen", ["accelerator"] = "4"});
  app.registerUi({["menu"] = "LightGreen", ["callback"] = "lightgreen", ["accelerator"] = "KP_4"});
  app.registerUi({["menu"] = "LightBlue",  ["callback"] = "lightblue",  ["accelerator"] = "5"});
  app.registerUi({["menu"] = "LightBlue",  ["callback"] = "lightblue",  ["accelerator"] = "KP_5"});
  app.registerUi({["menu"] = "Gray",       ["callback"] = "gray",       ["accelerator"] = "6"});
  app.registerUi({["menu"] = "Gray",       ["callback"] = "gray",       ["accelerator"] = "KP_6"});
  app.registerUi({["menu"] = "Green",      ["callback"] = "green",      ["accelerator"] = "7"});
  app.registerUi({["menu"] = "Green",      ["callback"] = "green",      ["accelerator"] = "KP_7"});
  app.registerUi({["menu"] = "Red",        ["callback"] = "red",        ["accelerator"] = "8"});
  app.registerUi({["menu"] = "Red",        ["callback"] = "red",        ["accelerator"] = "KP_8"});
  app.registerUi({["menu"] = "Blue",       ["callback"] = "blue",       ["accelerator"] = "9"});
  app.registerUi({["menu"] = "Blue",       ["callback"] = "blue",       ["accelerator"] = "KP_9"});
  -- app.registerUi({["menu"] = "Black",      ["callback"] = "black",      ["accelerator"] = "b"});
  -- JMG: My tools selection
  app.registerUi({["menu"] = "Draw Rect", ["callback"] = "rectangle", ["accelerator"] = "r"});
  app.registerUi({["menu"] = "Draw Circle", ["callback"] = "circle", ["accelerator"] = "c"});
  app.registerUi({["menu"] = "Shape Recognizer", ["callback"] = "shape", ["accelerator"] = "s"});
end

-- Predefined colors copied from LoadHandlerHelper.cpp 
-- modify to your needs 
local colorList = { 
  {"white", 0xffffff},
  {"yellow", 0xffff00},    
  {"orange", 0xff8000}, 
  {"magenta", 0xff00ff},
  {"lightgreen", 0x00ff00}, 
  {"lightblue", 0x00c0ff}, 
  {"gray", 0x808080},   
  {"green", 0x008000},
  {"red", 0xff0000},        
  {"blue", 0x3333cc},      
  {"black", 0x000000}  
}

-- start with first color
local currentColor = 0 

-- JMG: My tool selection 
function rectangle()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_RECT"})
end

function circle()
  app.uiAction({["action"] = "ACTION_TOOL_DRAW_CIRCLE"})
end

function shape()
  app.uiAction({["action"] = "ACTION_SHAPE_RECOGNIZER"})
end

-- JMG: My own color selection START
function changeColor()
  app.changeToolColor({["color"] = colorList[currentColor][2], ["selection"] = true})
end
 
function white()
  currentColor = 1;
  changeColor();
end
 
function yellow()
  currentColor = 2;
  changeColor();
end
 
function orange()
  currentColor = 3
  changeColor()
end

function magenta()
  currentColor = 4
  changeColor()
end

function lightgreen()
  currentColor = 5
  changeColor()
end

function lightblue()
  currentColor = 6
  changeColor()
end

function gray()
  currentColor = 7
  changeColor()
end

function green()
  currentColor = 8
  changeColor()
end

function red()
  currentColor = 9
  changeColor()
end

function blue()
  currentColor = 10
  changeColor()
end

function black()
  currentColor = 10
  changeColor()
end





function cycle()
  if (currentColor < #colorList) then
    currentColor = currentColor + 1
  else
    currentColor = 1
  end
  -- apply color to currently used tool and allow coloring of elements from selections
  app.changeToolColor({["color"] = colorList[currentColor][2], ["selection"] = true})
  -- use app.changeColor({["color"] = colorList[currentColor][2], ["tool"] = "pen""}) 
  -- instead if you only want to change pen color
  -- similarly if you want to change highlighter color or the color from another tool with color capabilities.
end

-- From xournal-keys by Ben Smith START
function pen()
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
end

function lasso()
  app.uiAction({["action"] = "ACTION_TOOL_SELECT_REGION"})
end

function pen()
  app.uiAction({["action"] = "ACTION_TOOL_PEN"})
end

function highlighter()
  app.uiAction({["action"] = "ACTION_TOOL_HILIGHTER"})
end

function undo()
  app.uiAction({["action"] = "ACTION_UNDO"})
end

-- This doesn't work?
function redo()
  app.uiAction({["action"] = "ACTION_REDO"})
end

function copy()
  app.uiAction({["action"] = "ACTION_COPY"})
end

function cut()
  app.uiAction({["action"] = "ACTION_CUT"})
end

function paste()
  app.uiAction({["action"] = "ACTION_PASTE"})
end

function delete()
  app.uiAction({["action"] = "ACTION_DELETE"})
end

function eraser()
  app.uiAction({["action"] = "ACTION_TOOL_ERASER"})
end

-- Disable this because it doesn't turn the ruler off again
-- function ruler()
--   app.uiAction({["action"] = "ACTION_RULER"})
-- end
-- From xournal-keys by Ben Smith END

