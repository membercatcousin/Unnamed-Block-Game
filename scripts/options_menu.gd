extends Node2D

@onready var reset = $button_manager/reset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global.reset_keybind == KEY_F5:
		reset.text = "Reset Game Key: F5"
	elif global.reset_keybind == KEY_R:
		reset.text = "Reset Game Key: R"
	elif global.reset_keybind == KEY_ESCAPE:
		reset.text = "Reset Game Key: esc"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.

func _on_reset_pressed() -> void:
	if global.reset_keybind == KEY_F5:
		global.reset_keybind = KEY_R
		reset.text = "Reset Game Key: R"
	elif global.reset_keybind == KEY_R:
		global.reset_keybind = KEY_ESCAPE
		reset.text = "Reset Game Key: esc"
	elif global.reset_keybind == KEY_ESCAPE:
		global.reset_keybind == KEY_F5
		reset.text = "Reset Game Key: esc"
	pass # Replace with function body.
