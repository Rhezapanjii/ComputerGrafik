extends Node2D

func _ready():
	pass # Replace with function body.
	
var theMatrix

func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())

func matrix3x3SetIdentity(matrix):		
	for x in range(3):
		matrix.append([])
		matrix[x]=[]
		for y in range(3):
			matrix[x].append([])
			matrix[x][y] = 1 if x == y else 0

func matrix3x3PreMultiply(matrix_a, matrix_b):
	var temp = []
	for r in range(3):
		temp.append([])
		temp[r] = []
		for c in range(3):
			temp[r].append([])
			temp[r][c] = matrix_a[r][0]*matrix_b[0][c] + matrix_a[r][1]*matrix_b[1][c] + matrix_a[r][2]*matrix_b[2][c] 
	
	for r in range(3):
		for c in range(3):
			matrix_b[r][c] = temp[r][c]	

func translate2 (tx : int, ty : int):
	var m=[]
	matrix3x3SetIdentity(m)
	m[0][2] = tx
	m[1][2] = ty
	matrix3x3PreMultiply(m, theMatrix)
	
func scale2(sx:float, sy:float, refPt:Vector2):
	var m = []
	matrix3x3SetIdentity(m)
	m[0][0] = sx
	m[0][2] = (1 - sx) * refPt.x
	m[1][1] = sy
	m[1][2] = (1 - sy) * refPt.y
	matrix3x3PreMultiply(m, theMatrix)

func rotate2(a:float, refPt:Vector2):
	var m = []
	matrix3x3SetIdentity(m)
	a = deg2rad(a)
	m[0][0] = cos(a)
	m[0][1] = -sin(a)
	m[0][2] = refPt.x * (1-cos(a)) + refPt.y * sin(a)
	m[1][0] = sin(a)
	m[1][1] = cos(a)
	m[1][2] = refPt.y * (1 - cos(a)) - refPt.x * sin(a)
	matrix3x3PreMultiply(m, theMatrix)
	
func transformPoints2(npts:int, pts:PoolVector2Array):
	var temp:float
	for k in range(npts):
		temp = theMatrix[0][0] * pts[k].x + theMatrix[0][1] * pts[k].y + theMatrix[0][2]
		pts[k].y = theMatrix[1][0] * pts[k].x + theMatrix[1][1] * pts[k].y + theMatrix[2][2]
		pts[k].x = temp

