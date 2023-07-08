using Godot;
using System;
using System.Collections.Generic;

public partial class MonsterSpawner : Node
{
	[Export]
	public PackedScene[] Monsters;

	[Export]
	public int Wave;
	[Export]
	public Label WaveLabel;
	private float showWaveLabelTimer = 3;

	private int ToKill = 0;
	
	private List<PackedScene> Items = new List<PackedScene>();

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

		int WavePower = 2 + (int)(Wave * 1.5f);
		WaveLabel.Text = "Wave:" + Wave.ToString();


		Random ran = new Random();
		for(int i = 0; i < WavePower; i++)
		{
			TimerFunction(ran, WavePower, i);
		}
		
	}

	public void Kill()
	{
		ToKill =+ -1;
		if(ToKill < 0)
		{ //Potentially also grant new abilities
			NewWave();
		}
	}

	private async void TimerFunction(Random ran, int WavePower, int i)
	{
		await ToSignal(GetTree().CreateTimer(0.5f * i), "timeout");
		AddChild(
			Monsters[
				ran.Next(
					Mathf.Clamp(WavePower,0, Monsters.Length)
				)
			].Instantiate()
		);
	} 
}
