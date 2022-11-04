extends Control

const init = preload("res://Scene/Script/init.gd")
const line = preload("res://Scene/Script/primitif.gd")
const eq = preload("res://Scene/Script/equation.gd")
var obj
var garis
var geometri
var gedung = PoolVector2Array()
var matahari = PoolVector2Array()
var lampu = PoolVector2Array()
#var matahari = PoolVector2Array()
var jendela =  PoolVector2Array()
var drone2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var size = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	obj = init.new(self)
	garis = line.new(self)
	geometri = eq.new(self)
		drone2 = drone(Vector2(512,300))
	print(drone2)
#	lampu(Vector2(512,300),size)
	gedung(Vector2(512,300),200,600)
	matahari(size, Vector2(512,300))
	print(matahari)
	size = 1
	pass # Replace with function body.

var n = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if size == 490 :
		n = -20
	elif size == 10 :
		n = 20
	
	size+=n
	drone2 = garis.arrTrans(drone2, Vector2( n, 1))
	
	matahari = garis.arrTrans(matahari, Vector2( n, -0.75))
	update()
	


#func _on_Control_draw():
	

func gedung (pos:Vector2,p,l):
	 gedung.append_array(
		geometri.persegiPanjang(
			150,
			300,
			pos
		)
	)
	
func matahari(radius,center: Vector2):
	 matahari.append_array(
		geometri.lingkaran(
			radius, center
		)
	)
	

func drone (pos:Vector2):
	var drone = PoolVector2Array()
	drone.append_array(
		geometri.ellipse(
			60,
			35,
			pos
		)
	)

	matahari.append_array(
		geometri.lingkaran(
			40,
			Vector2(pos.x-330,100)		
	)
	)

	matahari.append_array(
		geometri.segi6(
			55,
			Vector2(pos.x-330,100)		
	)
	)

#badan Drone
	drone.append_array(
		garis.arrRot(
			28,
			geometri.jajargenjang(
				10,
				35,
				10,
				Vector2(pos.x-82,pos.y-54)
			),
			Vector2(pos.x-60,pos.y-60)
		)
	)
	
	drone.append_array(
		garis.arrayMirror(
			garis.arrRot(
			28,
			geometri.jajargenjang(
				10,
				35,
				10,
				Vector2(pos.x-82,pos.y-54)
			),
			Vector2(pos.x-60,pos.y-60)
			),
			Vector2(pos.x*2,0)
		)
	)
#	drone.append_array(
#		garis.arrRot(
#			-228,
#			geometri.jajargenjang(
#				10,
#				35,
#				10,
#				Vector2(pos.x -5,200)
#			),
#			Vector2(pos.x+40,229)
#		)
#	)
	
	drone.append_array(
		garis.arrRot(
			115,
			geometri.jajargenjang(
				10,
				35,
				10,
				Vector2(pos.x-75,350)
			),
			Vector2(pos.x-75,350)
		)
	)
	
#	drone.append_array(
#		garis.arrayMirror(
#			garis.arrRot(
#			28,
#			geometri.jajargenjang(
#				10,
#				35,
#				10,
#				Vector2(pos.x-82,pos.y-54)
#			),
#			Vector2(pos.x-75,350)
#			),
#			Vector2(pos.x-75,350)
#		),
#		Vector2(pos.x*2,0)
#	)
	
	drone.append_array(
		garis.arrRot(
			28,
			geometri.jajargenjang(
				10,
				35,
				10,
				Vector2(pos.x+37,328)
			),
			Vector2(pos.x+37,328)
		)
	)
	
