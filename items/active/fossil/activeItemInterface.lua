--[[
  Item Interfaces script for Active Items.
  This script will check if the active item has the parameter "itemInterface".
  If so, the callbacks of this script are used rather than the default script.
  The item will then open the interface from the path of the "itemInterface" parameter when activated.

  Note that this file should be required in the init function of a vanilla active item script to prevent issues on servers.
  The first line in function init():
  if (require "/items/active/fossil/activeItemInterface.lua") then return end
]]

local interfacePath = config.getParameter("itemInterface")
local interfaceType = config.getParameter("itemInterfaceType") or "ScriptConsole"

local holding = config.getParameter("itemInterfaceHolding")
if type(holding) == "boolean" then
  activeItem.setHoldingItem(holding)
end

--[[
  Check if this item is a valid Item Interfaces active item.
]]
if not interfacePath then
  -- Not valid; prevent this script from initializing.
  return
else
  -- Check if the file exists.
  if not pcall(function() root.assetJson(interfacePath) end) then
    sb.logError("ItemInterfaces: Could not load the interface '%s'. This item will behave as a regular fossil brush.", interfacePath)
    return
  end
end

--[[
  Item Interface table. Callbacks are stored here.
  You can use this table to store variables and functions, but feel free to define your own tables and variables.
]]
itemInterface = {}

--[[
  Update callback. Called every script.updateDt game ticks.
  @param dt - Time difference since last tick. Should always equal script.updateDt / 60.
  @param fireMode - "none", "primary" or "alt", indicating which mouse button is held down.
  @param shiftHeld - Value indicating whether the shift key is held down or not.
]]
function itemInterface.update(dt, fireMode, shiftHeld)

end

--[[
  Activation callback. Called when activating the item, regardless of the button used.
  This item descriptor is added to the configuration's gui, which allows both
  scripts for ScriptPanes and ScriptConsoles to fetch the data.
  @param fireMode - "primary" or "alt, indicating which mouse button is held down.
]]
function itemInterface.activate(fireMode, shiftHeld)
  local interfaceConfig = root.assetJson(interfacePath)

  if not interfaceConfig.gui then interfaceConfig.gui = {} end
  interfaceConfig.gui.activatedItem = {
    type = "label",
    visible = false,
    data = item.descriptor()
  }


  activeItem.interact(interfaceType, interfaceConfig)
end

--[[
  Uninit callback. Called when dying, reloading, leaving the current planet, etc.
]]
function itemInterface.uninit()

end

--[[
  Init code.
  Pretend this is function init(); define variables here.
]]

-- End Initialize

--[[
  Code that makes the active item use the callbacks from this script rather than the original fossil brush callbacks.
  Do not touch!
]]
update = itemInterface.update
activate = itemInterface.activate
uninit = itemInterface.uninit
return true
