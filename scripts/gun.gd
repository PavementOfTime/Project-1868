extends Area2D
var auto = false
@onready var health_component: HealthComponent = $"../HealthComponent"
func targeting() -> void:
	if Input.is_action_just_pressed("targeting"):
		auto = !auto
		#print("Changing Targeting...")

func _physics_process(_delta: float) -> void:
	if(auto):
		var enemies_in_range = get_overlapping_bodies()
		if (enemies_in_range.size() > 0) && auto:
			var target = enemies_in_range.front()
			look_at(target.global_position - Vector2(0,5)) #iiwiw
	else:
		look_at(get_global_mouse_position())
		if Input.is_action_just_pressed("shoot") && health_component.health > 0:
			shoot()
	targeting()


func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var projectile = BULLET.instantiate()
	projectile.global_position = get_parent().position - Vector2(0,10)
	projectile.global_rotation = rotation
	if auto:
		projectile.speed = 250
	get_parent().get_parent().add_child(projectile)
	

func _on_timer_timeout() -> void:
	if(auto && health_component.health > 0):
		var enemies_in_range = get_overlapping_bodies()
		if enemies_in_range.size() > 0:
			shoot()
