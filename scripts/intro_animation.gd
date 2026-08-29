extends CanvasLayer

@onready var logo = $LogoScene
@onready var title = $Label
@onready var button = $Button

func _ready():
	await get_tree().create_timer(1).timeout
	logo.get_node("AnimatedLogo").start()
	await get_tree().create_timer(2).timeout
	title.visible = true
	button.visible = true
	create_tween_object(title, 1)
	create_tween_object(button, 1)

func create_tween_object(node, value):
	var tween = node.create_tween()
	tween.tween_property(node, "modulate:a", value, 1)
