extends Node2D

var selected_block: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(global.reset_keybind):
		get_tree().reload_current_scene()
	pass
	
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		var tile_pos = $TileMapLayer.local_to_map(mouse_pos)
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			$TileMapLayer.erase_cell(tile_pos)
			
		if event.button_index == MOUSE_BUTTON_RIGHT:
			$TileMapLayer.set_cell(tile_pos, selected_block, Vector2i(0,0))
			
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if selected_block == 2:
				selected_block = 0
			else:
				selected_block += 1
			print("Switched to block: ", selected_block) # Debug it!

		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if selected_block == 0:
				selected_block = 2
			else:
				selected_block -= 1
