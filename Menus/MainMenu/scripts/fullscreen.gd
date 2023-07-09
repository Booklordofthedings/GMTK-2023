extends Node

func _ready():
	pass

func _process(delta: float):
	pass
	
<<<<<<< HEAD
#func toggle_fullscreen(state: bool):
func _on_toggled(state: bool):
	DisplayServer.window_set_mode(state if DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_WINDOWED)
=======
func toggle_fullscreen(state: bool):
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if state else DisplayServer.WINDOW_MODE_WINDOWED)

>>>>>>> 0049db6 (fullscreen fix)
