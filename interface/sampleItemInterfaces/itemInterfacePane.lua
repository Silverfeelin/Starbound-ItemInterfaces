require "/scripts/util.lua"
require "/scripts/vec2.lua"

function init()
  -- Activated item, change false to true to dump item descriptor used to open this interface.
  if true then
    sb.logInfo("ItemInterfacePane (ScriptPane) was opened using the following item:\n%s", sb.printJson(widget.getData("activatedItem")))
  end
  -- Change false to true to dump log.
  if false then
    for k,v in pairs(_ENV) do
      if type(v) == "table" then
        for k2,v2 in pairs(v) do
          sb.logInfo("%s.%s", k, k2)
        end
      else
        sb.logInfo("%s", k)
      end
    end
  end
end

function update(dt)

end
