extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Global.elecwires_solved:
		$Lamps/LineLamp1/Linelamp.visible = false
		$Lamps/LineLamp2/Linelamp2.visible = false
		$Lamps/LineLamp3/Linelamp3.visible = false
		$Lamps/PointLamp/pointlamp.visible = false
		$Lamps/roomlamp.visible = false
		
	elif Global.elecwires_solved:
		$Lamps/LineLamp1/Linelamp.visible = true
		$Lamps/LineLamp2/Linelamp2.visible = true
		$Lamps/LineLamp3/Linelamp3.visible = true
		$Lamps/PointLamp/pointlamp.visible = true
		$Lamps/roomlamp.visible = true
		
		$Lamps/LineLamp1/Emergency.visible = false
		$Lamps/LineLamp2/Emergency.visible = false
		$Lamps/LineLamp3/Emergency.visible = false
		$Lamps/PointLamp/emergencyLamp.visible = false
		AudioPlayer.play_music_level()