#baling-baling
	drone.append_array(
		garis.arrRot(
			13,
		geometri.ellipse(
			20,
			9,
			Vector2(pos.x-82,pos.y-54)
			
		),
		Vector2(pos.x-82,pos.y-54)
	)
)
	drone.append_array(
		garis.arrRot(
			13,
		geometri.ellipse(
			12,
			6,
			Vector2(pos.x-82,pos.y-54)
			
		),
		Vector2(pos.x-82,pos.y-54)
	)
)

	drone.append_array(
		garis.arrayMirror(
		garis.arrRot(
			13,
		geometri.ellipse(
			20,
			9,
			Vector2(pos.x-82,pos.y-54)
			
		),
		Vector2(pos.x-82,pos.y-54)
	),
	Vector2(pos.x*2,0)
)
)

	drone.append_array(
		garis.arrayMirror(
		garis.arrRot(
			13,
		geometri.ellipse(
			12,
			6,
			Vector2(pos.x-82,pos.y-54)
			
		),
		Vector2(pos.x-82,pos.y-54)
	),
	Vector2(pos.x*2,0)
)
)

	drone.append_array(
		garis.arrRot(
			115,
		geometri.ellipse(
			20,
			9,
			Vector2(pos.x-57,370)
			
		),
		Vector2(pos.x-75,370)
	)
)

	drone.append_array(
		garis.arrRot(
			115,
		geometri.ellipse(
			12,
			6,
			Vector2(pos.x-57,370)
			
		),
		Vector2(pos.x-75,370)
	)
)	
	
	drone.append_array(
		garis.arrRot(
			25,
		geometri.ellipse(
			20,
			9,
			Vector2(pos.x+75,360)
			
		),
		Vector2(pos.x+75,360)
	)
)

	drone.append_array(
		garis.arrRot(
			25,
		geometri.ellipse(
			12,
			6,
			Vector2(pos.x+75,360)
			
		),
		Vector2(pos.x+75,360)
	)
)		

#	drone.append_array(
#		garis.arrRot(
#			90,
#		geometri.ellipse(
#			12,
#			6,
#			Vector2(pos.x-75,230)
#
#		),
#		Vector2(pos.x-35,260)
#	)
#)	
# kamera
	drone.append_array(
		garis.arrRot(
			90,
		geometri.persegiPanjang(
			20,
			10,
			Vector2(pos.x-85,225)
			
		),
		Vector2(pos.x-35,260)
	)
)	

#Gedung
#	gedung.append_array(
#		geometri.persegiPanjang(
#			150,
#			300,
#			Vector2(pos.x-200,100)		
#	)
#	)
	gedung.append_array(
		geometri.persegiPanjang(
			150,
			350,
			Vector2(pos.x-400,280)		
	)
	)
	
	gedung.append_array(
		geometri.persegiPanjang(
			150,
			300,
			Vector2(pos.x-550,350)		
	)
	)
	
	gedung.append_array(
		geometri.persegiPanjang(
			150,
			300,
			Vector2(pos.x-250,350)		
	)
	)
	
	gedung.append_array(
		geometri.persegiPanjang(
			150,
			300,
			Vector2(pos.x-100,320)		
	)
	)

	gedung.append_array(
		geometri.persegiPanjang(
			150,
			300,
			Vector2(pos.x+50,300)		
	)
	)

	gedung.append_array(
		geometri.persegiPanjang(
			150,
			300,
			Vector2(pos.x+200,370)		
	)
	)
	
	gedung.append_array(
		geometri.persegiPanjang(
			150,
			450,
			Vector2(pos.x+350,200)		
	)
	)

	
#	drone.append_array(
#		geometri.ellipse(
#			20,
#			12
#			Vector2(pos.x+350,100)		
#	)
#	)
	
	#jendela
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-350,320)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-370,320)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-350,340)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-370,340)
	)
	)
#------------------------------
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-330,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-350,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-330,420)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-350,420)
	)
	)
#----------------------------
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-300,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-280,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-150,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-170,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-60,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-40,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+60,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+80,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-200,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-220,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-200,420)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-220,420)
	)
	)
	#---
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+60,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+80,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+60,420)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+80,420)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+240,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+260,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+240,420)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+280,420)
	)
	)
	
#	----------------
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+370,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+390,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+370,420)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+390,420)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+370,230)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+390,230)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+370,250)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+390,250)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+400,300)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+420,300)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+400,320)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+420,320)
	)
	)
	
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-300,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-400,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-380,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-400,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-380,480)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+80,320)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+100,320)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+80,340)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+100,340)
	)
	)
#	---
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-470,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-490,400)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-470,420)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-490,420)
	)
	)
#-----------
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-470,500)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-490,500)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-470,520)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-490,520)
	)
	)
#-------------
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+250,500)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+270,500)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+250,520)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x+270,520)
	)
	)
	
#	------
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-70,390)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-90,390)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-70,410)
	)
	)
	
	gedung.append_array(
		geometri.persegi(
			30,
			Vector2(pos.x-90,410)
	)
	)
	return drone
	
func _on_Button_pressed():
	get_tree().change_scene("res://Scene/MainPage.tscn")
	pass # Replace with function body.


func _on_animasi_draw():
	garis.put_pixel_all(drone2,Color.cadetblue)
	garis.put_pixel_all(gedung,Color.tomato)
	garis.put_pixel_all(matahari,Color.gray)
