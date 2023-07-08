extends CharacterBody2D

@export var speed = 400
@onready var animations = $Animation

var knockback_dir = Vector2()
var knockback_wait = 10


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		animations.play("attack")
		print(Input)

	if Input.is_action_pressed("left"):
		get_node("Sprite").set_flip_h(true)
		animations.play("walkRight")
	elif Input.is_action_pressed("right"):
		get_node("Sprite").set_flip_h(false)
		animations.play("walkRight")
	else:
		animations.play("idle")

func _physics_process(_delta):
	get_input()
	move_and_slide()
