extends Node

var elecwires_solved = false
var elecbreakers_solved = false
var elecbuttons_solved = false
var electrical_allsolved = false
var poweron_played = false
var doorPosition: Vector2 = Vector2.ZERO
var hasCodePaper: bool = false
var hasSuit: bool = false
var generatorOn: bool = false
var inventoryLock: bool = false
var reactorOn: bool = false
var messageSent: bool = false
var coordsGet: bool = false

func reset() -> void:
	elecwires_solved = false
	elecbreakers_solved = false
	elecbuttons_solved = false
	electrical_allsolved = false
	poweron_played = false
	doorPosition = Vector2.ZERO
	hasCodePaper = false
	hasSuit = false
	generatorOn = false
	inventoryLock = false
	reactorOn = false
	messageSent = false
	coordsGet = false
