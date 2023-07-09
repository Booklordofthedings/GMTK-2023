extends CharacterBody2D

@export var normalspeed = 400
@export var Progressar : TextureProgressBar
@export var bashbar : TextureProgressBar

@onready var animations = $Animation

var knockback_dir = Vector2()
var knockback_wait = 10

var activeTimer = 3;

const dashspeed = 1200
const dashlength = .1
var lastDash = 2

@onready var dash = $Dash

func _ready():
	get_node("Scythe").set_process_mode(PROCESS_MODE_DISABLED)

func get_input():
	if Input.is_action_just_pressed("dash") and lastDash < 0:
		lastDash = 2
		dash.start_dash(dashlength)
	var speed = dashspeed if dash.is_dashing() else normalspeed
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _process(_delta):
	if Input.is_action_just_pressed("attack") and activeTimer <= 0:
		animations.play("attack")
		get_node("Scythe").set_process_mode(PROCESS_MODE_ALWAYS)
		activeTimer = 3
		
	lastDash = lastDash - _delta
	activeTimer = activeTimer - _delta
	Progressar.value = 4 - activeTimer
	bashbar.value = 2 - clamp(lastDash,0,2)
	if activeTimer <= 2.5:
		get_node("Scythe").set_process_mode(PROCESS_MODE_DISABLED)

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

func _on_area_2d_body_entered(body):
	body.queue_free()
