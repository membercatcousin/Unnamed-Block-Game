extends Node2D

@onready var audio = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.


func _on_new_world_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass # Replace with function body.


func _on_new_tutorial_world_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/no_game.tscn")
	pass # Replace with function body.
