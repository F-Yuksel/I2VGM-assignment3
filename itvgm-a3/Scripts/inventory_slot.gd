extends Button

@onready var icon_ : TextureRect = get_node("HBoxContainer/Icon")
@onready var label : Label = get_node("HBoxContainer2/Label")
var info_text : String
var inventory
var is_log : bool
var item_name : String
var info_img : Resource


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func set_item(item):
	item_name = item.item_name
	is_log = item.is_log
	info_text = item.info_text
	icon_.texture = item.icon
	label.text = item.item_name
	info_img = item.image
	print("Item complete")

func _on_pressed() -> void:
	inventory._set_info(is_log, info_text, info_img)
