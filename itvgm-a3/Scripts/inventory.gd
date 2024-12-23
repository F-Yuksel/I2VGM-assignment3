extends Control

var slots = []
@onready var window = get_node("TabContainer")
@onready var log_info_text : RichTextLabel = get_node("TabContainer/Logs/HBoxContainer/MarginContainer/RichTextLabel")
@onready var item_info_text : RichTextLabel = get_node("TabContainer/Items/HBoxContainer/MarginContainer/RichTextLabel")
@onready var item_info_img : TextureRect = get_node("TabContainer/Items/HBoxContainer/MarginContainer/TextureRect")
@onready var starter_items : Node = get_node("StarterItems")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_toggle_window(false)
	print("Ready enzo")
	
	log_info_text.text = ""
	item_info_text.text = ""
	item_info_img.texture = null
	
	# add all starter items and logs to their corresponding inventory
	#for child in starter_items.get_children():
	#	add_item(child)
	for x in GlobalInventory.get_children():
		print("item is", x)
		add_item(x)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Inventory"):
		_toggle_window(!window.visible)
	
func _toggle_window(open: bool):
	window.visible = open
	
	if open: 
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		print(GlobalInventory)
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func on_give_player_item(item):
	pass

func add_item(item):
	var slot = get_slot_to_add(item)
	slot.set_item(item)
	slot.inventory = self
	
func remove_item(item):
	if item.is_log:
		for child in get_node("TabContainer/Logs/HBoxContainer/MarginContainer2/ScrollContainer/SlotContainer").get_children():
			if child.item_name == item.item_name:
				child.queue_free()
	else:
		for child in get_node("TabContainer/Items/HBoxContainer/MarginContainer2/ScrollContainer/SlotContainer").get_children():
			if child.item_name == item.item_name:
				child.queue_free()
	
func get_slot_to_add(item):
	print("Getting slot to add")
	if item.is_log:
		var new_slot = load("res://Scenes/inventory_slot.tscn").instantiate()
		get_node("TabContainer/Logs/HBoxContainer/MarginContainer2/ScrollContainer/SlotContainer").add_child(new_slot)
		slots.append(new_slot)
		return new_slot
	else: 
		var new_slot = load("res://Scenes/inventory_slot.tscn").instantiate()
		get_node("TabContainer/Items/HBoxContainer/MarginContainer2/ScrollContainer/SlotContainer").add_child(new_slot)
		slots.append(new_slot)
		return new_slot
	
func _set_info(is_log, text, img):
	if is_log:
		log_info_text.text = text
	else:
		item_info_text.text = text
		item_info_img.texture = img
