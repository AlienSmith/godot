extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

const ICON_PATH = "res://icons/"
const ITEMS = {
	"sword":{
		"icon": ICON_PATH + "sword.png",
		"slot":"MAIN_HAND",
	},
	"bread":{
		"icon": ICON_PATH + "bread.png",
		"slot": "None",
	},
	"armor":{
		"icon": ICON_PATH + "armor.png",
		"slot": "CHEST",
	},
	"error":{
		"icon":ICON_PATH+"cube.png",
		"slot":"None",
	}
}
func get_item(item_id):
	if item_id in ITEMS:
		return ITEMS[item_id]
	else:
		return ITEMS["error"]
