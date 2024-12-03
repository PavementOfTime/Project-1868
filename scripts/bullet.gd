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


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_node("HealthComponent"):
		var attack = Attack.new()
		attack.attack_damage = 1.0
		attack.knockback_force = 0.1
		body.get_node("HealthComponent").damage(attack) #:D
