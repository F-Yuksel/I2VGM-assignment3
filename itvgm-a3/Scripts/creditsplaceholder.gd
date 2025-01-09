extends Control

@onready var button_press: AudioStreamPlayer = $ButtonPress
@onready var input_delay: Timer = $InputDelay


func _on_menu_button_pressed() -> void:
	button_press.play()
	input_delay.start()


func _on_input_delay_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/menuscreen.tscn")
