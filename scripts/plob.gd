extends CharacterBody2D
class_name Enemy
const speed: int = 20

@export var player: Player#get_tree.get_first_node_in_group("Player")
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var hp: HealthComponent = $HealthComponent
var isItDeadYet = false

func _physics_process(_delta: float) -> void:
	if !isItDeadYet:
		var dir = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * speed
		move_and_slide()


func makepath() -> void:
	nav_agent.target_position = player.global_position
	
func _on_timer_timeout() -> void:
	if player.health_component.health > 0:
		makepath()
	else:
		isItDeadYet = true
# :3

func _on_hitbox_component_area_entered(area: Area2D) -> void:
	if(area.is_in_group("player")):
		if(area.get_parent().name == ("Player")):
			queue_free()
			var attack = Attack.new()
			attack.attack_damage = 1.0
			attack.knockback_force = 0.1
			area.get_parent().get_node("HealthComponent").damage(attack) #:D
