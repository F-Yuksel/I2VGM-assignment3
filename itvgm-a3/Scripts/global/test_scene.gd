extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Global.elecwires_solved:
		$Lamps/Electrical/Normal.visible = false
		$Lamps/Electrical/Solved.visible = false
		$Lamps/Electrical/Emergency.visible = true
		$Lamps/Reactor/Normal.visible = false
		$Lamps/Reactor/Solved.visible = false
		$Lamps/Reactor/Off.visible = true
		$Lamps/Comms/Normal.visible = false
		$Lamps/Comms/Solved.visible = false
		$Lamps/Comms/Off.visible = true
		$Lamps/roomlamp.visible = false
		
		$Lamps/OtherLamps/pointlamp.visible = false 
		$Lamps/OtherLamps/pointlamp2.visible = false  
		$Lamps/OtherLamps/pointlamp3.visible = false 
		$Lamps/OtherLamps/pointlamp4.visible = false 
		$Lamps/OtherLamps/pointlamp5.visible = false 
		$Lamps/OtherLamps/pointlamp6.visible = false 
		
		$Lamps/OtherLamps/emergencyLamp.visible = true
		$Lamps/OtherLamps/emergencyLamp2.visible = true
		$Lamps/OtherLamps/emergencyLamp3.visible = true
		$Lamps/OtherLamps/emergencyLamp4.visible = true
		$Lamps/OtherLamps/emergencyLamp5.visible = true
		$Lamps/OtherLamps/emergencyLamp6.visible = true
	if Global.elecwires_solved:
		$Lamps/Electrical/Normal.visible = true
		$Lamps/Electrical/Emergency.visible = false
		$Lamps/Reactor/Normal.visible = true
		$Lamps/Reactor/Off.visible = false
		$Lamps/Comms/Normal.visible = true
		$Lamps/Comms/Off.visible = false
		
		$Lamps/OtherLamps/pointlamp.visible = true 
		$Lamps/OtherLamps/pointlamp2.visible = true  
		$Lamps/OtherLamps/pointlamp3.visible = true 
		$Lamps/OtherLamps/pointlamp4.visible = true 
		$Lamps/OtherLamps/pointlamp5.visible = true 
		$Lamps/OtherLamps/pointlamp6.visible = true 
		
		$Lamps/OtherLamps/emergencyLamp.visible = false
		$Lamps/OtherLamps/emergencyLamp2.visible = false
		$Lamps/OtherLamps/emergencyLamp3.visible = false
		$Lamps/OtherLamps/emergencyLamp4.visible = false
		$Lamps/OtherLamps/emergencyLamp5.visible = false
		$Lamps/OtherLamps/emergencyLamp6.visible = false
	if Global.electrical_allsolved:
		$Lamps/Electrical/Normal.visible = false
		$Lamps/Electrical/Solved.visible = true
	if Global.reactorOn:
		$Lamps/Reactor/Normal.visible = false
		$Lamps/Reactor/Solved.visible = true
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
