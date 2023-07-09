extends Control

@export var toLabel : Label


func _ready():
	var globals = get_node("/root/Globals")
	var score = int(globals.get("score"))
	var highscore = int(globals.call("GetHighscore"))
	
	toLabel.text = "Score: " + str(score) + "\n" + "Highscore: " + str(highscore)

func _process(delta: float):
	pass

func _on_resume_btn_pressed():
	get_tree().change_scene_to_file("res://Game/MainGame/Game.tscn")

func _on_end_pressed():
	get_tree().change_scene_to_file("res://Menus/MainMenu/MainMenu.tscn")

