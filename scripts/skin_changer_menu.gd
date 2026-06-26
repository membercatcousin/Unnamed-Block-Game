extends Node2D

@onready var audio = $AudioStreamPlayer
@onready var player = $ColorRect
@onready var colorpicker = $ColorPickerButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_color_picker_button_color_changed(color: Color) -> void:
	player.color = colorpicker.color
	global.player_color = colorpicker.color
	pass # Replace with function body.


func _on_back_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/options_menu.tscn")
	pass # Replace with function body.
