extends Node

func _ready():
	pass

func _process(delta: float):
	pass
	
#func toggle_fullscreen(state: bool):
func _on_toggled(state: bool):
	DisplayServer.window_set_mode(state if DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_WINDOWED)
