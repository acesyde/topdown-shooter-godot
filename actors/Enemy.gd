class_name Enemy
extends KinematicBody2D

onready var health_stat : Health = $Health
onready var ai : AI = $AI
onready var weapon : Weapon = $Weapon

func _ready() -> void:
	ai.initialize(self, weapon)

func handle_hit() -> void:
	health_stat.health -= 20
	if health_stat.health <= 0:
		queue_free()
