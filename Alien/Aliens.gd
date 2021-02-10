extends Node2D

onready var Alien = load("res://Alien/Alien.tscn")
onready var VP = get_viewport().size
var creating = false


func _ready():
	randomize()

func _physics_process(delta):
	if get_child_count() <= 1 and not creating:
		$Timer.start()
		creating = true

func _on_Timer_timeout():
	var alien = Alien.instance()
	alien.position = Vector2(randf() * VP.x, randf() * VP.y)
	add_child(alien)
	creating = false
