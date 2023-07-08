extends CharacterBody2D

@export var speed = 400
@onready var animations = $AnimationPlayer
var direction = 1;

#func get_input():
#	var input_direction = Input.get_vector("left", "right", "up", "down")
#	velocity = input_direction * speed

func _process(_delta):
		animations.play("idle")

func _physics_process(delta):
	if position.y > 850:
		direction = -1
		velocity.y = -velocity.y
	elif position.y < 100:
		direction = 1
		velocity.y = -velocity.y
		
	velocity += Vector2(0, 0.2 * direction)
	velocity.x = clamp(velocity.y, -3,3)
	
	if direction == -1:
		animations.play("walkUp")
	else:
		animations.play("walkDown")
		
	move_and_slide()
	
