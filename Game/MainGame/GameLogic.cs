using Godot;
using System;

public partial class GameLogic : Node
{
	[ExportCategory("ToInstantiate")]
	[Export] PackedScene MonsterSpawner;
	private Node _MonsterSpawner;
	[Export]
	private Node _King;
	[Export] PackedScene Player;
	private Node _Player;



	[ExportCategory("Other")]
	[Export]
	public Label scoreLabel;
	private float score = 0;
	private int highscore = 0;
	[ExportCategory("KingData")]
	private int life = 10;
	[Export] TextureProgressBar lifebar;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
		highscore = ((int)GetNode("/root/Globals").Call("GetHighscore"));
		GD.Randomize();
		if(FileAccess.FileExists("user://savegame.sav"))
		{
			var toRead = FileAccess.Open("user://savegame.sav", FileAccess.ModeFlags.Read);
			score = float.Parse(toRead.GetLine());
		}


		_MonsterSpawner = MonsterSpawner.Instantiate();
		_Player = Player.Instantiate();
		AddChild(_MonsterSpawner);
		AddChild(_Player);

	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if(Input.GetActionStrength("Kill") > 0)
		{
			OnClose();
			GetTree().ChangeSceneToFile("res://Menus/Shop/Shop.tscn");
		}


		score += (float)delta * 10;
		scoreLabel.Text = "Score: " + ((int)score).ToString() + "\n" + "Highscore: " + highscore.ToString() ;

	}

	public void OnClose()
	{
			var SaveGame = FileAccess.Open("user://savegame.sav", FileAccess.ModeFlags.Write);
			SaveGame.StoreLine(score.ToString());
	}

}
