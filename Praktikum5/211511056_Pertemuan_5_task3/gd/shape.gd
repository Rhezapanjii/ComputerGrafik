 extends "res://gd//primitif.gd"
func _draw():
	var titik_persegi = Vector2(400,325);
	var titik_persegipanjang = Vector2(50,325)
	var titik_segitiga = Vector2(700,325)
	var titik_trapesium = Vector2(400,80)
	var titik_trapesium_sk = Vector2(750,80)
	var titik_jajargenjang = Vector2(110,65)
	
	#ATAS
	jajargenjang(titik_jajargenjang,125,90)
	trapesium_SK(titik_trapesium_sk,125,90)
	trapesium(titik_trapesium ,150,70)
	segienam([510, 400], 100, Color.sienna, 1)
	segiLima([200, 400], 100, Color.sienna, 1)
	ketupat([840, 400], 100,Color.sienna, 1)
	
func _ready():
	pass # Replace with function body.

func persegi(center : Array, sisi, color, tipe):
	var t1 = translasi(center, [-0.5*sisi, -0.5*sisi])
	var t2 = translasi(t1, [0, sisi])
	var t3 = translasi(t2, [sisi, 0])
	var t4 = translasi(t3, [0, -sisi])
	
	lineDDA_modif(t1, t2, color, tipe)
	lineDDA_modif(t2, t3, color, tipe)
	lineDDA_modif(t3, t4, color, tipe)
	lineDDA_modif(t4, t1, color, tipe)
	
func ketupat(center : Array, sisi, color, tipe):
	var t1 = translasi(center, [0, -sisi])
	var t2 = rotasi(90, t1, center)
	var t3 = rotasi(90, t2, center)
	var t4 = rotasi(90, t3, center)
	
	lineDDA_modif(t1, t2, color, tipe)
	lineDDA_modif(t2, t3, color, tipe)
	lineDDA_modif(t3, t4, color, tipe)
	lineDDA_modif(t4, t1, color, tipe)
	
func segitiga(center : Array, sisi, color, tipe):
	var t1 = translasi(center, [0, -sisi])
	var t2 = rotasi(90, t1, center)
	var t3 = translasi(t2, [-2*sisi, 0])
	
	lineDDA_modif(t1, t2, color, tipe)
	lineDDA_modif(t2, t3, color, tipe)
	lineDDA_modif(t3, t1, color, tipe)

func segitiga2(center : Array, sisi, color, tipe):
	var t1 = translasi(center, [0, sisi])
	var t2 = rotasi(90, t1, center)
	var t3 = translasi(t2, [2*sisi, 0])
	
	lineDDA_modif(t1, t2, color, tipe)
	lineDDA_modif(t2, t3, color, tipe)
	lineDDA_modif(t3, t1, color, tipe)
	
func segiLima(center : Array, sisi, color, tipe):
	var t1 = translasi(center, [0, -sisi])
	var t2 = rotasi(72, t1, center)
	var t3 = rotasi(72, t2, center)
	var t5 = rotasi(-72, t1, center)
	var t4 = rotasi(-72, t5, center)
	
	lineDDA_modif(t1, t2, color, tipe)
	lineDDA_modif(t2, t3, color, tipe)
	lineDDA_modif(t3, t4, color, tipe)
	lineDDA_modif(t4, t5, color, tipe)
	lineDDA_modif(t5, t1, color, tipe)
	
func segienam(center : Array, sisi, color, tipe):
	var t1 = translasi(center, [0, -sisi])
	var t2 = rotasi(60, t1, center)
	var t3 = rotasi(60, t2, center)
	var t4 = rotasi(60, t3, center)
	var t5 = rotasi(60, t4, center)
	var t6 = rotasi(60, t5, center)
	
	lineDDA_modif(t1, t2, color, tipe)
	lineDDA_modif(t2, t3, color, tipe)
	lineDDA_modif(t3, t4, color, tipe)
	lineDDA_modif(t4, t5, color, tipe)
	lineDDA_modif(t5, t6, color, tipe)
	lineDDA_modif(t6, t1, color, tipe)
	

