extends "res://gd//primitif.gd"

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
	put_pixel (xCenter - x, yCenter + y, Color.saddlebrown)
	put_pixel (xCenter + x, yCenter - y, Color.aqua)
	put_pixel (xCenter - x, yCenter - y, Color.navajowhite)
	put_pixel (xCenter + y, yCenter + x, Color.blue)
	put_pixel (xCenter - y, yCenter + x, Color.palegreen)
	put_pixel (xCenter + y, yCenter - x, Color.lightgoldenrod)
	put_pixel (xCenter - y, yCenter - x, Color.orange)
	
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
	circle(500, 280, 100)
	circle(450, 280, 100)
	circle(550, 280, 100)
	circle(500, 230, 100)
	circle(500, 330, 100)
	circle(450, 230, 100)
	circle(450, 330, 100)
	circle(550, 230, 100)
	circle(550, 330, 100)
	circle(400, 280, 100)
	circle(600, 280, 100)
	circle(500, 380, 100)
	circle(500, 180, 100)
