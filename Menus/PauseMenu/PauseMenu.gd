extends Control

func _ready():
	hide

var is_paused = false:
	set(value):
			is_paused = value
			value = false
			get_tree().paused = is_paused
			
func _unhandled_input(event):
	if event.is_action_pressed("esc"):
		self.is_paused = !is_paused
