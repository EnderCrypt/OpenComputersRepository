local term = require("term")
local event = require("event")
local component = require("component")
local serialization = require("serialization")

local log = require("EnderCrypt/Log")

local app = {}
app.port = 8888

term.clear()
log.print(log.level.info, "Starting dns server by endercrypt...")

local modem = component.modem
if (modem == nil) then
	log.print(log.level.error, "no modem attached")
	return 1
end
modem.open(app.port)

event.listen("modem_message", function(receiver, sender, port, distance, data)
	data = serialization.unserialize(data)
	
end)