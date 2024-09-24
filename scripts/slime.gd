extends Node2D
#https://youtu.be/LOhfqjmasi0?si=bhkop6fPXXsjsRlE&t=3067 Where I'm at. Thanks Brackeys :3
const SPEED = 60
@onready var raycast_l: RayCast2D = $RaycastL
@onready var raycast_r: RayCast2D = $RaycastR
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame. Basically act or whatever from gf
func _process(delta: float) -> void:
	if raycast_r.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if raycast_l.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta
	
