extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	AudioPlayer.play_victorymusic()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_button_button_down() -> void:
	get_tree().quit()


func _on_restart_button_pressed() -> void:
	Global.reset()
	AudioPlayer.stop_playing()
	AudioPlayer.play_intromusic()
	get_tree().change_scene_to_file("res://Scenes/Misc/credits.tscn")
