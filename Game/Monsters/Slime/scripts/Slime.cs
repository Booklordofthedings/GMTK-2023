using Godot;
using System;

public partial class Slime : Node2D
{
	[Export]
	float speed = 200;


	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Position = new Vector2(1000, 100+ new Random().Next(900));
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Position = new Vector2(Position.X - 200 * (float)delta, Position.Y );
		
		if(Position.X < 0-40)
			QueueFree();
	}
}
