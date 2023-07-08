using Godot;
using System;

public partial class ScoreLogic : Node
{
	[Export]
	public Label scoreLabel;
	private float score = 0;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		if(FileAccess.FileExists("user://savegame.sav"))
		{
			var toRead = FileAccess.Open("user://savegame.sav", FileAccess.ModeFlags.Read);
			score = float.Parse(toRead.GetLine());
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if(Input.GetActionStrength("Kill") > 0)
		{
			OnClose();
			GetTree().ChangeSceneToFile("res://Shop/Shop.tscn");
		}


		score += (float)delta * 10;
		scoreLabel.Text = "Score: " + ((int)score).ToString();

	}

	public void OnClose()
	{
			var SaveGame = FileAccess.Open("user://savegame.sav", FileAccess.ModeFlags.Write);
			SaveGame.StoreLine(score.ToString());
	}
}