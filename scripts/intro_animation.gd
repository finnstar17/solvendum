extends CanvasLayer

@onready var logo = $LogoScene
@onready var viewport = $LogoScene/SubViewportContainer

func _ready():
	await get_tree().create_timer(1).timeout

	viewport.visible = true
	logo.get_node("AnimatedLogo").start()
	
