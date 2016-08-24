--[[
  Keyboard libray, originally from http://community.playstarbound.com/threads/macrochip-stable-glad-giraffe.106547/ by Storm_UK.
  The mod permissions state you're free to alter and redistribute this asset. It is highly recommended not to remove this note though.
]]

--[[
  In ItemInterfaces, this file was added as a key reference for the canvasKeyEvent callback. Adjustments or implementation is necessary to utilize the script.
]]

keyboard = {
  keyState = {},
  keyTimes = {},
  repeatDelay = 0.5,
  repeatInterval = 0.05,
  keyMap = {
    [5] = " ", [8] = "#",  [11] = "'", [16] = ",", [17] = "-", [18] = ".", [19] = "/",
    [20] = "0", [21] = "1", [22] = "2", [23] = "3", [24] = "4", [25] = "5", [26] = "6", [27] = "7", [28] = "8", [29] = "9",
    [33] = "="
    --[43] to [68] = "a" to "z"
  },
  shiftKeyMap = {
    [8] = "~", [11] = "@", [16] = "<", [17] = "_", [18] = ">", [19] = "?",
    [20] = ")", [21] = "!", [24] = "$", [25] = "%", [26] = "^", [27] = "&", [28] = "*", [29] = "(",
    [31] = ":", [33] = "+", [37] = "{", [38] = "|", [39] = "}"
  },
  specialKeyMap = {
    [0] = "backspace", [1] = "tab", [3] = "return", [19] = "/", [27] = "escape", [31] = ";",
    [69] = "delete",
    [70] = "0", [71] = "1", [72] = "2", [73] = "3", [74] = "4", [75] = "5", [76] = "6", [77] = "7", [78] = "8", [79] = "9",
    [80] = ".", [81] = "/", [82] = "*", [83] = "-", [84] = "+", [85] = "enter",
    [87] = "up", [88] = "down", [89] = "right", [90] = "left",
    [91] = "insert", [92] = "home", [93] = "end", [94] = "pageup", [95] = "pagedown",
    [96] = "f1", [97] ="f2", [98] = "f3", [99] = "f4", [100] = "f5", [101] = "f6", -- f2 and f3 = [27/"7"] and [26/"6"] at present?
    [102] = "f7", [103] = "f8", [104] = "f9", [105] = "f10", [106] = "f11", [107] = "f12", -- f10 = [50/"h"] at present?
    [112] = "capslock", [115] = "rshift", [114] = "lshift", [116] = "rctrl", [117] = "lctrl", [118] = "ralt", [119] = "lalt"
  }
}

keyboardEvent = {}

function keyboard.keyEvent(key,isKeyDown)
  if isKeyDown then
    keyboard.keyTimes[key] = keyboard.keyTimes[key] or 0
  else
    keyboard.keyTimes[key] = nil
  end

  keyboard.keyState[key] = isKeyDown

  local keyState = keyboard.keyState
  local shift, caps = keyState[114] or keyState[115], keyState[112]
  local key = keyboard.getKey(key, shift, caps)

  if not isKeyDown or keyState[117] or keyState[118] or keyState[119] or keyState[120] then
    return
  end
  --sb.logInfo(key.." - "..tostring(shift).."/"..tostring(caps).." - "..self.screen)
  keyboardEvent[self.screen](key, shift, caps)
end

function keyboard.repeatKey(dt)
  local keyTimes = keyboard.keyTimes
  for key,dur in pairs(keyTimes) do
    local timer = dur + dt
    keyTimes[key] = timer
    if timer > keyboard.repeatDelay + keyboard.repeatInterval then
      keyboard.keyEvent(tonumber(key), true)
      keyTimes[key] = keyboard.repeatDelay
    end
  end
end

function keyboard.getKey(key, shift, capslock)
  if (capslock and not shift) or (shift and not capslock) then
    -- 43 to 68 = a to z, add 22 for ascII A-Z
    if key >= 43 and key <= 68 then return string.char(key+22) end
  end
  if shift and keyboard.shiftKeyMap[key] then
    return keyboard.shiftKeyMap[key]
  else
    -- 43 to 68 = a to z keys, add 54 for ascII a-z
    if key >= 43 and key <= 68 then
      return string.char(key+54)
    elseif keyboard.keyMap[key] then
      return keyboard.keyMap[key]
    elseif keyboard.specialKeyMap[key] then
      return keyboard.specialKeyMap[key]
    else
      return "unknown"
    end
  end
end

function keyboard.logInfo(key,isKeyDown)
  local logInfo = ""
  if key ~= "%" then
    logInfo = key
  else
    logInfo = "percent"
  end

  if isKeyDown then
    logInfo = "[".. logInfo.."] was pressed."
  else
    logInfo = "[".. logInfo.."] was released."
  end
  return logInfo
end
