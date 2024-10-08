extends Control

@onready var unit01 = preload("res://enemies/plob.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("Spawning player unit: ") #print the name of the specific unit in the slot
	var unit = unit01.instantiate()
	add_child(unit)
