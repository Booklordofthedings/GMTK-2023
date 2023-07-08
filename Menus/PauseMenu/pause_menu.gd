extends Control

func _ready():
	visible = false

var is_paused = false : 
	set(value):
		is_paused = value
		value = false
		get_tree().paused = is_paused

func _input(event : InputEvent):
	if event.is_action_pressed("esc"):
		self.is_paused = !is_paused
		visible = is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_ResumeBtn_pressed():
	is_paused = false
	visible = is_paused

func _on_QuitBtn_pressed():
	is_paused = false
	get_tree().change_scene_to_file("res://Menus/MainMenu/MainMenu.tscn")
