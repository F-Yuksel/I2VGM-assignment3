extends Node

var elecwires_solved = false
var elecbreakers_solved = false
var electrical_allsolved = false

var doorPosition: Vector2 = Vector2.ZERO
var hasCodePaper: bool = false
var hasSuit: bool = false
var generatorOn: bool = false
var inventoryLock: bool = false

func reset() -> void:
	doorPosition = Vector2.ZERO
	hasCodePaper = false
	hasSuit = false
	generatorOn = false
	inventoryLock = false
