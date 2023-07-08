extends CharacterBody2D

@export var speed = 400
@onready var animations = $AnimationPlayer
var direction = 1;

#func _process(_delta):
#		animations.play("idle")

func _physics_process(delta):
	if position.y > 850:
		direction = -1
		velocity.y = -velocity.y
	elif position.y < 100:
		direction = 1
		velocity.y = -velocity.y
		
	velocity += Vector2(0, 0.2 * direction)
	velocity.y = clamp(velocity.y, -90, 90)
	
	if direction == 1:
		animations.play("walkDown")
	else:
		animations.play("walkUp")
		
	move_and_slide()
	