func put_pixel(x,y,color):
	draw_primitive(PoolVector2Array([Vector2(x,y)])
	,PoolColorArray([color]),PoolVector2Array(),null,199.9,null)


func circlePlotPoints(xCenter, yCenter, x, y, color):
	put_pixel((xCenter + x), (yCenter + y), color)
	put_pixel((xCenter - x), (yCenter + y), color)
	put_pixel((xCenter + x), (yCenter - y), color)
	put_pixel((xCenter - x), (yCenter - y), color)
	put_pixel((xCenter + y), (yCenter + x), color)
	put_pixel((xCenter - y), (yCenter + x), color)
	put_pixel((xCenter + y), (yCenter - x), color)
	put_pixel((xCenter - y), (yCenter - x), color)
	pass

func circleMidPoint(Center : Array, rad, color, tipe):
	var x = 0
	var y = rad
	var p = 1 - rad
	var i = x
	
	circlePlotPoints(Center[0], Center[1], x, y, color)
	while (i < y):
		x = x + 1
		i = i + 1
		if (p < 0):
			p += 2 * x + 1
		else:
			y = y - 1
			p += 2 * ( x - y ) + 1
		if (tipe == 1):
			circlePlotPoints(Center[0], Center[1], x, y, color)
		elif (tipe == 2):
			if (fmod(i,5) == 0):
				circlePlotPoints(Center[0], Center[1], x, y, color)
pass


func ellipsPlotPoints(xCenter, yCenter, x, y, color):
	put_pixel((xCenter + x), (yCenter + y), color)
	put_pixel((xCenter - x), (yCenter + y), color)
	put_pixel((xCenter + x), (yCenter - y), color)
	put_pixel((xCenter - x), (yCenter - y), color)
	pass

func ellipsMidpoint(Center : Array, Rx, Ry, color, tipe):
	var Rx2 = Rx*Rx
	var Ry2 = Ry*Ry
	var twoRx2 = 2*Rx2
	var twoRy2 = 2*Ry2
	var p
	var x = 0
	var y = Ry
	var px = 0
	var py = twoRx2*y
	var i = x
	
	ellipsPlotPoints(Center[0], Center[1], x, y, color)

	p = round(Ry2 - (Rx2 * Ry) + (0.25 * Rx2))
	while (px < py):
		x = x + 1
		i = i + 1
		px += twoRy2
		if (p < 0):
			p += Ry2 + px
		else :
			y = y - 1
			py -= twoRx2
			p += Ry2 + px - py
		if (tipe == 1 && fmod(i,1) == 0):
			ellipsPlotPoints(Center[0], Center[1], x, y, color)
		elif (tipe == 2):
			if(fmod(i,2) == 0):
				ellipsPlotPoints(Center[0], Center[1], x, y, color)
	

	p = round(Ry2 * (x+0.5) * (x + 0.5) + Rx2 * (y-1) * (y-1) - Rx2 * Ry2)
	while (y > 0):
		y = y - 1
		i = i + 1
		py -= twoRx2
		if (p > 0):
			p += Rx2 - py
		else :
			x = x + 1
			px += twoRy2	
			p += Rx2 - py + px
		if (tipe == 1 && fmod(i,1) == 0):
			ellipsPlotPoints(Center[0], Center[1], x, y, color)
		elif (tipe == 2 && fmod(i,2) == 0):
			ellipsPlotPoints(Center[0], Center[1], x, y, color)
