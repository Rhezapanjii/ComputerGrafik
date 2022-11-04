extends "res://gd//matrix.gd"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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

func lineDDA_modif(point1 : Array, point2 : Array, color, tipe):
	var dx = point2[0] - point1[0]
	var dy = point2[1] - point1[1]
	var steps
	var IncrementX
	var IncrementY
	var x = point1[0]
	var y = point1[1]
	
	if (abs(dx) > abs(dy)):
		steps = abs (dx)
	else :
		steps = abs (dy)
	IncrementX = dx/steps
	IncrementY = dy/steps


	if (tipe == 1):
		for i in range(steps):
			x += IncrementX
			y += IncrementY 
			put_pixel(round(x), round(y), color)


	elif (tipe == 2):
		var a = 0
		for i in range(steps):
			x += IncrementX
			y += IncrementY
			
			if (a <= 7):
				put_pixel(round(x), round(y), color)
				a += 1
			else:
				if(a == 12):
					a = 0
				else :
					a += 1


	elif (tipe == 3):
		var a = 0
		for i in range(steps):
			x += IncrementX
			y += IncrementY
			
			if (a <= 7):
				put_pixel(round(x), round(y), color)
				a += 1
			elif(a == 10):
					put_pixel(round(x), round(y), color)
					a += 1
			else:			
				if(a == 13):
					a = 0
				else :
					a += 1


#Line_Bresenham
func lineBres(xa, ya, xb, yb, color):
	var dx = abs(xa - xb)
	var dy = abs(ya - yb)
	var p = 2 * dy - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy - dx)
	var x
	var y
	var xEnd
	
	if xa > xb : 
		x = xb
		y = yb
		xEnd = xa
	else : 
		x = xa
		y = ya
		xEnd = xb
	
	put_pixel(x, y, color)
	
	while x < xEnd :
		x += 1
		if p < 0 :
			p += twoDy
		else : 
			y += 1
			p += twoDyDx
		put_pixel(x, y, color)
			
func tambah(matrix1 : Array, matrix2 : Array): 
	var res = [0,0]
	
	for i in range (0,2,1):
		res[i] = matrix1[i] + matrix2[i]
	return res


func kurang(matrix1 : Array, matrix2 : Array):
	var res = [0,0]
	
	for i in range (0,2,1):
		res[i] = matrix1[i] - matrix2[i]
	return res


func kali(matrix1 : Array, matrix2 : Array):
	var res = [0,0]
	
	for i in range (0,2,1):
		for k in range(0,2,1):
			res[i] += matrix1[i][k] * matrix2[k]
	return res


func identitas(): 
	var res = [[0,0],[0,0]]

	for i in range (0,2,1):
		for k in range(0,2,1):
			if (i == k):
				res[i][k] = 1
	return res


func skalar(matrix : Array, k):
	var res = [0,0]
	
	for i in range (0,2,1):
		res[i] = matrix[i]*k 
	return res


func translasi(matrix1 : Array, matrix2 : Array):
	var res = [0,0]
	
	for i in range (0,2,1):
		res[i] = matrix1[i] + matrix2[i]
	return res


func rotasi(sudut, matrix, center : Array):
	var mTrigono = [[0,0],[0,0]]
	var deg = deg2rad(sudut)
	var result
	
	mTrigono[0][0] = cos(deg)
	mTrigono[0][1] = -sin(deg)
	mTrigono[1][0] = sin(deg)
	mTrigono[1][1] = cos(deg)
	result = translasi(kali(mTrigono, kurang(matrix, center)), center)
	return result
