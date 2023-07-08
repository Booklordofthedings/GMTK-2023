extends CharacterBody2D

@export var speed = 400
@onready var animations = $Animation

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _process(_delta):
	if Input.is_action_pressed("left"):
		get_node("Sprite").set_flip_h(true)
	else:
		get_node("Sprite").set_flip_h(false)
		animations.play("walkRight")

func _physics_process(delta):
	get_input()
	move_and_slide()
