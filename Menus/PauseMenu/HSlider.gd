extends HSlider

func _on_value_changed(value):
	Globals.SetMasterVolume(value)
	get_node("../../../../../../MainMenu/StartOptions/Container/TitleOptions/Containers/Volume").set_value_no_signal(value)
