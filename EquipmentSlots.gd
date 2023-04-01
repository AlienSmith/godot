extends Panel

@onready var slots = get_children()
var items = {}

func _ready():
	for slot in slots:
		items[slot.name] = null


func insert_item(item):
	var item_pos = item.global_position + item.size/2
	var slot = get_slot_under_pos(item_pos)
	if slot == null:
		return false
	
	var item_slot = ItemDb.get_item(item.get_meta("id"))["slot"]
	if item_slot != slot.name:
		return false
	if items[item_slot] != null:
		return false
	items[item_slot] = item
	item.global_position = slot.global_position + slot.size/2 - item.size/2
	return true

func grab_item(pos):
	var item = get_item_under_pos(pos)
	if item == null:
		return null
	var item_slot = ItemDb.get_item(item.get_meta("id"))["slot"]
	items[item_slot] = null
	return item

func get_slot_under_pos(pos):
	return get_thing_under_pos(slots,pos)
	
func get_item_under_pos(pos):
	return get_thing_under_pos(items.values(),pos)
	
##TODO ABLE TO ADD MULTILINE
func get_thing_under_pos(arr,pos):
	for thing in arr:
		if thing != null and thing.get_global_rect().has_point(pos):
			return thing
	return null
