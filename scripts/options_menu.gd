extends Node2D

@onready var physics = $button_manager/physics
@onready var audio = $AudioStreamPlayer


func _on_back_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
	pass # Replace with function body.

func _on_physics_pressed() -> void:
	audio.play()
	if physics.text == "Legacy Physics: OFF":
		physics.text = "Legacy Physics: ON"
	elif physics.text == "Legacy Physics: ON":
		physics.text = "Legacy Physics: OFF"
	pass # Replace with function body.


func _on_fast_pressed() -> void:
	audio.play()
	pass # Replace with function body.


func _on_texture_packs_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/texture_pack_menu.tscn")
	pass # Replace with function body.
