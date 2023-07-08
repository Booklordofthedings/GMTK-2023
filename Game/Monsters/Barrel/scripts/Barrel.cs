using Godot;
using System;

public partial class Barrel : RigidBody2D
{
	[Export] Vector2 ToMove;
	[Export] Sprite2D ToRotate;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Position = new Vector2(2000, Mathf.Clamp(new Random().Next(1000),100,1000));
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		//MoveAndCollide(ToMove * (float)delta);
		ToRotate.Rotate(-1f * (float)delta);
	}

}





