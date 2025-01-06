extends Node

var doorPosition: Vector2 = Vector2.ZERO
var hasCodePaper: bool = false
var hasSuit: bool = false
var generatorOn: bool = false

func reset() -> void:
	doorPosition = Vector2.ZERO
	hasCodePaper = false
	hasSuit = false
	generatorOn = false
