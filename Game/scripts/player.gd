extends CharacterBody2D


var speed = 300.0

var gravity = 980

var jumps = 0

var air = true


func _physics_process(delta):

	Global.playerX = position.x
	Global.playerY = position.y
	
	if position.y > -93:
		Global.touchedGround = true
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and jumps != Global.maxJumps-1:
		
		velocity.y = Global.jumpVelocity
		$sprite.play("Jump")
		$Jump.play()
		air = true
		jumps += 1
		
	
	if is_on_floor():
		jumps = 0
		if air == false: $sprite.play("Idle")
		air = false
		
		if (Global.playerY < Global.highest-5 and Global.playerY < -100):
			Global.highest = Global.playerY
			Global.score += 1
		
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
