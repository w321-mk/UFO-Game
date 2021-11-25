extends Node

export (NodePath) var player
var Player
var offset : Vector2

func _ready():
	if player == null:
		Player = load("res://Player/Player.tscn")
	else:
		Player = get_node(player)
	offset = $".".position - Player.position

func _process(_delta):
	$".".position = Player.position + offset
