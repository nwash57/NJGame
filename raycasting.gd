
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var rect
var noticed

func _ready():
	# Initialization here
	rect = Rect2(Vector2(75, 75), Vector2(32, 32))
	set_fixed_process(true)
	set_process(true)

func _fixed_process(delta):
	var space_state = get_world_2d().get_direct_space_state()
	var result = space_state.intersect_ray(get_tree().get_nodes_in_group("player")[0].get_pos(), get_tree().get_nodes_in_group("enemy")[0].get_pos(), [self])
	if (result.empty()):
		noticed = false
	else:
		print(result)
		noticed = true
	print(get_tree().get_nodes_in_group("enemy")[0].get_pos())
	
func _draw():
	if (noticed):
		draw_rect(rect, Color(1,0,0))
	else:
		draw_rect(rect, Color(0,0,1))
	


