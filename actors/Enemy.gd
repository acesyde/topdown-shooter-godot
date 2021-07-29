class_name Enemy
extends KinematicBody2D

onready var health_stat : Health = $Health

func handle_hit() -> void:
	health_stat.health -= 20
	if health_stat.health <= 0:
		queue_free()
