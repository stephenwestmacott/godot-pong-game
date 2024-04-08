extends CharacterBody2D

const SPEED = 400

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_key_pressed(KEY_UP):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += 1
	move_and_collide(velocity * SPEED * delta)
 
