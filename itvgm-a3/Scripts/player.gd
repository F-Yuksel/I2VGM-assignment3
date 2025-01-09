extends CharacterBody2D

var rng = RandomNumberGenerator.new()

var walk_last_pitch = 1.0
var walk_pitch_scale

var jump_last_pitch = 1.0
var jump_pitch_scale

var land_last_pitch = 0.7
var land_pitch_scale

@onready var footsteps: AudioStreamPlayer = $Sounds/Footsteps
@onready var jump: AudioStreamPlayer = $Sounds/Jump
@onready var land: AudioStreamPlayer = $Sounds/Land

@export var speed : float = 300.0
@export var jump_velocity : float = -400.0
@export var low_gravity_multiplier : float = 0.50

var ableToMove: bool = true

var jumps : int = 1
var max_jumps : int = 2
var gravity_multiplier : float = 1.5

var inair = false
var on_ladder = false

@onready var inventory = $CanvasLayer/Inventory  # Direct reference to the Inventory
@onready var sprite = $AnimatedSprite2D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Global.doorPosition != Vector2.ZERO:
		print("Moving player to last door position:", Global.doorPosition)
		global_position = Global.doorPosition
		Global.doorPosition = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if Global.hasSuit:
		$"AnimatedSprite2D".visible = false
		$"hazmatSuite".visible = true
		sprite = $hazmatSuite
	else:
		$"AnimatedSprite2D".visible = true
		$"hazmatSuite".visible = false
		sprite = $AnimatedSprite2D
	# Disable movement while in a menu
	if ableToMove:	
		if is_on_floor() and inair:
			land_pitch_scale = rng.randf_range(0.5, 0.9)
			while abs(land_last_pitch - land_pitch_scale) < 0.1: # Prevents repetitive jumping noise
				land_pitch_scale = rng.randf_range(0.5, 0.9)
			land.pitch_scale = land_pitch_scale
			land.play()
			land_last_pitch = land_pitch_scale # Stores previous value
			inair = false
		
		# Add the gravity.
		if not is_on_floor() and not on_ladder:
			sprite.play("fall")
			inair = true
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
			if footsteps.playing:
				footsteps.stop()
				
			jump_pitch_scale = rng.randf_range(0.7, 1.3)
			while abs(jump_last_pitch - jump_pitch_scale) < 0.1: # Prevents repetitive jumping noise
				jump_pitch_scale = rng.randf_range(0.7, 1.3)
			jump.pitch_scale = jump_pitch_scale
			jump.play()
			jump_last_pitch = jump_pitch_scale # Stores previous value
			
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
				# Randomize typing sound pitch
				walk_pitch_scale = rng.randf_range(0.8, 1.2)
				while abs(walk_last_pitch - walk_pitch_scale) < 0.1: # Prevents repetitive walking noise
					walk_pitch_scale = rng.randf_range(0.8, 1.2)
				footsteps.pitch_scale = walk_pitch_scale
				if not footsteps.playing:
					footsteps.play()
				walk_last_pitch = walk_pitch_scale # Stores previous value
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
