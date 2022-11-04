extends "res://gd/primitif.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(ci: CanvasItem).(ci):
	pass

func persegiPanjang(alas,tinggi,titik_awal: Vector2) :
	var res = PoolVector2Array()
	var t1 = titik_awal
	var t2 = translation(titik_awal,Vector2(alas,tinggi))
	var t3 = translation(titik_awal,Vector2(0,tinggi))
	var t4 = translation(titik_awal,Vector2(alas,0))
	res.append_array(
		lineDDA(
			t1,
			t3
		)
	)
	res.append_array(
		lineDDA(
			t1,
			t4
		)
	)
	res.append_array(
		lineDDA(
			t3,
			t2
		)
	)
	res.append_array(
		lineDDA(
			t4,
			t2
		)
	)
	return res

func persegi(panjang_sisi, titik_awal: Vector2):	
	return persegiPanjang(panjang_sisi,panjang_sisi,titik_awal)
	
func segitigaSiku(alas,tinggi,titik_awal: Vector2):
	var res = PoolVector2Array()
	var t1 = titik_awal
	var t2 = translation(titik_awal,Vector2(alas,0))
	var t3 = translation(titik_awal,Vector2(0,tinggi))
	res.append_array(
		lineDDA(
			t1,
			t2
		)
	)
	res.append_array(
		lineDDA(
			t1,
			t3
		)
	)
	res.append_array(
		lineDDA(
			t2,
			t3
		)
	)
	return res

func trapesium(alasB,alasA,tinggi,titik_awal: Vector2,type="siku-siku") :
	var res = PoolVector2Array()
	var t1 = titik_awal
	var t2 = translation(t1,Vector2(alasB,0))
	var t3
	var t4
	
	if(type == "siku-siku") :
		t3 = translation(t1,Vector2(0,tinggi))
	elif (type == "sama-kaki") :
		t3 = translation(t1,Vector2((alasB-alasA)/2,tinggi))
	
	t4 = translation(t3,Vector2(alasA,0))
	
	res.append_array(
		lineDDA(
			t1,
			t2
		)
	)
	res.append_array(
		lineDDA(
			t1,
			t3
		)
	)
	res.append_array(
		lineDDA(
			t3,
			t4
		)
	)
	res.append_array(
		lineDDA(
			t4,
			t2
			)
		)
	return res

func jajargenjang(alas,tinggi,beda,titik_awal: Vector2) :
	var res = PoolVector2Array()
	var t1 = titik_awal
	var t2 = translation(t1,Vector2(alas,0))
	var t3 = translation(t1,Vector2(beda,tinggi))
	var t4 = translation(t3,Vector2(alas,0))
	
	res.append_array(
		lineDDA(
			t1,
			t2
		)
	)
	res.append_array(
		lineDDA(
			t1,
			t3
		)
	)
	res.append_array(
		lineDDA(
			t3,
			t4
		)
	)
	res.append_array(
		lineDDA(
			t4,
			t2
		)
	)
	
	return res

func lingkaran(radius,center: Vector2) :
	var res = PoolVector2Array()
	var lPixel = Vector2()
	var p = 1-radius
	lPixel.x = 0
	lPixel.y = radius
	
	res.append_array(plotPointLingkaran(center,lPixel))
	while (lPixel.x < lPixel.y) :
		lPixel.x += 1
		if (p < 0) :
			p += 2 * lPixel.x+1
		else :
			lPixel.y -= 1
			p += 2 * (lPixel.x - lPixel.y) + 1
		res.append_array(plotPointLingkaran(center,lPixel))
	return res
	
func plotPointLingkaran(center : Vector2,pixel : Vector2):
	var res = PoolVector2Array()
	
	res.append(Vector2(center.x + pixel.x,center.y + pixel.y))
	res.append(Vector2(center.x - pixel.x,center.y + pixel.y))
	res.append(Vector2(center.x + pixel.x,center.y - pixel.y))
	res.append(Vector2(center.x - pixel.x,center.y - pixel.y))
	res.append(Vector2(center.x + pixel.y,center.y + pixel.x))
	res.append(Vector2(center.x - pixel.y,center.y + pixel.x))
	res.append(Vector2(center.x + pixel.y,center.y - pixel.x))
	res.append(Vector2(center.x - pixel.y,center.y - pixel.x))
	
	return res
	pass

