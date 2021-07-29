class_name Bullet
extends Area2D

export (int) var speed = 10

onready var kill_timer: Timer = $KillTimer

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	kill_timer.start()

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity

func set_direction(direction: Vector2) -> void:
	self.direction = direction
	rotation += direction.angle()

func _on_KillTimer_timeout() -> void:
	queue_free()

func _on_Bullet_body_entered(body: Node) -> void:
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()
