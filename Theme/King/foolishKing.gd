extends CharacterBody2D

@export var speed = 400
@onready var animations = $AnimationPlayer

#func get_input():
#	var input_direction = Input.get_vector("left", "right", "up", "down")
#	velocity = input_direction * speed

func _process(_delta):
	if Input.is_action_pressed("down"):
		animations.play("walkDown")
	elif Input.is_action_pressed("up"):
		animations.play("walkUp")
	else:
		animations.play("idle")

func _physics_process(delta):
#	get_input()
	move_and_slide()
