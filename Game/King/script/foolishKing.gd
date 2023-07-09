extends RigidBody2D

@export var speed = 400
@onready var animations = $AnimationPlayer
var direction = 1;
var timer = 0.5;
var score = int(0);

func _process(delta):
	score += delta * 10;
	
func _physics_process(delta):
	
	if position.y > 950:
		direction = -1
	elif position.y < 50:
		direction = 1
	
	move_and_collide(Vector2(4 * (1 - position.x/1050),direction * delta * 500))
	
	if direction == 1:
		animations.play("walkDown")
	else:
		animations.play("walkUp")
		
	if(position.x < -10):
		get_node("/root/Globals").call("SetHighscore", score)
		get_tree().change_scene_to_file("res://Menus/Death/Death_Menu.tscn")
	



func _on_body_entered(body):
	direction = direction * -1
	move_and_collide(Vector2(-3,0))
	pass # Replace with function body.
