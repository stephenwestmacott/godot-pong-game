extends Node2D

@onready var left_label = $LeftScoreLabel
@onready var right_label = $RightScoreLabel

var left_score : int
var right_score : int

# Called when the node enters the scene tree for the first time.
func _ready():
	left_score = 0
	right_score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_left_net_body_entered(body):
	if body == $Ball:
		right_score += 1
		right_label.text = str(right_score)


func _on_right_net_body_entered(body):
	if body == $Ball:
		left_score += 1
		left_label.text = str(left_score)
