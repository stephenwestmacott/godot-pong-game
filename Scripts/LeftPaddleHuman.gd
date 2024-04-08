extends CharacterBody2D

const SPEED = 700

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_key_pressed(KEY_W):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_S):
		velocity.y += 1
	move_and_collide(velocity * SPEED * delta)
