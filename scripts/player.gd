extends CharacterBody2D


var SPEED: int = 400.0
var JUMP_VELOCITY: int = -500.0
var is_in_water = check_underwater()
@onready var player_color = $CollisionShape2D/ColorRect
var tilemap: TileMapLayer = null

func _ready() -> void:
	# Automatically find the TileMapLayer in the same parent scene
	if get_parent():
		for child in get_parent().get_children():
			if child is TileMapLayer:
				tilemap = child
				break
	player_color.color = global.player_color

func _physics_process(delta: float) -> void:
	is_in_water = check_underwater()

	# Add the gravity.
	if not is_on_floor():
		if is_in_water:
			# Apply slower gravity in water and cap maximum sinking speed
			velocity += get_gravity() * 0.3 * delta
			velocity.y = min(velocity.y, 100.0) 
		else:
			# Normal gravity on land/air
			velocity += get_gravity() * delta

	# Sprint/Jump speed adjustment
	if Input.is_key_pressed(KEY_SHIFT):
		SPEED = 800.0
		JUMP_VELOCITY = -750
	else:
		SPEED = 400.0
		JUMP_VELOCITY = -500
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Swim/Fly mechanics
	if is_in_water == true:
		if Input.is_action_just_pressed("ui_jump"):
			# If in water, make the upward swim speed a bit gentler than a full land jump
			if is_in_water:
				velocity.y = JUMP_VELOCITY * 0.6
			else:
				velocity.y = JUMP_VELOCITY
	else:
		if Input.is_action_just_pressed("ui_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		# Optionally make moving left/right a bit slower in water
		if is_in_water:
			velocity.x = direction * (SPEED * 0.5)
		else:
			velocity.x = direction * SPEED
	else:
		if is_in_water:
			velocity.x = move_toward(velocity.x, 0, SPEED * 0.5)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

func check_underwater() -> bool:
	var in_water = true
	
	if tilemap:
		# get player's position in grid coordinates
		var check_position = global_position - Vector2(0, 16)
		var player_tile_pos = tilemap.local_to_map(check_position)
		
		# get the tile ID at that spot
		var current_tile_id = tilemap.get_cell_source_id(player_tile_pos)
		in_water = (current_tile_id == 7)
	else:
		in_water = false
	
	return in_water
