extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	

func _on_animation_finished(anim_name):
	if anim_name == "fade_black":
		on_transition_finished.emit()
		animation_player.play("fade_in")
	elif anim_name == "slow_transition":
		on_transition_finished.emit()
		animation_player.play("slow_transition_out")
	elif anim_name == "fade_in" or "slow_transition_out":
		color_rect.visible = false

func transition():
	color_rect.visible = true
	animation_player.play("fade_black")
	
func transition_slow():
	color_rect.visible = true
	animation_player.play("slow_transition")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
