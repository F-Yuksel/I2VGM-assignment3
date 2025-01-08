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
func remove_item(item_node: Node):
	print(get_children())
	print(item_node.name, " and ", find_child(item_node.name))
	for child in get_children():
		print(child.name)
		if child.name.begins_with(item_node.name):
			print(find_child(item_node.name))
			items.erase(item_node)
			item_node.queue_free()  # Remove from the scene and free memory
			return true
	return false

func check_item(item_node: Node):
	for child in get_children():
		print(child.name)
		if child.name.begins_with(item_node.name):
			print(find_child(item_node.name))
			item_node.queue_free()  # Remove from the scene and free memory
			return true
