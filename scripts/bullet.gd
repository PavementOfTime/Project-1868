extends Area2D

var life = 0

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	life += SPEED * delta
	if life > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_node("HealthComponent"):
		var attack: Attack
		attack.attack_damage = 10
		attack.knockback_force = 0
		body.damage(attack)
