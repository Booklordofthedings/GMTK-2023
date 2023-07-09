extends TextureButton


func _ready():
	grab_focus() 

func _process(delta):
	pass


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Game/MainGame/Game.tscn")
