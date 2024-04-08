extends Node2D

func _on_single_pressed():
	get_tree().change_scene_to_file("res://Scenes/Computer.tscn")

func _on_two_pressed():
	get_tree().change_scene_to_file("res://Scenes/Human.tscn")


func _on_quit_pressed():
	get_tree().quit()
