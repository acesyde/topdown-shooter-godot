extends KinematicBody2D

export (int) var speed = 100
export (PackedScene) var Bullet

onready var end_of_gun : Position2D = $EndOfGun

func _physics_process(delta: float) -> void:
	var movement_direction := Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		movement_direction.y = -1
	if Input.is_action_pressed("down"):
		movement_direction.y = 1
	if Input.is_action_pressed("left"):
		movement_direction.x = -1
	if Input.is_action_pressed("right"):
		movement_direction.x = 1
		
	movement_direction  = movement_direction.normalized()
		
	move_and_slide(movement_direction * speed)
	
	look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()

func shoot():
	var bullet_instance: Bullet = Bullet.instance()
	bullet_instance.global_position = end_of_gun.global_position
	get_parent().add_child(bullet_instance)
	var target = get_global_mouse_position()
	var direction_to_mouse = bullet_instance.global_position.direction_to(target).normalized()
	bullet_instance.set_direction(direction_to_mouse)
