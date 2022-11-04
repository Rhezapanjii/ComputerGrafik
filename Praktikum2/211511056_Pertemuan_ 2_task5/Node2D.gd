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
	
	bingkai(lebar, tinggi, batas, warna)
	linearPointDash(15, lebar, tinggi, 5, 5)
	kuadratDash(-40, lebar, tinggi, 5, 5)
	trigonoPoint(-8, lebar, tinggi, 5)
pass

func bingkai(lebar, tinggi, batas, warna):
	lineBres(batas, batas, lebar-batas, batas, warna)
	lineBres(batas, tinggi-batas, lebar-batas, tinggi-batas, warna)
	lineDDA(batas, batas, batas, tinggi-batas, warna)
	lineDDA(lebar-batas, batas, lebar-batas, tinggi-batas, warna)
	
#membuat cartesian graph
	lineBres(batas, tinggi/2, lebar-batas, tinggi/2, warna)
	lineDDA(lebar/2, batas, lebar/2, tinggi-batas, warna)
	
func linearPointDash(x, width, height, jarak, kerapatan):
	var y = (8*x)-120
	var count = 1
	var pointOrDash = 1
	
	while(x<=50):
		put_pixel((width/2)+x, (height/2)-y, Color(0, 1, 0, 1))
		if(count<=kerapatan):
			if(pointOrDash==2):
				x = x + (jarak*0.1)
				pointOrDash=1
			else:
				x = x + 0.1
		else:
			x = x + (jarak*0.1)
			pointOrDash=2
			count=0
		y=(8*x)-120
		count+=1
			
	pass

func kuadratDash(x, lebar, tinggi, jarak, kerapatan):
	var y  = pow(x,2)+7*x - 12
	var count = 1
	
	while(x<100):
		put_pixel((lebar/2)+x, (tinggi/2)-y, Color( 0.85, 0.44, 0.84, 1 ))
		if(count<=kerapatan):
			x=x+0.01
		else:
			x=x+jarak*0.01
			count=0
		
		y = pow(x,2)+5*x+10
		count+=1
	pass

func trigonoPoint(x, lebar, tinggi, jarak):
	var y = 8*sin(x) -8
	var z = x*35
	while(x<100):
		put_pixel((lebar/2)+z, (tinggi/2)-y, Color( 0.82, 0.71, 0.55, 1 ))
		x = x + (jarak*0.1)
		z = x*35
		y = 8*sin(x) -8
		
pass
