using Godot;
using System;

public partial class Death_Menu : Control
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void _on_resume_btn_pressed()
	{
		GetTree().ChangeSceneToFile("res://Game/MainGame/Game.tscn");
	}
	
	public void _on_end_pressed()
	{
		GetTree().ChangeSceneToFile("res://Menus/MainMenu/MainMenu.tscn");
	}
}
