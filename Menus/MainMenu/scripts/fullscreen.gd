extends Node

func _ready():
	pass

func _process(delta: float):
	pass
	
func toggle_fullscreen(state: bool):
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if state else DisplayServer.WINDOW_MODE_WINDOWED)
