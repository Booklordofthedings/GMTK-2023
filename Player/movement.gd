extends CharacterBody2D

@export var speed = 400
@onready var animations = $AnimationPlayer

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _process(_delta):
	if Input.is_action_pressed("down"):
		animations.play("walkDown")
	elif Input.is_action_pressed("up"):
		animations.play("walkUp")
	elif Input.is_action_pressed("left"):
		get_node("Sprite2D").set_flip_h(true)
		animations.play("walkLeft")
	elif Input.is_action_pressed("right"):
		get_node("Sprite2D").set_flip_h(false)
		animations.play("walkRight")
	else:
		animations.stop()

func _physics_process(delta):
	get_input()
	move_and_slide()