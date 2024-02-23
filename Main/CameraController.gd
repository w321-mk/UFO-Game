extends Camera2D

@export var player : NodePath

var Player
var player_offset : Vector2

func _ready():
	if player == null:
		Player = load("res://Player/Player.tscn")
	else:
		Player = get_node(player)
	player_offset = self.position - Player.position

func _process(_delta):
	self.position = Player.position + player_offset
