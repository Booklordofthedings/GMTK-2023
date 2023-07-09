extends RigidBody2D

@export var ToMove : Vector2
@export var ToRotate : Sprite2D

func _ready():
	position = Vector2(2000, clamp(randi() % 1000, 120, 1000))

func _process(delta: float):
	ToRotate.rotate(-1.0 * delta)

func _on_body_entered(body: Node) -> void:
	queue_free()
