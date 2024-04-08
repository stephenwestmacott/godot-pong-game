extends CharacterBody2D

var speed = 500
const MAX_Y_VECTOR : float = 0.6
var new_ball : bool = true

func _ready():
	velocity = Vector2.ZERO

func _physics_process(delta):
	if velocity.x == 0 and new_ball:
		if Input.is_key_pressed(KEY_W):
			velocity = random_velocity()
		if Input.is_key_pressed(KEY_S):
			velocity = random_velocity()
		if Input.is_key_pressed(KEY_UP):
			velocity = random_velocity()
		if Input.is_key_pressed(KEY_DOWN):
			velocity = random_velocity()
	
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		if collision.get_collider() == $"../LeftPaddle" or collision.get_collider() == $"../RightPaddle":
			$PaddleAudio.play()
			speed += 65
			velocity = new_direction(collision.get_collider())
		else:
			$WallAudio.play()
			velocity = velocity.bounce(collision.get_normal())

func random_velocity():
	return Vector2([-1, 1].pick_random(), randf_range(-1, 1)).normalized()

func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_velocity := Vector2()
	
	if velocity.x > 0:
		new_velocity.x = -1
	else :
		new_velocity.x = 1
	new_velocity.y = (dist/70) * MAX_Y_VECTOR
	
	return new_velocity.normalized()
	
func reset_ball():
	position.x = 571
	position.y = 324
	velocity.x = 0
	velocity.y = 0
	speed = 500
	$NewBallTimer.start()

func _on_left_net_body_entered(body):
	if body == $".":
		$GoalAudio.play()
		new_ball = false
		reset_ball()

func _on_right_net_body_entered(body):
	if body == $".":
		$GoalAudio.play()
		new_ball = false
		reset_ball()

func _on_new_ball_timer_timeout():
	new_ball = true
