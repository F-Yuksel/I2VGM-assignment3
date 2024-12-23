extends Node

var items = []  # This will hold all the picked-up items

# Add an item to the global inventory
func add_item(item_node: Node) -> void:
	if item_node:
		print("Bezig met item adden", item_node)
		add_child(item_node)
		print("Item added to global inventory: ", item_node.name)
		print("Children I now have is: ", get_child(0))

# Optionally, you can implement a function to remove items if needed
func remove_item(item_node: Node) -> void:
	items.erase(item_node)
	item_node.queue_free()  # Remove from the scene and free memory
