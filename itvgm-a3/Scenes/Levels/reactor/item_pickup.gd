extends Area2D

var ableToPickUp: bool = false
var playerName: String = "Player"
var player: Node = null


@export var item : Node

func _ready() -> void:
	print("Ik start opnieuw")
	$".".connect("body_entered", Callable(self, "_on_body_entered"))
	$".".connect("body_exited", Callable(self, "_on_body_exited"))
	

	#if Global.hasCodePaper:
	#	$"../../File".visible = false

func _process(delta: float) -> void:
	if ableToPickUp and Input.is_action_just_pressed("Interact"):
		# Get the global inventory
		var global_inventory = GlobalInventory
		if global_inventory:
			print("Adding item", item)
			var inventory = player.get_node("CanvasLayer/Inventory")
			var new_item = item.duplicate()
			# Add the item to the global inventory
			global_inventory.add_child(new_item)
			inventory.add_item(item)  # Add the item to the player's inventory
			queue_free()  # Remove the item from the world
	
func _on_body_entered(body):
	if body.name == playerName:
		player = body
		var interact_screen = body.get_node("Interact")
		print(interact_screen)
		ableToPickUp = true
		interact_screen.visible = true
	
func _on_body_exited(body):
	if body.name == playerName:
		var interact_screen = body.get_node("Interact")
		print(interact_screen)
		ableToPickUp = false
		interact_screen.visible = false