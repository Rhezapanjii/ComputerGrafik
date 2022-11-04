extends "res://gd//primitif.gd"

func _draw():
	var titik_persegi = Vector2(400,325);
	var titik_persegipanjang = Vector2(400,80)
	var titik_segitiga = Vector2(700,325)
	var titik_trapesium = Vector2(50,325)
	var titik_trapesium_sk = Vector2(750,80)
	var titik_jajargenjang = Vector2(110,65)
	
	#ATAS
	jajargenjang(titik_jajargenjang,125,90)
	kotak_panjang(titik_persegipanjang,173, 75)
	trapesium_SK(titik_trapesium_sk,125,90)
	#BAWAH 
	segi_tiga(titik_segitiga,300,150,Color.yellowgreen)
	trapesium(titik_trapesium ,150,70)
	kotak(titik_persegi,150,Color.yellowgreen,Color.darkgoldenrod)
	
	

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
	
func _ready():
	pass # Replace with function body.



func _on_to_elips_pressed():
	get_tree().change_scene("res://scene/eclips & circle.tscn")
	pass # Replace with function body.
