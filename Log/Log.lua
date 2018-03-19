local term = require("term")
local colors = require("colors")
local component = require("component")

local gpu = component.gpu

local log = {}

log.level = {}
log.currentLevel = nil

function log.print(level, message)
	if (level.priority < log.currentLevel.priority) then
		return -- priority too low
	end
	if (term.isAvailable() == false) then
		return -- term not available
	end
	if (gpu ~= nil) then
		if (level.color ~= nil) then
			gpu.setForeground(level.color)
		end
	end
	local output = "["..level.name.."] "..message
	term.write(output.."\n")
end

function log.setLevel(level)
	log.currentLevel = level
end

function log.getLevel()
	return log.currentLevel
end

function log.addLevel(name, priority, color)
	local data = {}
	data.name = name
	data.priority = priority
	data.color = color
	log.level[string.lower(name)] = data
end

log.addLevel("Trace", 0, nil)
log.addLevel("Info", 100, nil)
log.addLevel("Warning", 500, colors.blue)
log.addLevel("Error", 500, colors.red)

log.setLevel(log.level.info)

return log