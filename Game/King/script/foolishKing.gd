extends RigidBody2D

@export var speed = 400
@onready var animations = $AnimationPlayer
var direction = 1;
var timer = 1.5;

func _physics_process(delta):
	timer -= delta
	if(timer < 0):
			(get_node("CollisionShape2D") as CollisionShape2D).disabled = false
	
	if position.y > 950:
		direction = -1
	elif position.y < 50:
		direction = 1
	
	move_and_collide(Vector2(1,direction * delta * 500))
	
	if direction == 1:
		animations.play("walkDown")
	else:
		animations.play("walkUp")
		
	if(position.x < -10):
		get_tree().change_scene_to_file("res://Menus/DeathMenu/DeathMenu.tscn")
	



func _on_body_entered(body):
	(get_node("CollisionShape2D") as CollisionShape2D).disabled = true
	direction = direction * -1
	timer = 1.5
	pass # Replace with function body.
