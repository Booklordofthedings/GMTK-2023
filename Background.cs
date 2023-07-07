using Godot;
using System;

public partial class Background : Node2D
{
	[Export]
	float ScrollSpeed = 200;
	
	[Export]
	Node2D fst;
	[Export]
	Node2D lst;
	
	private float start; //Point at which the first element is reset
	private float end; //Point at which the last element is reset
	private bool first = true;
	
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		start = fst.Position.X;
		end = lst.Position.X;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		fst.Position = MoveWithSpeed(fst,delta);
		lst.Position = MoveWithSpeed(lst,delta);
		if(first)
		{
				if(lst.Position.X >= start)
				{
					fst.Position = new Vector2(end,lst.Position.Y);
					first = false;
				}
		}
		else
		{
				if(fst.Position.X >= start)
				{
					lst.Position = new Vector2(end,fst.Position.Y);
					first = true;
				}
		}
	
		
	}
	
	private Vector2 MoveWithSpeed(Node2D pVar, double delta)
	{
		return new Vector2(pVar.Position.X + ScrollSpeed * (float)delta,pVar.Position.Y);
	}
}
