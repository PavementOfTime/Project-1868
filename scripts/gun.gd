extends Area2D
@onready var health_component: HealthComponent = $"../HealthComponent"
@onready var short_timer: Timer = $ShortTimer
@onready var timer: Timer = $Timer
var ammo = 6
var empty: bool
func _process(_delta: float) -> void:
	#if(auto): #this is from a removed automatic targeting system, but i feel too bad just removing it because I think this took a while to implement originally.
		#var enemies_in_range = get_overlapping_bodies()
		#if (enemies_in_range.size() > 0) && auto:
			#var target = enemies_in_range.front()
			#look_at(target.global_position - Vector2(0,5)) #if it works, it works
	#else:
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("quickfire") && able():
		shoot() #todo: add ammo and adjust timer.
		short_timer.start()
	if Input.is_action_just_pressed("shoot") && able():
		shoot()
	if Input.is_action_just_pressed("slash") && able():
		print("🤺⚔️")
	if Input.is_action_just_pressed("reload"):
		print("r")
		empty = true
		timer.start()



func able() -> bool:
	if ammo <= 0:
		empty = true
		if timer.time_left <= 0: #this is meant to add the quickfire feature but it fails horrenduously
			empty = false
			ammo = 6
			timer.start()
	else: empty = false
	
	var quickfired = (short_timer.time_left > 0)
	var dead = (health_component.health > 0)
	if((!(quickfired && dead)) && (!empty)):
		return true
	else:
		return false

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var projectile = BULLET.instantiate()
	projectile.global_position = get_parent().position - Vector2(0,10)
	projectile.global_rotation = rotation
	get_parent().get_parent().add_child(projectile)
	ammo = ammo - 1
