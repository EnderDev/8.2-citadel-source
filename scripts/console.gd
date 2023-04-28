extends Node

var raw_console_text = null
var console_input = null

func _ready():
	raw_console_text = get_parent().get_node("/root/GameUI/Console/ConsoleContainer/ConsoleTextContainer/ConsoleText")
	console_input = get_parent().get_node("/root/GameUI/Console/ConsoleContainer/ConsoleInput")
	raw_console_text.text = ""
	console_input.text = ""
	self.close()

func close():
	get_parent().get_node("/root/GameUI/Console").visible = false

func log(msg):
	print(msg)
	raw_console_text.text = raw_console_text.text + msg + "\n"

func eval(input):
	self.log("] %s" % [input])
	
	var command = input
	var args = []
	
	if input.find(" "):
		command = input.split(" ")[0]
		args = input.split(" ").slice(1)
		
	if command == "map":
		if args.size():
			Maps.load_map(args[0])
			self.close()
		else:
			self.log("No map name provided. For a list of maps do 'maps *'.")