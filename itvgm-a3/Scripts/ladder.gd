extends Area2D

var onladder: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$hightlighted.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if onladder:
		$hightlighted.visible = true
		$default.visible = false
	if not onladder:
		$hightlighted.visible = false
		$default.visible = true


func _on_body_exited(body: Node2D) -> void:
	if "Player" in body.name:
		body.on_ladder = false
		onladder = false

func _on_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		body.on_ladder = true
		onladder = true
