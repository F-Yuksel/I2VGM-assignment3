extends CharacterBody2D


@export var speed : float = 300.0
@export var jump_velocity : float = -400.0
@export var low_gravity_multiplier : float = 0.50
var ableToMove: bool = true

var jumps : int = 1
var max_jumps : int = 2
var gravity_multiplier : float = 1.0

var on_ladder = false

func _ready() -> void:
	if Global.doorPosition != Vector2.ZERO:
		print("Moving player to last door position:", Global.doorPosition)
		global_position = Global.doorPosition
		Global.doorPosition = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Disable movement while in a menu
	if ableToMove:	
		# Add the gravity.
		if not is_on_floor() and not on_ladder:
			velocity += gravity_multiplier * get_gravity() * delta
		else:
			jumps = max_jumps
			
		# Handle Ladder Movement
		if on_ladder:
			if Input.is_action_pressed("Down"):
				velocity.y = speed*delta*25
			elif Input.is_action_pressed("Up"):
				velocity.y = -speed*delta*25
			else:
				velocity.y = 0
			
		# Handle jump.
		if Input.is_action_just_pressed("Jump") and jumps > 0 and not on_ladder:
			velocity.y = jump_velocity
			jumps -= 1

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("Left", "Right")
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

		move_and_slide()
	
func change_gravity():
	gravity_multiplier = low_gravity_multiplier
