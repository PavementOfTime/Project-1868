extends Node2D
@onready var attack_box: CollisionShape2D = $AttackBox/AttackBox




const SPEED = 60
var canMove = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: 
	if canMove == true:
		position.x += SPEED * delta

# Called when a node on layers 1 or 2 enter
func _on_body_entered(body: Node2D) -> void:
	canMove = false

# Called when a node on layers 1 or 2 exit
func _on_body_exited(body: Node2D) -> void:
	canMove = true
