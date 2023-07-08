using Godot;
using System;

public partial class startGame : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	public void Onclick()
	{
		GetTree().ChangeSceneToFile("res://Game/Game.tscn");
	}
}
