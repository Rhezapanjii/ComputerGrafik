extends "res://Scene/Script/primitif.gd"

# Declare member variables here. Examples:
var left = 10
var right = 1014
var bottom = 590
var top = 10

# Called when the node enters the scene tree for the first time.

func _init(ci: CanvasItem).(ci):
	pass
	
func frame() :
	lineDDA(Vector2(left,top),Vector2(right,top))
	lineDDA(Vector2(left,top),Vector2(left,bottom))
	lineDDA(Vector2(right,bottom),Vector2(left,top))
	lineDDA(Vector2(right,top),Vector2(right,bottom))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func cartesian() :
	lineDDA(Vector2(centerX,top),Vector2(centerX,bottom))
	lineDDA(Vector2(left,centerY),Vector2(right,centerY))
	pass
