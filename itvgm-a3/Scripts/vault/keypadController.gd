extends Node

var codeEntered: String = "";
var codeCorrect: String = "1973";

func _ready() -> void:
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
	pass
	
func _on_button_pressed_1():
	codeEntered += "1";

func _on_button_pressed_2():
	codeEntered += "2";
	
func _on_button_pressed_3():
	codeEntered += "3";
	
func _on_button_pressed_4():
	codeEntered += "4";
	
func _on_button_pressed_5():
	codeEntered += "5";
	
func _on_button_pressed_6():
	codeEntered += "6";
	
func _on_button_pressed_7():
	codeEntered += "7";
	
func _on_button_pressed_8():
	codeEntered += "8";
	
func _on_button_pressed_9():
	codeEntered += "9";
	
func _on_button_pressed_0():
	codeEntered += "0";

func _on_button_pressed_x():
	codeEntered = "";
	$"..".visible = false;
	$"../..".ableToMove = true;
	
func _on_button_pressed_v():
	if codeCorrect == codeEntered:
		$"..".visible = false;
		Global.hasSuit = true;
		$"../..".ableToMove = true;
	else :
		codeEntered = "";
