extends Node

@onready var label: Label = $Label

var score := 0

func add_point():
	score += 1
	label.text = "干得好！你拾取了 " + str(score) + "枚 金币"

