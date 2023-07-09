extends Node

var score : int = 0

func _ready():
	pass

func _process(delta):
	pass

func SetHighscore(score : int): 
	if GetHighscore() > score:
		return
	else:
		var toSave = FileAccess.open("user://highscore.sav", FileAccess.WRITE)
		toSave.store_line("%s" % score)
	
	
func GetHighscore():
	if not FileAccess.file_exists("user://highscore.sav"):
		return 0
		
	var toRead = FileAccess.open("user://highscore.sav",FileAccess.READ)
	var toReturn : int = 0
	var res = toRead.get_line().to_int()
	return res
	
func SetMasterVolume(value : float):
	var masterBus = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(masterBus, value)
	
	if value <= -80:
		AudioServer.set_bus_mute(masterBus, true)
	else:
		AudioServer.set_bus_mute(masterBus, false)

