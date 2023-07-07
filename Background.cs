using Godot;
using System;

public partial class Background : Node2D
{
	[Export]
	float speed = 1;
	
	[Export]
	Node2D element1;
	[Export]
	Node2D element2;
	
	private float startingBack;
	private float startingFront;
	
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		startingFront = element1.Positon.X;
		startingBack = element2.Position.X;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		MoveWithSpeed(element1,delta);
		MoveWithSpeed(element2,delta);
		
		if(element1.Po)		
	}
	
	private Vector2 MoveWithSpeed(Node2D pVar, double delta)
	{
		pVar.Positon = new Vector2(pVar.Position.X + speed * (float)delta,pVar.Position.Y);
	}
}
