pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
	rs=0
	sb=0x6000
	x=0
	y=0
	v=0
	h=0
end
function text(t,x,y,c)
	print(t,x-1,y,1)
	print(t,x+1,y,1)
	print(t,x,y-1,1)
	print(t,x,y+1,1)
	print(t,x-1,y-1,1)
	print(t,x+1,y+1,1)
	print(t,x,y,c)
end
function _update60()
	rs+=0.01
	local t=flr(rs*100)
	if btn(0) and h>-64 and t%5==0 then h-=1 end
	if btn(1) and h<64 and t%5==0 then h+=1 end
	if btn(2) and v<64 and t%5==0 then v+=1 end
	if btn(3) and v>-64 and t%5==0 then v-=1 end
end
function _draw()
	cls()
	local s=4
	for x=0,(128/s)-1 do
		for y=0,(128/s)-1 do
			local xx,yy=x*s,y*s
			rectfill(xx,yy,xx+s,yy+s,(x+y)%15)
		end
	end

	memcpy(0,0x6000,128*64)
	if h!=0 then
		cls()
		for y=0,127 do
			local rx=ceil(sin(rs+y/100)*h)
			sspr(0,y,128,1,rx,y,128,1)
		end
	end
	memcpy(0,0x6000,128*64)
	if v!=0 then
		cls()
		for x=0,127 do
			local ry=ceil(sin(rs+x/100)*v)
			sspr(x,0,1,128,x,ry,1,128)
		end
	end
	memcpy(0,0x6000,128*64)
	text("h:"..flr(h).."/v:"..flr(v),2,2,7)
	text("cpu:"..stat(1),2,10,7)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00ee000022110000225566778899bbbbddeeee1111334444556666777788889999aaaabbbbbbccbbbbbbbbbbbbbbaaaabbaaaa9999999999aaaaccdd00111122
