using Godot;
using System;

public partial class Globals : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		/*
		FileAccess.FileExists("user://savegame.sav")
		var SaveGame = FileAccess.Open("user://savegame.sav", FileAccess.ModeFlags.Write);
			SaveGame.StoreLine(score.ToString());
			*/
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void SetHighscore(int score)
	{
		if(!(GetHighscore() < score))
			return;

		GD.Print(score.ToString());
		var toSave = FileAccess.Open("user://highscore.sav", FileAccess.ModeFlags.Write);
		toSave.StoreLine(score.ToString());
	}
	public int GetHighscore()
	{
		if(FileAccess.FileExists("user://highscore.sav"))
		{
			var toRead = FileAccess.Open("user://highscore.sav", FileAccess.ModeFlags.Read);
			return int.Parse(toRead.GetLine());
		}
		return 0;
	}
}
