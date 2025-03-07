extends Timer

@onready var plob = preload("res://characters/enemyunits/plob.tscn")
@onready var player = get_parent().get_parent().get_node("./Player")
func _on_timeout() -> void: #YESSSS I GOT IT TO WORK :D
	var plo = plob.instantiate()
	plo.position = Vector2(randf_range(-290,290), randf_range(-290,290))
	plo.player = player
	add_child(plo)
	if player.visible == false:
		stop()
