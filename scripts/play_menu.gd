extends Node2D

@onready var audio = $AudioStreamPlayer
@onready var android = $TextureRect/EditionLabel

func _ready() -> void:
	if global.os_name != "android":
		android.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
	pass # Replace with function body.


func _on_new_world_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass # Replace with function body.


func _on_new_tutorial_world_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/no_game.tscn")
	pass # Replace with function body.
