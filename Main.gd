extends Node2D

onready var player: Player = $Player
onready var bullet_manager: BulletManager = $BulletManager

func _ready() -> void:
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
