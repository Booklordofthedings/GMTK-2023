extends CharacterBody2D

var  speed = 100
var king_position
var target_position = Vector2(1,1)
#@onready var king = find_node("res://Game/Player/Player.tscn")


func _ready():
	position.y = 100+randi() % 500
	position.x = 900
