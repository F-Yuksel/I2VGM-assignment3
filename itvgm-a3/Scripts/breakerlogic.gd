extends Node
# BREAKER SEQUENCE: 4-3-5-1-2
# Tracks sequence progress
var seq_tracker = 0

@onready var button_1: Button = $"../Buttons/Button1"
@onready var button_2: Button = $"../Buttons/Button2"
@onready var button_3: Button = $"../Buttons/Button3"
@onready var button_4: Button = $"../Buttons/Button4"
@onready var button_5: Button = $"../Buttons/Button5"

@onready var button_1_anim: AnimatedSprite2D = $"../Animations/button1_anim"
@onready var button_2_anim: AnimatedSprite2D = $"../Animations/button2_anim"
@onready var button_3_anim: AnimatedSprite2D = $"../Animations/button3_anim"
@onready var button_4_anim: AnimatedSprite2D = $"../Animations/button4_anim"
@onready var button_5_anim: AnimatedSprite2D = $"../Animations/button5_anim"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func reset_buttons():
	# Sets all buttons back to default
	button_1.disabled = false
	button_1.set_pressed(false)
	button_1_anim.play("off")
	
	button_2.disabled = false
	button_2_anim.play("off")
	button_2.set_pressed(false)
	
	button_3.disabled = false
	button_3_anim.play("off")
	button_3.set_pressed(false)
	
	button_4.disabled = false
	button_4_anim.play("off")
	button_4.set_pressed(false)
	
	button_5.disabled = false
	button_5_anim.play("off")
	button_5.set_pressed(false)
	
	# Reset the sequence tracker
	seq_tracker = 0

func _on_button_1_toggled(_toggled_on: bool) -> void:
	# On correct sequence
	if seq_tracker == 3:
		# Disable button
		button_1.disabled = true
		button_1_anim.play("on")
		seq_tracker += 1
	else:
		reset_buttons()


func _on_button_2_toggled(_toggled_on: bool) -> void:
	# On correct sequence
	if seq_tracker == 4:
		# Disable button
		button_2.disabled = true
		button_2_anim.play("on")
		print("Solved!")
	else:
		reset_buttons()


func _on_button_3_toggled(_toggled_on: bool) -> void:
	# On correct sequence
	if seq_tracker == 1:
		# Disable button
		button_3.disabled = true
		button_3_anim.play("on")
		seq_tracker += 1
	else:
		reset_buttons()


func _on_button_4_toggled(_toggled_on: bool) -> void:
	# On correct sequence
	if seq_tracker == 0:
		# Disable button
		button_4.disabled = true
		button_4_anim.play("on")
		seq_tracker += 1
	else:
		reset_buttons()


func _on_button_5_toggled(_toggled_on: bool) -> void:
	# On correct sequence
	if seq_tracker == 2:
		# Disable button
		button_5.disabled = true
		button_5_anim.play("on")
		seq_tracker += 1
	else:
		reset_buttons()