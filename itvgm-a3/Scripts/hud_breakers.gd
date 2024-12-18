extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_visibility_recursive($BreakersWindow, false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func set_visibility_recursive(node: Node, is_visible: bool) -> void:
	if node is CanvasItem:
		node.visible = is_visible
	for child in node.get_children():
		set_visibility_recursive(child, is_visible)

func show_closebutton():
	$Close.visible = true

func _on_close_pressed() -> void:
	set_visibility_recursive($BreakersWindow, false)
	set_visibility_recursive($NoteElectrical, false)
	$Close.visible = false
	$"../..".ableToMove = true
