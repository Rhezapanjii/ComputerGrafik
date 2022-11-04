extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#put_pixel
func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())

#line_dda
func lineDDA(xa, ya, xb, yb, color):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	put_pixel(round(x), round(y), color)
	
	for k in steps:
		x += xIncrement
		y += yIncrement
		put_pixel(round(x), round(y), color)
		print("(",x,",",y, ")",steps)


#Line_Bresenham
func lineBres(xa, ya, xb, yb, color):
	var dx = xb-xa
	var dy = yb-ya
	var xsign = 1 if dx > 0 else -1
	var ysign = 1 if dy > 0 else -1
	dx = abs(dx)
	dy = abs(dy)
	var xx
	var xy
	var yx
	var yy
	
	if dx > dy:
		xx = xsign
		xy = 0
		yx = 0
		yy = ysign
	else:
		var temp
		#swap dx and dy
		temp = dx
		dx = dy
		dy = temp
		
		xx = 0
		xy = ysign
		yx = xsign
		yy = 0
	
	var p = 2 * dy - dx
	var y=0
	print(xx, xy, yx, yy)
	for x in range(dx+1):
		var x_coor = xa + x*xx + y*yx
		var y_coor = ya + x*xy + y*yy
		put_pixel(x_coor, y_coor, color)
		print("(",x_coor,",",y_coor, ")",p)
		if p >= 0:
			y += 1
			p -= 2*dx
		p += 2*dy
			