func ellipse(radius1, radius2, center : Vector2):
	var res = PoolVector2Array()
	var rX2 = pow(radius1,2)
	var rY2 = pow(radius2,2)
	var tworX2 = rX2 * 2
	var tworY2 = rY2 * 2
	var p
	var pixel = Vector2()
	pixel.x = 0
	pixel.y = radius2
	var pX = 0
	var pY = tworX2 * pixel.y
	
	res.append_array(plotPointEllipse(center,pixel))
	
	p = round(rY2 - (rX2 * radius2) + (1/4 * rX2))
	while (pX < pY) :
		pixel.x += 1
		pX += tworY2
		if(p < 0) :
			p += rY2 + pX
		else :
			pixel.y -= 1
			pY -= tworX2
			p += rY2 + pX - pY
		res.append_array(plotPointEllipse(center,pixel))
	
	p = round(rY2* (pixel.x+0.5)*(pixel.x+0.5) + rX2*(pixel.y-1) * (pixel.y-1) - rX2*rY2)
	
	while (pixel.y > 0) :
		print(pixel)
		print(p)
		print(rY2)
		pixel.y-=1
		pY -= tworX2
		if (p > 0) :
			p += rX2 - pY
		else :
			pixel.x += 1
			pX += tworY2
			p += rX2 - pY + pX
		res.append_array(plotPointEllipse(center,pixel))
	return res

func plotPointEllipse(center : Vector2, pixel : Vector2):
	var res = PoolVector2Array()
	
	res.append(Vector2(center.x + pixel.x, center.y + pixel.y))
	res.append(Vector2(center.x - pixel.x, center.y + pixel.y))
	res.append(Vector2(center.x + pixel.x, center.y - pixel.y))
	res.append(Vector2(center.x - pixel.x, center.y - pixel.y))
	
	return res

func layangLayang(diagonal1,diagonal2,perpotongan,titik_awal: Vector2):
	var res = PoolVector2Array()
	var t1 = titik_awal
	var t2 = translation(t1,Vector2(diagonal1/2,perpotongan))
	var t3 = translation(t2,Vector2(0,-diagonal2))
	var t4 = translation(t1,Vector2(diagonal1,0))
	if(perpotongan >= diagonal2) :
		return
	
	res.append_array(
		lineDDA(
			t1,
			t2
		)
	)
	res.append_array(
		lineDDA(
			t2,
			t4
		)
	)
	res.append_array(
		lineDDA(
			t4,
			t3
		)
	)
	res.append_array(
		lineDDA(
			t3,
			t1
		)
	)
	return res

func ketupat(diagonal1,diagonal2,titik_awal: Vector2):
	var res = PoolVector2Array()
	var t1 = titik_awal
	var t2 = translation(t1,Vector2(diagonal1/2,diagonal2/2))
	var t3 = translation(t2,Vector2(0,-diagonal2))
	var t4 = translation(t1,Vector2(diagonal1,0))
	
	res.append_array(
			lineDDA(
				t1,
				t2
			)
		)
	res.append_array(
			lineDDA(
				t2,
				t4
			)
	)
	res.append_array(
			lineDDA(
				t4,
				t3
			)
	)
	res.append_array(
		lineDDA(
			t3,
			t1
		)
	)
	return res
	
func segi5(sisi,center:Vector2):
	var res = PoolVector2Array()
	var deg = 72
	
	var t1 = translation(center,Vector2(0,-sisi))
	var t2 = rotation(deg,t1,center)
	var t3 = rotation(deg,t2, center)
	var t5 = rotation(-deg,t1,center)
	var t4 = rotation(-deg,t5,center)
	
	res.append_array(
		lineDDA(
			t1,
			t2
		)
	)
	res.append_array(
		lineDDA(
			t2,
			t3
		)
	) 
	res.append_array(
		lineDDA(
			t3,
			t4
		)
	)
	res.append_array(
		lineDDA(
			t4,
			t5
		)
	)
	res.append_array(
		lineDDA(
			t5,
			t1
		)
	)
	
	return res

func segi6(sisi,center:Vector2):
	var res = PoolVector2Array()
	
	var t1 = translation(center,Vector2(0,-sisi))
	var t2 = rotation(60, t1, center)
	var t3 = rotation(60, t2, center)
	var t4 = rotation(60, t3, center)
	var t5 = rotation(60, t4, center)
	var t6 = rotation(60, t5, center)
	
	res.append_array(
		lineDDA(
			t1,
			t2
		)
	)
	res.append_array(
		lineDDA(
			t2,
			t3
		)
	) 
	res.append_array(
		lineDDA(
			t3,
			t4
		)
	)
	res.append_array(
		lineDDA(
			t4,
			t5
		)
	)
	res.append_array(
		lineDDA(
			t5,
			t6
		)
	)
	res.append_array(
		lineDDA(
			t6,
			t1
		)
	)
	
	return res
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
