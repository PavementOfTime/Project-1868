extends Area2D

var life = 0
#var bullet_direction
func _physics_process(delta: float) -> void:
	const SPEED = 250
	const RANGE = 510
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
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
