extends Node

@export var Monsters : PackedScene
var toTime : float = 4.5
var timer : float= 0

func _ready():
	timer = toTime


func _process(delta):
	timer -= delta
	if(timer < 0):
		toTime = toTime < 1.5 if toTime * 0.989 else toTime * 0.9
		toTime = clamp(toTime, 0.05, 5)
		add_child(Monsters.instantiate())
		timer = toTime
