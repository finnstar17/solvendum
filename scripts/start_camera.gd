extends Button

@onready var button_check : ColorRect = $ButtonCheck
@onready var logo_scene = get_parent()

func _on_button_down() -> void:
	button_check.color = Color(0.75, 0.75, 0.75)
	print("hi")


func _on_button_up() -> void:
	button_check.color = Color(1, 1, 1)
	print("bye")


func _on_pressed() -> void:
	logo_scene.get_node("LogoScene/AnimatedLogo").end()
	logo_scene.end()
