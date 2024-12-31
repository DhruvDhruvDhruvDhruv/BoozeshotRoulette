extends Node2D
@onready var animation_player: AnimationPlayer = $CanvasLayer/Shotgun/AnimationPlayer
@onready var shotgunsound: AudioStreamPlayer2D = $shotgunsound
@onready var shotreset_timer: Timer = $shotreset_timer

var shots : Array = [] # 1 is a shot, 0 is a blank
var shot_reset : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reload_gun()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fire_shot():
	print("boom")
	animation_player.play("fire")
	shotgunsound.pitch_scale = randf_range(0.925,1.1)
	shotgunsound.play(0)
	#animation_player.play("RESET")

func fire_blank():
	print("pew")
	animation_player.play("blank")
	

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and shot_reset:
		var is_a_shot : bool = !(shots[0] % 2 == 0)
		shot_reset = false
		shotreset_timer.start()
		shots.pop_front()
		if is_a_shot:
			fire_shot()
		else:
			fire_blank()
	if shots.is_empty():
		reload_gun()
		
		
func reload_gun():
	for i in range(6):
		shots.append(randi_range(0,1))

func _on_shotreset_timer_timeout() -> void:
	shot_reset = true
