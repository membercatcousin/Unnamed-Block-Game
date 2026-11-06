extends Node2D

@onready var physics = $button_manager/physics
@onready var audio = $AudioStreamPlayer
@onready var android = $TextureRect/EditionLabel

func _ready() -> void:
	if global.os_name != "android":
		android.hide()

func _on_back_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
	pass # Replace with function body.

func _on_physics_pressed() -> void:
	audio.play()
	if physics.text == "OPT_PHYS_OFF":
		physics.text = "OPT_PHYS_ON"
	elif physics.text == "OPT_PHYS_ON":
		physics.text = "OPT_PHYS_OFF"
	pass # Replace with function body.


func _on_fast_pressed() -> void:
	audio.play()
	pass # Replace with function body.


func _on_texture_packs_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/texture_pack_menu.tscn")
	pass # Replace with function body.


func _on_skin_change_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/skin_changer_menu.tscn")
	pass # Replace with function body.

	pass # Replace with function body.
func _on_language_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/languages_menu.tscn")
	pass # Replace with function body.
