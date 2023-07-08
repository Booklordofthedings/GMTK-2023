using Godot;
using System;

public partial class MonsterSpawner : Node
{
	[Export]
	public PackedScene[] Monsters;
	[Export]
	public int[] Weights;
	[Export]
	public int Wave = 0;
	[Export]
	public Label WaveLabel;
	private float showWaveLabelTimer = 3;

	private int ToKill = 0;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		NewWave();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		showWaveLabelTimer -= (float)delta;
		if(showWaveLabelTimer < 0)
			WaveLabel.Text = "";
	}

	//Summons a new wave of enemies to attack
	public void NewWave()
	{
		Wave++;
		showWaveLabelTimer = 3;
		WaveLabel.Text = "Wave:" + Wave.ToString();


		

	}

	public void Kill()
	{
		ToKill =+ -1;
		if(ToKill < 0)
		{ //Potentially also grant new abilities
			NewWave();
		}
	}
}
