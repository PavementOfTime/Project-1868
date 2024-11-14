extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 1.0
var health : float
# Called when the node enters the scene tree for the first time.


func _ready() -> void:
	health = MAX_HEALTH
	print("My health is: ")
	print(health)
func damage(attack: Attack) -> void:
	health -= attack.attack_damage
	if health <= 0:
		get_parent().queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass#print(MAX_HEALTH)