pass
func kotak(titik_awal : Vector2, panjang_sisi, warna_kanan,warna_kiri):
	var res = PoolVector2Array()
	res.append_array([lineDDA(titik_awal.x,titik_awal.y,titik_awal.x + panjang_sisi,titik_awal.y,Color.darkgoldenrod)])
	res.append_array([lineDDA(titik_awal.x + panjang_sisi,titik_awal.y,titik_awal.x + panjang_sisi,titik_awal.y + panjang_sisi,warna_kanan)])
	res.append_array([lineDDA(titik_awal.x + panjang_sisi,titik_awal.y + panjang_sisi,titik_awal.x,titik_awal.y + panjang_sisi,Color.darkgoldenrod)])
	res.append_array([lineDDA(titik_awal.x,titik_awal.y + panjang_sisi,titik_awal.x,titik_awal.y,warna_kiri)])
	return res

func kotak_panjang(titik_awal : Vector2, panjang_sisi, lebar_sisi):
	var res = PoolVector2Array()
	res.append_array([lineDDA(titik_awal.x,titik_awal.y,titik_awal.x + panjang_sisi,titik_awal.y,Color.darkgoldenrod)])
	res.append_array([lineDDA(titik_awal.x + panjang_sisi,titik_awal.y,titik_awal.x + panjang_sisi,titik_awal.y + lebar_sisi,Color.darkgoldenrod)])
	res.append_array([lineDDA(titik_awal.x + panjang_sisi,titik_awal.y + lebar_sisi,titik_awal.x,titik_awal.y + lebar_sisi,Color.darkgoldenrod)])
	res.append_array([lineDDA(titik_awal.x,titik_awal.y + lebar_sisi,titik_awal.x,titik_awal.y,Color.darkgoldenrod)])	
	return res

func segi_tiga(titik_awal:Vector2, alas, tinggi, warna_tinggi):
	var res = PoolVector2Array()
	res.append_array([lineDDA(titik_awal.x,titik_awal.y,titik_awal.x,titik_awal.y + tinggi,warna_tinggi)])
	res.append_array([lineDDA(titik_awal.x,titik_awal.y + tinggi ,titik_awal.x + alas ,titik_awal.y + tinggi,Color.darkgoldenrod)])
	res.append_array([lineDDA(titik_awal.x + alas,titik_awal.y + tinggi,titik_awal.x,titik_awal.y,Color.darkgoldenrod)])

func trapesium(titik_awal:Vector2,panjang, alas):
#	square(titik_awal,panjang)
	var res = PoolVector2Array()
	kotak(titik_awal,panjang,Color.transparent,Color.darkgoldenrod)
	titik_awal.x = titik_awal.x+panjang
	segi_tiga(titik_awal,alas,panjang,Color.transparent)

func trapesium_SK(titik_awal : Vector2,panjang,alas):
	var res = PoolVector2Array()
	kotak(titik_awal,panjang,Color.transparent,Color.transparent)
	res.append_array([lineDDA(titik_awal.x,titik_awal.y + panjang,titik_awal.x - alas,titik_awal.y + panjang,Color.darkgoldenrod)])
	res.append_array([lineDDA(titik_awal.x - alas,titik_awal.y + panjang,titik_awal.x,titik_awal.y,Color.darkgoldenrod)])
	titik_awal.x = titik_awal.x+panjang
	segi_tiga(titik_awal,alas,panjang,Color.transparent)

func jajargenjang(titik_awal: Vector2, panjang,alas):
	var res = PoolVector2Array()
	kotak(titik_awal,panjang,Color.transparent,Color.transparent)
	res.append_array([lineDDA(titik_awal.x,titik_awal.y,titik_awal.x - alas,titik_awal.y,Color.darkgoldenrod)])
	res.append_array([lineDDA(titik_awal.x - alas,titik_awal.y,titik_awal.x,titik_awal.y + panjang,Color.darkgoldenrod)])	
	titik_awal.x = titik_awal.x+panjang
	segi_tiga(titik_awal,alas,panjang,Color.transparent)

	




func _on_to_elips_pressed():
	get_tree().change_scene("res://scene/eclips & circle.tscn")
	pass # Replace with function body.