01111100011111111451111118aaccccd1110111134444556666777788889999aaaabbbbbbccccccddccccccccccccbbbbbbbbbbbbaaaa99bbbbcc0011111133
21717111e1777177711171717111ccdde177117771445555777788889999aaaabbbbccccccccddddddddeeddccddddccddccccbbccccaaaabbccee0022223344
217171171111711171171171711711111117121171556666889999aaaabbbbccccddddeeddddeeddeeeeeeeeddeeddddeeddccccddccccbbddee001122334455
2177711111777117711711717111117771171317717777889999aaaabbbbccccddddeeeeee0000ee00ee00000000eeeeeeeeeeddddddddddeeee112233444466
41717117117111117117117771171011111711117177888899aaaabbbbccccddddeeee00000011111100110000111100000000ee00eeeedd0000112233555577
517171411177717771711b17110111113177717771888899aaaabbbbccccddddeeee0000001111112222221111111111221100001100eeee0011223344667788
55111155441111111111dde11e0022224411111111889999bbbbccccddddeeee0000111111112222222233332222222222221111111111002222224466777788
6666666666778899aaccddee00113344556666778899aaaabbccccddddeeee000011112222223322333333333344332233333322222222113322335566778899
88111111111119aac111ee00111111111111111119aaaabbccccddddeeee000011112222223333334433444444444433443333334433222222335566778899bb
8117717771717111c1771022217771777177717771aabbbbccddddeeee0000111122223333334444444455444455555544443344333333224444556688aaaabb
91711171717171171d171122331171711171111171bbbbccddeeee00001111222233334433444444555555555555444444444433443333334455667799aabbcc
a171a177717171111e17123333417177717771a171ccccddeeee00001111222233334444445555555555666666555544555555555544444455557799aabbbbcc
b1711171117171171117121144517111711171b171ccddddeeee00001111222233334444555566666666665555555555665555556666554466668899aabbccdd
cc177171bb1771011177711715617177717771b171ccddddeeee000011112222333344445555666677776666556666666666666666666655778899aabbccddee
ccc11111cce111001111115115661111111111bb11ccdddd0000111122223333444455555555666677776666667766667777776677777777888899aaccddddee
ddddddddddee00112233445566778899aaaabbbbccddeeee00001111222233334444555566667766777766667777777777777777887777778899aabbccddee00
eeddeeeeee0011113344556666889999aaaabbccddddeeee00001111222233334444555566667777887777667777888888888888888888889999bbccddeeee11
eeee00eeee0022223344557777889999aabbccccddddeeee0000111122223333444455556666777788887777777788889999888899999988aaaabbccdd000011
00000000001122334455667788889999bbbbccccddddeeee1111222233334444555566666666777788887777888888889999999999999999aabbccddee001111
0000111111223333446677778888aaaabbbbccccddee00001111222233334444555566667777887788887777888899889999aaaaaaaaaaaabbbbccee00001111
1111111111223344556677778899aaaabbbbccddeeee0000111122223333444455556666777788889988887788889999aa99aaaabbbbaaaabbccddee00001122
2222222222334455666677889999aaaabbccddddeeee0000001111222233334444555566777788889999888888889999aaaaaaaabbbbbbbbccddeeee00112222
2222333322445555666688889999aaaaccccddddeeeeee00112222333344445555666677667777889999888899999999aaaabbaabbbbccccddddeeee11112222
2222333333445555667788889999bbbbccccdddddd000011111122223333444455556666778888888899ee889999aa99aaaabbbbccbbccccddddee0011112222
33223333444455557777888899aabbbbcccccceeeeee000000111122223333444455556677778899999999889999aaaabbaabbbbccccccccdddd000011112233
333344334444666677778899aaaabbbbbbddddddeeeeee000011112222333344445555666677778899aaaa998899aaaabbbbbbbbccccddcceeee000011223333
333344444455666677779999aaaaaabbccccddddddeeee00111122223333444455556666667777888899aa0099aa99aabbbbccbbccccddddeeee000022223333
333344445555666677889999aaaabbccccccccddddee000000111122223333444455556677778888889999aa9999aaaaaabbccccddccddddeeee001122223333
44334444555566668888999999bbbbbbbbccccddeeeeee0000001111222233334444555566777788999999aa1199aabbbbbbccccddddddddeeee111122222244
4444554455557777888888aaaaaaaabbbbccddddddddeeeeee0000111122223333444455666677888899aaaaaa9999aabbccbbccddddeedd0000111111333333
444455555566777788889999aaaaaabbccccccccddddddee00001111222233334444555555666677889999aaaa1199aaaabbccccccddeeee0000111122223333
33445555666677777799999999aabbbbbbbbccccccddeeeeeeee0000111122223333444466667777778899aabbbbaaaaaabbccddddddeeee0000002222222233
44444455666666778888889999aaaabbbbbbbbccddccddddddeeee0000111122223333445555667788888899aabb33aabbbbbbccddeeddeeee00111111222233
445555556666778888888899aaaaaaaaaabbccbbccccccddddddeeee00001111222233334455556677889999aaaabbaaaabbbbccccddeeee0011111111223333
334455665577777777889999999999aabbaabbbbbbbbccccddeeee000011112222333344444455666677889999aabb33aabbccccccddee000000001122222222
3344445566666677778888889999aaaaaaaaaaaabbccccddccddddeeee000011112222334455555566777788aaaaaabb44aabbccddddddeeee00001111112222
444444556666667788888888889999999999aabbbbbbbbccccccddddeeee00001111222233444466666677889999bbbbbbaabbccccddddeeee00111111111122
3344555555667777777777889988889999aaaaaaaaaabbbbbbccccddddeeee000011112233334455557777778899aabbcc44aabbccddeeee0000000000112211
3344445555666677777788778888888899999999aaaaaabbbbccccddddeeee00001111222233334455666688888899aabbccbbbbbbccddeeee00000011001111
223344556666666666777777777788998888999999aaaabbbbbbccccddddeeee000011112233334444556677889999aaaabb66bbccccddeeeeeeee0000000000
33333344555555667766666677887788888888999999aaaaaaaabbbbccccddddeeee0000222233444455556677889999aabbcc66bbccccddddee00eeeeee0011
22334444555566666666667777777777778888889988999999aaaabbbbccccddddeeee001111223344555566777788aaaaaabbcc77bbddddeeeeeeeeee000000
11223344445555555555666666666677777788778888889999aaaabbbbccccddddeeee0000111122334455666677889999bbbbccccbbccddddddddddeeeeeeee
1122223355444455556655556666667777667777778888999999aaaabbbbccccddddeeee00111122223344556677778899aabbbbcc77bbccccddddeeddddeeee
111122334444444455555555556666666666667777778888889999aaaabbbbccccddddee0000112222333344666677888899aaccccccbbccccccddddddddddee
0022222233334455444444555555555555666666777777887788889999aaaabbbbccccddee00001122333344555577888899aabbbbdd88bbccddccccccdddddd
00111133334433444444444455444455555566666666667788889999aaaabbbbccccddddddeeee111122334444556677889999aabbccddccaaccccccccddddee
ee0011223333333333444433444444555555555555667777777788889999aaaabbbbcccceeee00000022223344555566778899aaaabbcc99ddaabbbbeeeeeeee
ee000011222222333333333333444444444444556655666666777788889999aaaabbbbccddddee001111113344445566667799aaaabbccddddddddeeeeddeeee
ee00001122222233332222333333334433445544555555666666777788889999aaaabbbbccddddee001122223344556666778899aabbbbccccddddddddddddee
ddee0011112222222222222233332233441144111111115511777788889999aaaabbbbccccccddeeee001122223344556677778899aabbccccddddccccdddddd
ddddee001111111111222222222200331100000000000011111122227788889999aaaabbccddddddee00001133333355556677888899bbccccccccccccccdddd
eeddddee110000111111110011000000eeeeeeeeeeee0000ee000011112222889999aaaabbcccceeeeee001122224444446677888899aabbbbbbbbcccccccccc
eeee00ee00000011111100eeeeeeddeeddddddddeeddddeeddeeee0000111122229999aabbbbccdddd0000001122334455556677889999aaaabbbbbbbbbbbbcc
ee0000eeee00000000eeddddeeddccddccccddccccccccddccddddeeee000011112222aaaabbbbccddeeee111111223344555577778899aaaabbbbbbaabbccbb
ddee0000ee00ee00eeddddccccccbbccccbbbbbbbbbbbbccccddddeeee00001111222233bbbbccccccddee001122223333446666668899aaaaaaaaaabbaabbbb
cceeee00eeee22ddcc445555bbbb88bbaaaaaaaaaabbbbccccccddddeeee00001111222233bbbbccddddddee00112222334455667777889999aa99aaaaaaaaaa
dddddd0011110033441111117777228899aa99aaaaaabbbbbbccccddddeeee00001111223333bbccccddeeee0000113333334455667777998899aa999999aabb
ccddeeee0000111111111122222222222233bb99aaaaaabbaabbbbccccddddeeee000011223333ccccddddeeee00112222444455556688889999999999aaaaaa
bbccddeeee0000000000111111111122333333bb999999aaaabbbbccccddddeeee000011112222bbccddddee0000001122334444556677888888888899999999
bbccccdd00eeee00001100001111222222333333dddd99aaaaaabbbbccccddddeeee00001122223333ccddeeee00111111223355555566777788889988889999
bbbbccddeeeeeeee0000000000111122222233444444999999aaaabbbbccccddddeeee001111223333ddddddee00001122223344446666777777888888888899
aaccccccddddee00eeeeee0011111122223333334444ee999999aaaabbbbccccddddeeee00111122334444eeeeee001111222233445566667788777777889999
aabbbbddddeeddeeeeee0000001111112222333344444488aaaabbbbccccddddeeee000000001122223344ddee00001111223333334455776677777788888899
99aabbccddddddddddeeee00000011222222333333555599aaaabbbbccccddddeeee00001111221122333344eeee000011222233444455666666667777888888
aaaaaabbccccccddeeeeeeee001111112222224444555599aaaabbbbccccddddeeee00001111222233223344eeee001111112233334444555566777777778899
99aabbbbccccddddddeeee00000011111133334444555599aaaabbbbccccddddeeee0000111122223333443344ee000011222233334455556666667777888888
99aaaabbbbccccddddddeeee000000112233334444555599bbbbccccddddeeee0000111111112222333344444444ee0011112222334444555566666677778888
99aaaabbccccccddddeeeeee0000112222333344446666aabbbbccccddddeeee0000111122223322333344445555000000112233333344555566667777778888
9999aabbbbccccccddddeeeeee11112222333355556666aabbbbccccddddeeee0000111122223333443344445555001111112222334444555555666677777799
99aaaaaabbbbccdddddddd000011112222444455556666aabbbbccccddddeeee0000111122223333444455445555001111221122333344445566666666888899
9999aabbbbccccccddddee000011112233444455556666aaccddddeeee0000111122223322223333444455555555001111222222223344555555666677888899
8899aaaabbbbcccccceeee0000112233334444555577bbccddddeeee000011112222333333444433444455556666111111222233333344445555557777888899
999999aabbbbbbccddeeee0000222233334444666677ccccddeeee000011112222333344444455555544555566661122222222333344334444556677778888aa
99aaaaaabbbbccddddeeee11112222333355556677ccccddee0000111122223333444455445555556666665566661122223322333344444455666677779999aa
99aaaabbaaccccddddee0011112222334455666677ddddee111122223333444455556666556666666666777766661122223333333344445555666677889999aa
99aaaabbbbccccdddd0000111122334455556677ccee0000112222333344445555666677777788777777777777222222223333444444445555666688889999aa
aaaaaabbbbccccddee0000111133444455666688ee000011223333444455556666777788778888882222332222223333333333444455445555667788889999bb
aabbbbbbbbccddeeee00002222334444557788eeee11112233444455556666777788882288112222222233332233333344443344445555556677778888aaaabb
aabbbbccbbddddeeee00112233334455777788000022223355666677778888999911222222333322333333334444333344444444445555666677778899aabbbb
aabbbbccccddddeeee112222334466667788ee1111444455667777888899991111222233333344444433444444445544444455555555556666777799aaaabbcc
bbbbbbccccddddee00112233335566667700003333555566888899990011112222333344334444445555554444555555665555556666556666778899aabbbbdd
ccccccccccddee0011112244555566778822224444667777990011112222333344445555445555555555666655555555666655556666666677889999aaccdddd
ccccddddccee0000112244445566777711333355668888990011112222333344445555666666776666666666667766666666776666667777888899aaccccddee
ccccddddddee000011334455556688992244557777aaaa001111222233334444555566666677777788777777777777667777777788777777888899bbccddddee
eeddddddeeee001133334455668899224466669999ee000022223333444455556666777777778888888899887788888888777777888877778899bbbbccddee11
eeee00eeee0022223344557777883333558888aaaa0011113344445555666677778888998888998899999999889988889999888888889988aaaabbccdd000011
eeee0000ee1122223344667788224455779999ee0022223344445555666677778888999999aaaa99aa99aaaaaaaa99999999998899999999aaaabbccee001122
0000000011112233446677888844667788aaee111122333355556666777788889999aaaaaaaabbbbbbaabbaaaabbbbaaaaaaaaaaaa999999aabbccee00111133
11001111112233335566779933667788aa00001122334444556666777788889999aaaabbbbbbccbbccccccbbbbbbbbbbccbbaaaabbbbaaaabbbbddee00222244
22222211112244556677885555779999ee001122334444557788889999aaaabbbbccccddbbccccccddccddddccccccccccccbbbbbbbbbbaaccddee0011334455
22223333224455556688aa666688aaee001122333366667788889999aaaabbbbccccddddddeeeeddddddeeddddeeddccddddddccccccccccddddee1133444455
33333333334455667799557788aaeeee11222255556677779999aaaabbbbccccddddeeeeeeee000000eeeeeeeeeeeeddeeddddddeeddccccddee002233445566
554444444455667799aa779999dd0000114444556677888899aaaabbbbccccddddeeee0000001100111111000000000000eeeeeeeeeeddddee00223344556688
5555665544668888996688bbbbee00113344556677888899bbbbccccddddeeee00001111001111112211222200111100111100ee000000ee1111223355777788
66666666557788996688aaddee002233445566777799aaaaccccddddeeee00001111222222223322222233222233111122111100110000001122334466778899
776677777788999977aaddeeee2233335566668899aabbbbccddddeeee00001111222233333344334433333333333322222222222211111122224466778899aa
887788777788aa7799bbdd111122444455778899aabbbbccddeeee000011112222333344334444445544554444444444443333223333221133335566889999cc
9999998888998899bbdd001122334455778899aaaaccccdd00001111222233334444555544555555555566554455554455553333443333224455667788bbbbbb
aa99aaaa99bbaaaacc00112233446666889999bbbbddeeee001111222233334444555566666677666666666666665555665555444444444455557788aabbbbcc
aaaabbaaaa99bbccee0022333355777788aaaaccddeeee001111222233334444555566666677777788777777777777666666666666555544666677aabbbbbbdd
ccaabbaa99bbddee001122445566778899bbccddddee00002222333344445555666677777777888888889988778888778877776677775555667799aaccccddee
ccbbccbbaaddeeee1122445566778899bbccccddee00111133444455556666777788889988889988999999998899888899887777887777668899aabbccddee00
ccccddccccdd0000113355666688aaaabbccddee0022223344445555666677778888999999aaaa99aa99aaaaaaaa999999999988888888889999bbccddeeee11
eeddddddddee0011334455777799aabbccddee11112233334455556666777788889999aaaaaabbbbbbaabbaaaabbbbaaaaaaaa99aa999988aaaabbccdd000022
00ee00eeee0022224455668899aabbbbdd0000112233334455556666777788889999aaaaaabbbbbbccccccbbbbbbbbbbccbbaaaabbaa9999aabbccddee112233
00001100ee1133334466889999aaccccee001122223344446666777788889999aaaabbbbbbbbccccccccddddccccccccccccbbbbbbbbbbaaccccccee11222233
111111111122334455778899aabbddee001111223344555566777788889999aaaabbbbccccccddccddddddddddeeddccddddddccccccccbbddccdd0011223344
3322222222334455778899aabbddeeee0011223344555566777788889999aaaabbbbccccccddddddeeddeeeeeeeeeeddeeddddddeeddccccccdd001122334466
33334433224466667788aaccccddee0011223344445566667788889999aaaabbbbccccddddddeeeeeeee00eeee000000eeeeddeeddddddcceeee001133555566
44444444335566778899bbccddee00002233334455666677889999aaaabbbbccccddddeeddeeeeee000000000000eeeeeeeeeeddeeddddddee00112244556677
554455555566777799bbccddddee111122334455557777889999aaaabbbbccccddddeeeeee00000000001111110000ee0000000000eeeeee0000224455666677
6655665555668888aabbccddee00112233444466667788889999aaaabbbbccccddddeeee00001111111111000000000011000000111100ee1111334455667788
77777766667799aabbccddee001122223355556677778888ddddeeee000011112222333300001111222211110011111111111111111111002233445566778899
777788887799aaaabbccee00001122334455666677bbcccc00000000000000000000000044445511222211111122111122222211222222223333445577888899
888888888899aabbccddee0011223344555566aabb000000000000000000000000000000000000556622771122222222222222223322222233445566778899aa
9988999999aabbbbddee0011113344445599aa0000000000000000000000000000000000000000000066777722223333333333333333333344446677889999bb
9999aa9999aaccccddee002222334444990000000000000000000000000000000000000000000000000000778888333344443333444444335555667788aaaabb
aaaaaaaaaabbccddee00112233338888000000000000000000000000000000000000000000000000000000008888993344444444444444445566778899aabbbb
aaaabbbbbbccddddee112222337700000000000000000000000000000000000000000000000000000000000000009999aa4455555555555566667799aaaabb22
bbbbbbbbbbccddee00112266770000000000000000000000000000000000000000000000000000000000000000000099aaaa55556666555566778899aa112222
ccccccccccddee001111660000000000000000000000000000000000000000000000000000000000000000000000000000aabb55666666667788999911112200
ccccddddccee0000115500000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbcc6677778888990011000000
11ccddddddee000055000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbcccc77778888000000000000
001122ddeeee4444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccdd77eeee000000000000
00000022ee33000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddddeeee000000000000
00000000330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd0000000000000000

