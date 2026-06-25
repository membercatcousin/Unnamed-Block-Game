extends Node2D

@onready var debug_label = $CanvasLayer/Label

func _process(delta: float) -> void:
	# We calculate these inside _process so they update every frame
	var ram = Performance.get_monitor(Performance.MEMORY_STATIC) / 1024 / 1024
	var fps = Engine.get_frames_per_second()
	
	if global.debug == true:
		debug_label.text = "DEV BUILD DETECTED! DEBUG MODE IS ON.\nVERSION: %s\nOS: %s\nFPS: %d\nRAM: %.2f MB" % [global.VERSION, global.os_name, fps, ram]
