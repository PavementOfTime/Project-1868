extends Area2D
var auto = true
func targeting() -> void:
	if Input.is_key_pressed(KEY_CTRL):
		auto = !auto
		print("Changing Targeting...")

func _physics_process(_delta: float) -> void:
	targeting()
	if(auto):
		var enemies_in_range = get_overlapping_bodies()
		if (enemies_in_range.size() > 0) && auto:
			var target = enemies_in_range.front()
			look_at(target.global_position)
	

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var projectile = BULLET.instantiate()
	look_at(get_global_mouse_position())
	projectile.global_position = $WeaponPivot/Weapon/ShootingPoint.position
	#projectile.rotation = rotation
	$WeaponPivot/Weapon/ShootingPoint.add_child(projectile)

func _on_timer_timeout() -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		shoot()
