extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10
var health : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: Attack) -> void:
	health -= attack.attack_damage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	print(MAX_HEALTH)
