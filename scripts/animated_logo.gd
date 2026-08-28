extends Node3D

var speed = 0.0

func start():
	var length = 2.0

	create_tween_object(self, Tween.EASE_OUT, Tween.TRANS_CUBIC, length, 1, -2.0)
	create_tween_object($TopMesh, Tween.EASE_IN_OUT, Tween.TRANS_CUBIC, length, 2, 0.75) 
	create_tween_object($BottomMesh, Tween.EASE_IN_OUT, Tween.TRANS_CUBIC, length, 2, -0.75) 
	create_tween_object($Diagonal, Tween.EASE_IN_OUT, Tween.TRANS_CUBIC, length, 3, deg_to_rad(60.0)) 
	create_tween_object($Diagonal, Tween.EASE_IN_OUT, Tween.TRANS_CUBIC, length, 4, 4.0)

	await get_tree().create_timer(length / 2).timeout

	create_tween_object(speed, Tween.EASE_IN_OUT, Tween.TRANS_LINEAR, length, 5, 1.0)

func _process(delta):
	rotate_y(speed * delta)

func create_tween_object(node, easen : Tween.EaseType, trans : Tween.TransitionType, time : float, type : int, goal : float):
	var tween = create_tween()
	tween.set_ease(easen)
	tween.set_trans(trans)
	if type == 1:
		tween.tween_property(node, "position:z", goal, time)
	elif type == 2:
		tween.tween_property(node, "position:y", goal, time)
	elif type == 3:      
		tween.tween_property(node, "rotation:z", goal, time)
	elif type == 4:      
		tween.tween_property(node, "scale:x", goal, time)
	elif type == 5:
		tween.tween_method(set_speed, speed, goal, time)
		
func set_speed(number):
	speed = number
	
