extends Node

@export var MonsterSpawner: PackedScene
var _MonsterSpawner: Node
@export var _King: NodePath
@export var Player: PackedScene
var _Player: Node

@export var scoreLabel: Label
var score: float = 0
var highscore: int = 0
var life: int = 10
@export var lifebar: TextureProgressBar


func _ready():
	highscore = int(get_node("/root/Globals").call("GetHighscore"))
	randomize()
	if FileAccess.file_exists("user://savegame.sav"):
		var toRead = FileAccess.open("user://savegame.sav", FileAccess.READ)
		score = float(toRead.get_line())

	_MonsterSpawner = MonsterSpawner.instantiate()
	_Player = Player.instantiate()
	add_child(_MonsterSpawner)
	add_child(_Player)


func _process(delta: float):
	if Input.get_action_strength("Kill") > 0:
		on_close()
#		get_tree().change_scene("res://Menus/Shop/Shop.tscn")

	score += delta * 10
	scoreLabel.text = "Score: " + str(int(score)) + "\n" + "Highscore: " + str(highscore)

func on_close():
	var SaveGame = FileAccess.open("user://savegame.sav", FileAccess.WRITE)
	SaveGame.store_line(str(score))
