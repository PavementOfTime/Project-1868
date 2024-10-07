extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const speed = 100
var dir : Vector2
func _physics_process(_delta: float) -> void:
	velocity = dir * speed
	move_and_slide()

func _unhandled_input(_event: InputEvent) -> void:
	dir.x = Input.get_axis("left", "right")
	dir.y = Input.get_axis("up", "down")
	dir = dir.normalized()
