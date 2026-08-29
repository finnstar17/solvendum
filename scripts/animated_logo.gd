extends Node3D

var speed = 0.0

func start():
	var length = 2.0

	create_tween_object(get_parent().get_node("SubViewportContainer"), Tween.EASE_IN, Tween.TRANS_CUBIC, length, 1, Color(1, 1, 1, 1), "modulate")

	create_tween_object(self, Tween.EASE_OUT, Tween.TRANS_CUBIC, length, 1, -2.0, "position:z")
	create_tween_object($TopMesh, Tween.EASE_IN_OUT, Tween.TRANS_QUART, length, 1, 0.75, "position:y") 
	create_tween_object($BottomMesh, Tween.EASE_IN_OUT, Tween.TRANS_QUART, length, 1, -0.75, "position:y") 
	create_tween_object($Diagonal, Tween.EASE_IN_OUT, Tween.TRANS_QUART, length, 1, deg_to_rad(60.0), "rotation:z") 
	create_tween_object($Diagonal, Tween.EASE_IN_OUT, Tween.TRANS_QUART, length, 1, 4.0, "scale:x")

	await get_tree().create_timer(length * (3.0 / 4.0)).timeout

	create_tween_object(speed, Tween.EASE_IN_OUT, Tween.TRANS_LINEAR, length, 2, 1.5, "")

func end():
	var length = 2.0

	create_tween_object(self, Tween.EASE_IN, Tween.TRANS_CUBIC, length, 1, -7, "position:z")
	create_tween_object($TopMesh, Tween.EASE_IN_OUT, Tween.TRANS_QUART, length, 1, 0, "position:y") 
	create_tween_object($BottomMesh, Tween.EASE_IN_OUT, Tween.TRANS_QUART, length, 1, 0, "position:y") 
	create_tween_object($Diagonal, Tween.EASE_IN_OUT, Tween.TRANS_QUART, length, 1, 0, "rotation:z") 
	create_tween_object($Diagonal, Tween.EASE_IN_OUT, Tween.TRANS_QUART, length, 1, 0.75, "scale:x")
	create_tween_object(speed, Tween.EASE_IN_OUT, Tween.TRANS_LINEAR, length, 2, 3.0, "")

	create_tween_object(get_parent().get_node("SubViewportContainer"), Tween.EASE_OUT, Tween.TRANS_CUBIC, length, 1, Color(1, 1, 1, 0), "modulate")

func _process(delta):
	rotate_y(speed * delta)

func create_tween_object(node, easen : Tween.EaseType, trans : Tween.TransitionType, time : float, type : int, goal, string : String):
	var tween = create_tween()
	tween.set_ease(easen)
	tween.set_trans(trans)
	if type == 1:
		tween.tween_property(node, string, goal, time)
	elif type == 2:
		tween.tween_method(set_speed, speed, goal, time) # you might be wondering what this mess is. i dont know either im just making this for my math video assignment let me be
		
func set_speed(number):
	speed = number
	
