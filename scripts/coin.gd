extends Area2D


func _on_body_entered(body: Node2D) -> void: #Testing something
	print("+1 Coin")
	queue_free()
