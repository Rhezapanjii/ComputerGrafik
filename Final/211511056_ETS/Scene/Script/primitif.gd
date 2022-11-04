extends Node2D

var windows_height = ProjectSettings.get("display/window/size/height")
var windows_width = ProjectSettings.get("display/window/size/width")
var canvasItem: CanvasItem = null

var centerX = windows_width/2
var centerY = windows_height/2


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init(ci: CanvasItem):
	canvasItem = ci


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func scale(matrix: Vector2, k):
	return Vector2(matrix.x*k,matrix.y*k)

func translation(matrix: Vector2, t: Vector2):
	return Vector2(matrix.x+t.x,matrix.y+t.y)

func arrTrans(matrix: PoolVector2Array, t: Vector2):
	var res = PoolVector2Array()
	for index in matrix:
		res.append(translation(index,t))
	return res

func rotation(deg, matrix: Vector2, pivot: Vector2):
	 
	var rad = deg2rad(deg)
	var rotate = [[cos(rad),sin(rad)],[-sin(rad),cos(rad)]]
	
	return translation(
			multiplyInVector2(
				rotate,
				translation(
					matrix,
					Vector2(-pivot.x,-pivot.y)
					)
				)
			,pivot)

func arrRot(deg, matrix: PoolVector2Array, pivot: Vector2):
	var res = PoolVector2Array()
	for index in matrix:
		res.append(rotation(deg, index, pivot))
	
	return res
	
func addInVector2(dot: Vector2,add : Vector2):
	var res = Vector2(dot.x+add.x,dot.y+add.y)
	return res
	
func mirror(matrix: Vector2,pivot:Vector2):
	if(pivot.y == 0 and pivot.x != 0):
		return Vector2(-matrix.x + pivot.x,matrix.y+pivot.y)
	elif(pivot.x == 0 and pivot.y != 0) :
		return Vector2(matrix.x + pivot.x,-matrix.y+pivot.y)
	else:
		return Vector2(-matrix.x + pivot.x,-matrix.y+pivot.y)
	pass

func arrayMirror(array:PoolVector2Array, pivot:Vector2):
	var res = PoolVector2Array()
	for index in array:
		res.append(mirror(index,pivot))
	
	return res
	
func subInVector2(dot: Vector2, add : Vector2):
	var res = Vector2(dot.x+add.x,dot.y+add.y)
	
	return res

func multiplyInVector2(matrix1: Array, matrix2: Vector2) :
	var res = Vector2()
	 
	for row in range(0,2) :
		for column in range(0,2):
			res[row] += matrix1[row][column] * matrix2[column]
			
	
	return res

func identity():
	var res = PoolVector2Array()
	res.append_array([[0,0],[0,0]])
	
	for row in range(0,2):
		for column in range(0,2):
			if (row == column):
				res[row][column] = 1
	
	return res

func toVector3(dot: PoolVector2Array):
	var res = PoolVector3Array()
	for i in dot :
		res.append(Vector3(i.x,i.y,1))
	return res

#put_pixel
func put_pixel(x, y, color):
	canvasItem.draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())

func put_pixel_all(dot: PoolVector2Array, color=Color.black,renggang=0,type="normal"):
	var z = 0
	for i in dot.size():
		if(type=="normal"):
			put_pixel(dot[i].x, dot[i].y, color)
		elif(type=="dash-dash"):
			if(z <= renggang or renggang == 0) :
				put_pixel(dot[i].x, dot[i].y, color)
				z+=1
			elif (z > renggang && z < 2*renggang) :
				z+=1
			else :
				z = 0
		elif (type == "point-point") :
			if (z == 0):
				put_pixel(dot[i].x, dot[i].y, color)
				z+=1
			elif (z > 0 && z <= renggang):
				z+=1
			else :
				z = 0
		elif (type == "point-dash-point"):
			if(z == 0):
				put_pixel(dot[i].x, dot[i].y, color)
				z += 1
			elif(z <= renggang):
				z+=1
			elif(z <= 2*renggang):
				put_pixel(dot[i].x, dot[i].y, color)
				z+=1
			elif(z <= 3*renggang):
				z+=1
			else :
				z=0
#line_dda
func lineDDA(titikA : Vector2, titikB : Vector2):
	var dx = titikB.x - titikA.x
	var dy = titikB.y - titikA.y
	var steps
	var xIncrement
	var yIncrement
	var x = titikA.x
	var y = titikA.y
	var res = PoolVector2Array()
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ (steps)
	yIncrement = dy/ (steps)
	res.append(Vector2(round(x), round(y)))
	
	for k in steps:
		x += xIncrement
		y += yIncrement
		res.append(Vector2(round(x), round(y)))
	return res

#Line_Bresenham
func lineBres(xa, ya, xb, yb):
	var dx = abs(xa - xb)
	var dy = abs(ya - yb)
	var p = (2 * dy) - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy - dx)
	var x
	var y
	var xEnd
	var yEnd
	var res = PoolVector2Array()
	
	if (xa > xb):
		x = xb
		y = yb
		xEnd = xa
	else:
		x = xa
		y = ya
		xEnd = xb
	if (ya > yb):
		yEnd = yb
	else :
		yEnd = ya
	res.append(Vector2(round(x), round(y)))
	while (x <= xEnd and y != yEnd):
		if(x != xEnd):
			x += 1
		
			if (p < 0):
				p = p + twoDy
			else:
				if (ya > yb):
					y = y - 1
				else:
					y = y + 1
				
				p = p + twoDyDx
			
			res.append(Vector2(round(x), round(y)))
	return res
