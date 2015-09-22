extends Node2D

var player
var target_pos
var rotation
var screen_size
var player_pos
export(float) var move_speed

func _ready():
	player = get_node("player")
	target_pos = Vector2(0,0)
	screen_size = get_viewport_rect().size
	
	player_pos = player.get_pos()
	
	move_speed = 0
	
	
	
	set_process(true)
	set_process_input(true)
	set_fixed_process(true)
	
func _process(delta):
	
	if (player_pos != target_pos):
		var tp_vector = tp_vector()
		rotation = -atan(tp_vector.y/tp_vector.x) - 3.14/2
		if (target_pos.x < 0):
			rotation += 3.14
		player.set_rot(rotation)
		
	var direction = tp_vector().normalized()
	player_pos += direction*move_speed*delta
	player.set_pos(player_pos)
		
func _input(ev):
	if (ev.type == InputEvent.MOUSE_BUTTON):
		target_pos = ev.pos
		target_pos.x -= screen_size.x/2
		target_pos.y -= screen_size.y/2
		move_speed = 200
		print("tp: " + str(target_pos))
		print("player_pos: " + str(player.get_pos()))
		print("player_pip: " + str(player.get_position_in_parent()))

func tp_vector():
	return Vector2(target_pos.x - player_pos.x, target_pos.y - player_pos.y)
	

