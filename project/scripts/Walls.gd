extends StaticBody2D

func _process(delta):
	position.y = Global.playerY+250
	$"../Background".position.y = Global.playerY+250
