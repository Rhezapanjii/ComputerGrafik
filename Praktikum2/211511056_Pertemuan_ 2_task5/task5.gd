extends extends "primitif.gd"

bingkai(lebar, tinggi, batas, warna)
	linear (-40,lebar,tinggi)
	kuadratik (-45,lebar,tinggi)
	trigonometri(-8,lebar,tinggi)
pass

func bingkai(lebar, tinggi, batas, warna):
	lineBres(batas, batas, lebar-batas, batas, warna)
	lineBres(batas, tinggi-batas, lebar-batas, tinggi-batas, warna)
	lineDDA(batas, batas, batas, tinggi-batas, warna)
	lineDDA(lebar-batas, batas, lebar-batas, tinggi-batas, warna)
	
#membuat cartesian graph
	lineBres(batas, tinggi/2, lebar-batas, tinggi/2, warna)
	lineDDA(lebar/2, batas, lebar/2, tinggi-batas, warna)
	
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

func _ready():
	pass 
