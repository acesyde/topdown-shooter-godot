class_name Weapon
extends Node2D

export (PackedScene) var Bullet

var team: int = -1

onready var end_of_gun : Position2D = $EndOfGun
onready var gun_direction : Position2D = $GunDirection
onready var attack_cooldown : Timer = $AttackCooldown
onready var animation_player : AnimationPlayer = $AnimationPlayer

func initialize(team: int) -> void:
	self.team = team

func shoot():
	if attack_cooldown.is_stopped() and Bullet != null:
		var bullet_instance: Bullet = Bullet.instance()
		var direction = gun_direction.global_position - end_of_gun.global_position
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, team, end_of_gun.global_position, direction.normalized())
		attack_cooldown.start()
		animation_player.play("muzzle_flash")
