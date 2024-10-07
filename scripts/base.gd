extends Node2D


var health = 10
var iframes = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void: 
	pass


func _on_hit_box_body_entered(_body: Node2D) -> void:
	if(iframes <= 0):
		health -= 1
		print(health)
	if health <= 0:
		queue_free() #replace with a propper death system.
