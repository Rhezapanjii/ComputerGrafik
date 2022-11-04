extends "res://gd//shape.gd"

# menampilkan elips
func ellipsis_plot_points(center: Vector2, x, y, color):
	put_pixel(center.x + x, center.y + y, color)
	put_pixel(center.x - x, center.y - y, color)
	put_pixel(center.x + x, center.y - y, color)
	put_pixel(center.x - x, center.y + y, color)
		
func midpoint_ellipsis(center: Vector2, rx, ry, color):
	var rx2 = rx * rx
	var ry2 = ry * ry
	var twoRx2 = 2 * rx2
	var twoRy2 = 2 * ry2
	var x = 0
	var y = ry
	var px = 0
	var py = twoRx2 * y
	var p
	
	ellipsis_plot_points(center, x, y, color)
	p = round (ry2 - (rx2 * ry) + (0.25 * rx2))
	while(px < py):
		x += 1
		px += twoRy2
		if (p < 0):
			p += ry2 + px
		else:
			y -= 1
			py -= twoRx2
			p += ry2 + px - py
		ellipsis_plot_points(center, x, y, color)
		
	p = round (ry2 * (x + 0.5) * (x + 0.5) + rx2 * (y - 1) * (y - 1) - rx2 * ry2)
	while (y > 0):
		y -= 1
		py -= twoRx2
		if (p > 0):
			p += rx2 - py
		else:
			x += 1
			px += twoRy2
			p += rx2 - py + px
		ellipsis_plot_points(center, x, y, color)



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# menampilkan lingkaran
func circle_plot_points(xCenter, yCenter, x, y):
	put_pixel (xCenter + x, yCenter + y, Color.green)
	put_pixel (xCenter - x, yCenter + y, Color.green)
	put_pixel (xCenter + x, yCenter - y, Color.green)
	put_pixel (xCenter - x, yCenter - y, Color.green)
	put_pixel (xCenter + y, yCenter + x, Color.green)
	put_pixel (xCenter - y, yCenter + x, Color.green)
	put_pixel (xCenter + y, yCenter - x, Color.green)
	put_pixel (xCenter - y, yCenter - x, Color.green)
	
func circle(xCenter, yCenter, radius):
	var x = 0
	var y = radius
	var p = 1 - radius
	circle_plot_points(xCenter, yCenter, x, y)
	while (x < y):
		x += 1 
		if (p < 0):
			p += 2 * x + 1
		else:
			y -= 1
			p += 2 * (x - y) + 1
		circle_plot_points(xCenter, yCenter, x, y)
		


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	midpoint_ellipsis(Vector2(500, 280), 50, 100 , Color.yellow)
	midpoint_ellipsis(Vector2(500, 280), 100, 50 , Color.yellow)
	midpoint_ellipsis(Vector2(500, 280), 100, 200 , Color.yellow)
	midpoint_ellipsis(Vector2(500, 280), 200, 100 , Color.yellow)
