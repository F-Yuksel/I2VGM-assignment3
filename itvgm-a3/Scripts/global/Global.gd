extends Node

var elecwires_solved = false
var elecbreakers_solved = false
var elecbuttons_solved = false
var electrical_allsolved = false

var doorPosition: Vector2 = Vector2.ZERO
var hasCodePaper: bool = false
var hasSuit: bool = false
var generatorOn: bool = false
var inventoryLock: bool = false
var reactorOn: bool = false

func reset() -> void:
	doorPosition = Vector2.ZERO
	hasCodePaper = false
	hasSuit = false
	generatorOn = false
	inventoryLock = false
	
	elecwires_solved = false
	elecbreakers_solved = false
	electrical_allsolved = false
	reactorOn = false
	elecbuttons_solved = false
