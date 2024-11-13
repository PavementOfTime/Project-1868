extends Timer

@onready var plob = preload("res://characters/enemyunits/plob.tscn")

func _on_timeout() -> void:
	var plo = plob.instantiate()
	plo.position = Vector2(randf_range(0,-18), randf_range(0,18))
	add_child(plo)
