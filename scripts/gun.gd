extends Area2D


func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target = enemies_in_range.front()
		look_at(target.global_position)

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
