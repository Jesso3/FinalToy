extends StaticBody2D

var state = -1 # 0 = nothing, 1 = height, 2 = jumps

func _ready():
	randomize()
	var upgrade = randi_range(0,100)
	if upgrade < 10:
		$upgrade/texture.play("Height")
		state = 1
	elif upgrade >= 90:
		$upgrade/texture.play("Jumps")
		state = 2
	else:
		$upgrade/texture.play("Nothing")
		state = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_upgrade_body_entered(body):
	if Global.touchedGround:
		print("hi")
		if state == 1:
			Global.jumpVelocity -= 50
		elif state == 2:
			Global.maxJumps += 1
		$upgrade/texture.play("Nothing")
		state = 0
		
