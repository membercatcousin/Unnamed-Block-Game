extends Control

var time: float = 0.0

func _process(delta):
	time += delta
	
	# The "Bop" Math:
	# sin(time * speed) * intensity + base_scale
	var bop = sin(time * 5.0) * 0.1 + 1.0
	
	scale = Vector2(bop, bop)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
