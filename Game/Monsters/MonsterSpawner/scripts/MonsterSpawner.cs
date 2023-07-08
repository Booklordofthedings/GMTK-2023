using Godot;
using System;
using System.Collections.Generic;

public partial class MonsterSpawner : Node
{
	[Export]
	public PackedScene Monsters;
	private float toTime = 0.5f;
	private float Timer = 0;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Timer = toTime;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Timer -= (float)delta;
		if(Timer < 0)
		{
			AddChild(Monsters.Instantiate());
			Timer = toTime;
		}
			
	}

	


	
}
