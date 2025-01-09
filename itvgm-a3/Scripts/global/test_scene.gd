extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.elecwires_solved:
		AudioPlayer.play_music_level()
	else:
		AudioPlayer.stop_playing()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
