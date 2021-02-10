extends Position2D

onready var VP = get_viewport()
onready var Bullet = load("res://Bullet/Bullet.tscn")
onready var Bullets = get_node("/root/Game/Bullets")

func _process(_delta):
	position = VP.get_mouse_position()
	position.x = clamp(position.x, 0, VP.get_visible_rect().size.x)
	position.y = clamp(position.y, 0, VP.get_visible_rect().size.y)
	if Input.is_action_just_pressed("fire"):
		var bullet = Bullet.instance()
		bullet.position = position
		Bullets.add_child(bullet)	
