extends HSlider

func _on_value_changed(value):
	Globals.SetMasterVolume(value)
	get_node("../../../../../../PauseMenu/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HSlider").set_value_no_signal(value)
