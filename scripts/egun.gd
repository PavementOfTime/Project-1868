extends Area2D
@onready var health_component: HealthComponent = $"../HealthComponent"
@onready var timer: Timer = $ShortTimer
@onready var blob = get_parent()
var player: Player
func _process(_delta: float) -> void:
	if player and able(): #null check
		look_at(player.global_position)
		shoot()

func _ready():
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0] as Player
	else:
		print("what")


func able() -> bool:
	if timer.is_stopped():
		print("pew")
		timer.start
		return true
	else: return false

func shoot():
	const BULLET = preload("res://scenes/ebullet.tscn")
	var projectile = BULLET.instantiate()
	projectile.global_position = get_parent().position - Vector2(0,10)
	projectile.global_rotation = rotation
	get_parent().get_parent().add_child(projectile)
