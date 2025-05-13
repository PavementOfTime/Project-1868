extends Area2D

var life = 0
const SPEED = 500
var speed = -1
const RANGE = 510

func _ready() -> void:
	if speed <= -1:
		speed = SPEED
#var bullet_direction
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
	life += SPEED * delta
	if life > RANGE:
		queue_free()

func _on_hitbox_component_area_entered(area: Area2D) -> void:
	if(area.is_in_group("player")):
		if(area.get_parent().name == ("Player")):
			queue_free()
			var attack = Attack.new()
			attack.attack_damage = 1.0
			attack.knockback_force = 0.1
			area.get_parent().get_node("HealthComponent").damage(attack) #:D
