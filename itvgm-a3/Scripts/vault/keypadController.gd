extends Node

var codeEntered: String = "";
var codeCorrect: String = "1973";
@onready var buttonpress: AudioStreamPlayer = $"../ButtonPress"

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$"./1".connect("pressed", Callable(self, "_on_button_pressed_1"));
	$"./2".connect("pressed", Callable(self, "_on_button_pressed_2"));
	$"./3".connect("pressed", Callable(self, "_on_button_pressed_3"));
	$"./4".connect("pressed", Callable(self, "_on_button_pressed_4"));
	$"./5".connect("pressed", Callable(self, "_on_button_pressed_5"));
	$"./6".connect("pressed", Callable(self, "_on_button_pressed_6"));
	$"./7".connect("pressed", Callable(self, "_on_button_pressed_7"));
	$"./8".connect("pressed", Callable(self, "_on_button_pressed_8"));
	$"./9".connect("pressed", Callable(self, "_on_button_pressed_9"));
	$"./0".connect("pressed", Callable(self, "_on_button_pressed_0"));
	$"./x".connect("pressed", Callable(self, "_on_button_pressed_x"));
	$"./v".connect("pressed", Callable(self, "_on_button_pressed_v"));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		_on_button_pressed_esc()
	
func _on_button_pressed_1():
	buttonpress.play()
	codeEntered += "1";

func _on_button_pressed_2():
	buttonpress.play()
	codeEntered += "2";
	
func _on_button_pressed_3():
	buttonpress.play()
	codeEntered += "3";
	
func _on_button_pressed_4():
	buttonpress.play()
	codeEntered += "4";
	
func _on_button_pressed_5():
	buttonpress.play()
	codeEntered += "5";
	
func _on_button_pressed_6():
	buttonpress.play()
	codeEntered += "6";
	
func _on_button_pressed_7():
	buttonpress.play()
	codeEntered += "7";
	
func _on_button_pressed_8():
	buttonpress.play()
	codeEntered += "8";
	
func _on_button_pressed_9():
	buttonpress.play()
	codeEntered += "9";
	
func _on_button_pressed_0():
	buttonpress.play()
	codeEntered += "0";

func _on_button_pressed_x():
	buttonpress.play()
	Global.doorPosition = Vector2(175,-60)
	get_tree().change_scene_to_file("res://Scenes/Levels/reactor/kluiskamer.tscn")
	
func _on_button_pressed_esc():
	buttonpress.play()
	Global.doorPosition = Vector2(175,-60)
	get_tree().change_scene_to_file("res://Scenes/Levels/reactor/kluiskamer.tscn")
	
func _on_button_pressed_v():
	buttonpress.play()
	if codeCorrect == codeEntered:
		Global.hasSuit = true;
		Global.doorPosition = Vector2(175,-60)
		get_tree().change_scene_to_file("res://Scenes/Levels/reactor/kluiskamer.tscn")
	else:
		codeEntered = "";
