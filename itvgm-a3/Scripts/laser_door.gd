extends StaticBody2D

# this should reach the actual value after the signals in from ready of the levers
# door 4 has to be 1 because the second off line does not use the lever script
@export var power_lines = 0


func _on_lever_power(is_on : bool) -> void:
	if is_on:
		power_lines += 1
	else:
		power_lines -= 1
	if power_lines > 0:
		$CollisionShape2D.disabled = true
		$Closed.visible = false
		$Open.visible = true
	else:
		$CollisionShape2D.disabled = false
		$Closed.visible = true
		$Open.visible = false
