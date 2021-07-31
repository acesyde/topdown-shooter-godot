extends Node2D

onready var player: Player = $Player
onready var bullet_manager: BulletManager = $BulletManager

func _ready() -> void:
	randomize()
	GlobalSignals.connect("bullet_fired", bullet_manager, "handle_bullet_spawned")
