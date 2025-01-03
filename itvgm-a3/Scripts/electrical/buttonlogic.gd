extends Node

# States of the three button colours.
var red_state : bool = true
var blue_state : bool = true
var green_state : bool = true

# Import all door nodes
@onready var red_door_a: StaticBody2D = $"../Doors/red_door_a"
@onready var red_door_b: StaticBody2D = $"../Doors/red_door_b"
@onready var blue_door_a: StaticBody2D = $"../Doors/blue_door_a"
@onready var blue_door_b: StaticBody2D = $"../Doors/blue_door_b"
@onready var green_door_a: StaticBody2D = $"../Doors/green_door_a"
@onready var green_door_b: StaticBody2D = $"../Doors/green_door_b"


# Called when the node enters the scene tree for the first time.
@onready var red_button: Area2D = $"../Buttons/red_button"
# @onready var blue_button: Area2D = $"../Buttons/blue_button"
# @onready var green_button: Area2D = $"../Buttons/green_button"

func _ready() -> void:
	# Connect button signals
	red_button.connect("button_pressed", Callable(self, "_on_button_pressed"))
	# blue_button.connect("button_pressed", Callable(self, "_on_button_pressed"))
	# green_button.connect("button_pressed", Callable(self, "_on_button_pressed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_pressed(color: String) -> void:
	set_doors(color)

func set_doors(color: String): # Toggles doors based on current gamestate
	match color:
		"red":
			red_state = !red_state
			play_door_animation(red_door_a, red_state)
			play_door_animation(red_door_b, !red_state)
		"blue":
			blue_state = !blue_state
			play_door_animation(blue_door_a, blue_state)
			play_door_animation(blue_door_b, !blue_state)
		"green":
			green_state = !green_state
			play_door_animation(green_door_a, green_state)
			play_door_animation(green_door_b, !green_state)

func play_door_animation(door: StaticBody2D, is_on: bool):
	var animation_player = door.get_node("AnimationPlayer")
	if is_on:
		animation_player.play("open")
	else:
		animation_player.play("closed")
