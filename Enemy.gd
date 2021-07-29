class_name Enemy
extends KinematicBody2D

var health: int = 100

func handle_hit() -> void:
	health -= 20
	if health <= 0:
		queue_free()
