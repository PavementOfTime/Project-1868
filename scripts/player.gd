extends CharacterBody2D
class_name Player
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_component: HealthComponent = $HealthComponent

const speed = 80
var dir : Vector2

func _process(_delta: float) -> void:
	#Plays animations based on dir
	if dir.x != 0 or dir.y != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")


func _physics_process(_delta: float) -> void:
	velocity = dir * speed
	if health_component.health > 0:
		move_and_slide()

func _unhandled_input(_event: InputEvent) -> void:
	dir.x = Input.get_axis("left", "right")
	dir.y = Input.get_axis("up", "down")
	
	dir = dir.normalized()
