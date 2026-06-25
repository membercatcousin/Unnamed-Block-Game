extends Node

var VERSION = ProjectSettings.get_setting("application/config/version")
var os_name = OS.get_name()
var debug = OS.is_debug_build()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Application ID
	DiscordRPC.app_id = 1515102497604112424
	# this is boolean if everything worked
	print("Discord working: " + str(DiscordRPC.get_is_discord_working()))
	# Set the first custom text row of the activity here
	DiscordRPC.details = "Playing unnamed block game!"
	# Image key for small image from "Art Assets" from the Discord Developer website
	DiscordRPC.large_image = "game"
	# Tooltip text for the large image
	DiscordRPC.large_image_text = "game"
	# Always refresh after changing the values!
	DiscordRPC.refresh()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
