extends CharacterBody2D
class_name Enemy

const speed: int = 40

@export var player: Player#get_tree.get_first_node_in_group("Player")
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var hp: HealthComponent = $HealthComponent

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()


func makepath() -> void:
	nav_agent.target_position = player.global_position
	

func _on_timer_timeout() -> void:
	if player != null:
		makepath()

# :3
