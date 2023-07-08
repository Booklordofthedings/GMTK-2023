extends CharacterBody2D

var  speed = 100
var king_position
var target_position
@onready var king = get_node("../../PlayerDeath")  

func _physics_process(delta):
	
	king_position = king.get_node("CharacterController").position
	target_position = (king_position - position).normalized()
	
	if position.distance_to(king_position) < 500:
		velocity = target_position * speed
		move_and_slide()





#func _ready():
#	target = get_node("../../King")  
#
#func _process(delta):
#	var direction = (target.position - position).normalized()
#	move_and_collide(direction * speed * delta)




