extends CharacterBody2D


@export var speed : float = 300.0
@export var jump_velocity : float = -400.0
@export var low_gravity_multiplier : float = 0.50

var ableToMove: bool = true

var jumps : int = 1
var max_jumps : int = 2
var gravity_multiplier : float = 1.5

var on_ladder = false

@onready var inventory = $CanvasLayer/Inventory  # Direct reference to the Inventory
@onready var sprite = $AnimatedSprite2D

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
			sprite.play("fall")
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
			#sprite.play("jump")
			velocity.y = jump_velocity
			jumps -= 1

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("Left", "Right")
		if direction:
			if direction == 1:
				sprite.flip_h = false
			elif direction == -1:	
				sprite.flip_h = true
			if is_on_floor():
				sprite.play("walk")
			velocity.x = direction * speed
		else:
			if is_on_floor():
				sprite.play("idle")
			velocity.x = move_toward(velocity.x, 0, speed)

		move_and_slide()
	
func change_gravity():
	gravity_multiplier = low_gravity_multiplier

func _on_roomdetect_area_entered(area: Area2D) -> void:
	if not area.name.begins_with("camera_zone_"):
		return
	
	var collision_shape = area.get_node("CollisionShape2D")
	var size = collision_shape.shape.extents*2
	
	var cam = $Camera2D
	cam.limit_top = collision_shape.global_position.y - size.y/2
	cam.limit_left = collision_shape.global_position.x - size.x/2
	
	cam.limit_bottom = cam.limit_top + size.y
	cam.limit_right = cam.limit_left + size.x
