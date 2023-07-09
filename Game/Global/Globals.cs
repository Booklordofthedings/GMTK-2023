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
		GD.Print(score.ToString());
		GD.Print(GetHighscore());
		if(!(GetHighscore() < score))
			return;

		var toSave = FileAccess.Open("user://highscore.sav", FileAccess.ModeFlags.Write);
		toSave.StoreLine(score.ToString());
		toSave.Close();
	}
	public int GetHighscore()
	{
		if(FileAccess.FileExists("user://highscore.sav"))
		{
			var toRead = FileAccess.Open("user://highscore.sav", FileAccess.ModeFlags.Read);
			int toReturn = 0;
			bool res = int.TryParse(toRead.GetLine(),out toReturn);
			if(res)
				return toReturn;
			return toReturn;
		}
		return 0;
	}
}
