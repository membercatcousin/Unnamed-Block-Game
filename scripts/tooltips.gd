extends Node2D

var is_hidden: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_F1):
		if is_hidden == false:
			hide()
			is_hidden = true
		if is_hidden == true:
			show()
			is_hidden = false
	pass
