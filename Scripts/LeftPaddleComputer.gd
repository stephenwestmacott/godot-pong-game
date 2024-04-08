extends CharacterBody2D

@onready var ball = $"../Ball"

const SPEED = 700
const DEAD_ZONE = 30

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if position.y > ball.position.y + DEAD_ZONE:
		velocity.y -= 1
	elif position.y < ball.position.y - DEAD_ZONE:
		velocity.y += 1
	move_and_collide(velocity.normalized() * SPEED * delta)
