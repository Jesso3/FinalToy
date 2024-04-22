extends StaticBody2D

var state = -1 # 0 = nothing, 1 = height, 2 = jumps

func _ready():
	randomize()
	var upgrade = randi_range(0,100)
	if upgrade < 5:
		$upgrade/texture.play("Height")
		state = 1
	elif upgrade >= 95:
		$upgrade/texture.play("Jumps")
		state = 2
	else:
		$upgrade/texture.play("Nothing")
		state = 0


func _on_upgrade_body_entered(body):
	if Global.touchedGround:
		if state == 1:
			Global.jumpVelocity -= 50
			$PowerUp.play()
		elif state == 2:
			Global.maxJumps += 1
			$PowerUp.play()
		$upgrade/texture.play("Nothing")
		state = 0
		
