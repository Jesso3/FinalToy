extends Node2D

var platform = preload("res://scenes/platforms.tscn")
var platformScript = preload("res://scripts/platforms.gd")
var width
var previousX = 0

func _ready():
	width = get_viewport().size.x
	randomize()
	var y = randi_range(-300,-400)
	while y > -1000000:
		make_platform(y)
		Global.platformsY.append(y)
		y -= randi_range(300,400)

func _physics_process(delta):
	if Global.firstBurger == 1:
		$Popups/Burger.visible = true
		Global.firstBurger = 2
	if Global.firstGummy == 1:
		$Popups/Gummy.visible = true
		Global.firstGummy = 2

func make_platform(height):
	var new_platform = platform.instantiate()
	var xPos = randi_range(-150,475)
	while (xPos > previousX-150 and xPos < previousX+150):
		xPos = randi_range(-150,475)
	previousX = xPos
	new_platform.set_position(Vector2(xPos,height))
	new_platform.set_script(platformScript)
	add_child(new_platform)
