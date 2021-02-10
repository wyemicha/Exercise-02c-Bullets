extends Area2D

onready var VP = get_viewport().size
onready var Explosions = get_node("/root/Game/Explosions")
var Explosion = load("res://Explosion/Explosion.tscn")






func _on_Bullet_body_entered(body):
	var explosion = Explosion.instance()
	explosion.global_position = global_position
	Explosions.add_child(explosion)
	body.queue_free()
	queue_free()
