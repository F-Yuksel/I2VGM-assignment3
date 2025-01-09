extends Control

@onready var button_press: AudioStreamPlayer2D = $ButtonPress
@onready var input_delay: Timer = $InputDelay

var next_action = ""
var busy: bool = false


func start_game():
	get_tree().change_scene_to_file("res://Scenes/introduction.tscn")

func quit_game():
	get_tree().quit()
	
func open_credits():
	get_tree().change_scene_to_file("res://Scenes/Misc/credits.tscn")
	
func _on_menu_button_pressed() -> void:
	if busy:
		return
		
	busy = true
	button_press.play()
	
	next_action = "start"
	input_delay.start()


func _on_menu_button_2_pressed() -> void:
	if busy:
		return
		
	busy = true
	button_press.play()
	
	next_action = "quit"
	input_delay.start()


func _on_credits_button_pressed() -> void:
	if busy:
		return
		
	busy = true
	button_press.play()
	
	next_action = "credits"
	input_delay.start()


func _on_input_delay_timeout() -> void:
	if next_action == "start":
		start_game()
	elif next_action == "quit":
		quit_game()
	elif next_action == "credits":
		open_credits()
	busy = false
