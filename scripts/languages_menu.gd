extends Node2D
@onready var audio = $AudioStreamPlayer
@onready var android = $TextureRect/EditionLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global.os_name != "android":
		android.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_en_pressed() -> void:
	audio.play()
	await audio.finished
	TranslationServer.set_locale("en")


func _on_fr_pressed() -> void:
	audio.play()
	await audio.finished
	TranslationServer.set_locale("fr")


func _on_ro_pressed() -> void:
	audio.play()
	await audio.finished
	TranslationServer.set_locale("ro")


func _on_es_pressed() -> void:
	audio.play()
	await audio.finished
	TranslationServer.set_locale("es")


func _on_back_pressed() -> void:
	audio.play()
	await audio.finished
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
