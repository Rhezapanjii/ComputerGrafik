	extends "primitif.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _draw():
	var batas = 10
	var warna = Color("7D3C98")
	var tinggi = ProjectSettings.get("display/window/size/height")
	var lebar = ProjectSettings.get("display/window/size/width")
	
	print(tinggi, lebar)
	
	
	lineDDA(12, 32, 22, 49, "00FF00")
	lineBres(49, 21, 17, 11, "yellow")
	
	
pass


#membuat cartesian graph

	
func linear(x,lebar,tinggi):
	var y = (6*x)-120
	while (x<=80):
		put_pixel((lebar/2)+x, (tinggi/2)-y, Color.yellow)
		x = x+ 0.1
		y = (6*x)-120
		
pass 
func kuadratik(x,lebar,tinggi):
	var y = pow(x,2)+ 7*x - 12
	while (x<=40):
		put_pixel((lebar/2)+(x), (tinggi/2)-(y), Color.white)
		x = x+ 0.1
		y = pow(x,2)+ 7*x - 12
pass

func trigonometri(x,lebar,tinggi):
	var y = sin((3*x))
	while (x<100):
		put_pixel((lebar/2)+(50*x), (tinggi/2)-(20*y), Color.white)
		x = x+ 0.1
		y = sin((3*x))
pass
	
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
