local log = {}

log.level = {}
log.currentLevel = nil

function log.print(level, message)
	if (level.priority >= log.currentLevel) then
		print("["..level.name.."] "..message)
	end
end

function log.setLevel(level)
	log.currentLevel = level
end

function log.getLevel()
	return log.currentLevel
end

function log.addLevel(name, priority)
	local data = {}
	data.name = name
	data.priority = priority
	log.level[name] = data
end

log.addLevel("Trace", 0)
log.addLevel("Info", 100)
log.addLevel("Warning", 500)
log.addLevel("Error", 500)

log.setLevel(log.level.Info)

return log