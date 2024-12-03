extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 1.0
var health = MAX_HEALTH
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	health = MAX_HEALTH
func damage(attack: Attack) -> void:
	health -= attack.attack_damage
	if health <= 0:
		if(get_parent().is_in_group("player")):
			get_parent().visible = false
		else:
			get_parent().queue_free()
