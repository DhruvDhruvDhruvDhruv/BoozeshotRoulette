extends Control

var shell_array : Array = [1,0,1,1,0,0]
const BLANK_SHELL_TEXTURE = preload("res://assets/sprites/BlankShell.png")
const LIVE_SHELL_TEXTURE = preload("res://assets/sprites/LiveShell.png")
@onready var ammo_array: Control = %AmmoArray

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func load_shells() -> void:
	for val in shell_array:
		var texture_rect = TextureRect.new()
		texture_rect.texture = LIVE_SHELL_TEXTURE if val == 1 else BLANK_SHELL_TEXTURE
		texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		texture_rect.rotation_degrees = 90
		texture_rect.scale = Vector2(10, 10)
		var control_holder = Control.new()
		control_holder.add_child(texture_rect)
		#wait(0.4)
		ammo_array.add_child(control_holder)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	load_shells()
