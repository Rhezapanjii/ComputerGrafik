extends Control

func _ready():
	$AudioStreamPlayer2D.play()

func _on_Button_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://mainpage.tscn")


func _on_Button2_pressed():
	pass # Replace with function body.
	get_tree().change_scene("res://aboutpage.tscn")
	
