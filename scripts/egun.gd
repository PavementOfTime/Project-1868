extends Area2D
@onready var health_component: HealthComponent = $"../HealthComponent"
@onready var timer: Timer = $ShortTimer
@onready var blob = get_parent()
var player: Player = blob.player
func _process(_delta: float) -> void:
	if able():
		shoot()

func able() -> bool:
	if timer.is_stopped():
		timer.start
		return true
	else: return false

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var projectile = BULLET.instantiate()
	projectile.global_position = get_parent().position - Vector2(0,10)
	projectile.global_rotation = rotation
	get_parent().get_parent().add_child(projectile)
