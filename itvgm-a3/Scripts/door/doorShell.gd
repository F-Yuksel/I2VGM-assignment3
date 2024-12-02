extends Sprite2D

@export var scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if scene:
		$door.nextScene = scene
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
