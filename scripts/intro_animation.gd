extends CanvasLayer

@onready var logo = $LogoScene
@onready var title = $Label
@onready var button = $Button
@onready var color_rect = $ColorRect

func _ready():
	logo.get_node("AnimatedLogo").start()
	await get_tree().create_timer(2).timeout
	title.visible = true
	button.visible = true
	create_tween_object(title, 1)
	create_tween_object(button, 1)

func end():
	create_tween_object(title, 0)
	create_tween_object(button, 0)
	await get_tree().create_timer(1).timeout
	create_tween_object(color_rect, 1)
	title.visible = false
	button.visible = false
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/camera_scene.tscn")

func create_tween_object(node, value):
	var tween = node.create_tween()
	tween.tween_property(node, "modulate:a", value, 1)
