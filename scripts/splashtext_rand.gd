extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	# 1. Open the text file
	var file = FileAccess.open("res://splashes.txt", FileAccess.READ)
	
	if file:
		# 2. Get all text and split it by "New Line" (\n)
		var content = file.get_as_text()
		var splashes = content.split("\n", false) # 'false' skips empty lines
		
		# 3. Pick a random line
		if splashes.size() > 0:
			randomize()
			text = splashes[randi() % splashes.size()]
	else:
		text = "splashes.txt is missing."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
