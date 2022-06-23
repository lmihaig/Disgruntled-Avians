extends Node2D

enum SlingshotStateEnum {
	Idle,
	Pull,
	Released,
	Reload
}

var SlingshotState
var Left
var Right
var Center
var radius = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	SlingshotState = SlingshotStateEnum.Idle
	Left = $LeftLine
	Right = $RightLine
	Center = $SlingshotCenter
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match SlingshotState:
		SlingshotStateEnum.Idle:
			pass
		SlingshotStateEnum.Pull:
			if Input.is_action_pressed("left_mouse"):
				var mouse_pos = get_global_mouse_position()
				var distance = Center.position.distance_to(mouse_pos)
				var mouse_dir = (mouse_pos - Center.position).normalized()
				if distance > radius:
					mouse_pos = Center.position + (mouse_dir * radius)
				Left.points[0] = mouse_pos
				Right.points[0] = mouse_pos
			else:
				var mouse_pos = get_global_mouse_position()
				var distance = Center.position.distance_to(mouse_pos)
				var velocity = Center.position - mouse_pos
				var player = get_tree().get_nodes_in_group("Player")[0]
				player = player as RigidBody2D
				player.LaunchBird()
				player.apply_impulse(Vector2(), velocity)
				GameManager.CurGameState = GameManager.GameState.Playing
		SlingshotStateEnum.Released:
			pass
		SlingshotStateEnum.Reload:
			pass
	pass


func _on_TouchArea_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		SlingshotState = SlingshotStateEnum.Pull
	pass # Replace with function body.
