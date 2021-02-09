pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
function _init()
	 x={0,0,0,0,0}
	 a={1,1.2,1.5,1.8,2}
	 s={1,1,1,1,1}
	 r={false,false,false,false,false}
	 t=0
end

function _update()
	t+=1
	for i=1,#x do
		local d=1
		if x[i]<8 then r[i]=false end
		if x[i]>120 then r[i]=true end
		if r[i] then d=-1 end
		x[i]+=a[i]*d
		s[i]=flr(t*a[i]*0.5)%3+1
	end
end

function _draw()
	cls()
	for i=1,#x do
		print("speed="..a[i],
		2,i*15-6,7)
		spr(s[i],x[i],i*15,1,1,r[i])
	end
end
__gfx__
0000000000ee88e000ee88e000ee88e000e888e000e888e000e888e000e888e000e888e000e888e0cccccccc3bbbbbbbbbbbbbbbbbbbbbb31111111144444444
0000000000e88f8000e88f8000e88f800088f8800088f8800088f88000e8888000e8888000e88880ccccccccbffffffffffffffffffffffb111c111c99999999
0070070008881f1000881f1000881f100081f1800081f1800081f18000eee88000ee888e00eee880ccccccccffffffffffffffffffffffffc1ccc1cc49999494
000770000088fff00888fff00888f7f00e8fff800e8f7f80008fff8e0e8888800e88888800e8888ecccccccc444444444444444444444444ccc1ccc199449999
00077000088feef0080fee0088feee00088eeef0088eee8000feee88088888f00888888000f88888cccccccc111111111111111111111111cccccccc99999999
0070070000f887000008f70000088ff000f8780000f878f0000878f0000e7e00000e7e00000e7e00cccccccc111ccccc1111cc1cccccc111c1cccccc94949494
0000000000eeee0000eeee0000eeee0000eeeee000eeefe000eeeee000eeeee000eeefe000eeeee0ccccccccc1ccccccc1cccccccccccc1ccccccccc49494949
0000000000000f00000ff000000f000000000f000000f000000f0000000f00000000f00000000f00ccccccccccc1ccc1ccccccc1cc1ccccccccccccc44444444
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444cccccccccccccccccccccccccccccccc00000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444c3333333333333333333333cccccc7cc00000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444333333333333333333333333cccccccc0b0a0000
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444333333333333333333333333c7cccccc00b00000
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444333333333333333333333333cccccccc00000800
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444333333333333333333333333cccccccc0000a0b0
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444333333333333333333333333ccc7cccc00000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444333333333333333333333333cccccccc00000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000444444444444004444444444444444466666443bbbbbb3
000000000000000000000000000000000000000000000000000000000000000000000000000000000444444444444440444444444444444466655664bbbbbbbb
00000000000000000000000000000000000000000000000000000000000000000000000000000000444644444444444444444444446444446666d666bbbbb8bb
00000000000000000000000000000000000000000000000000000000000000000000000000000000446dd444444444444444444446d5444466666565bb8bb3b3
0000000000000000000000000000000000000000000000000000000000000000000000000000000044555544444444444444444444444444666665d5bb3b3b3b
0000000000000000000000000000000000000000000000000000000000000000000000000000000044444444444444444444444444444444d66d5d553bb443b3
00000000000000000000000000000000000000000000000000000000000000000000000000000000444444444444444404444444444444405dd5555533444433
00000000000000000000000000000000000000000000000000000000000000000000000000000000444444444444444400444444444444004555555431111113
0000000000000000000000000000000000000000000000000000000000000000000000000000000044999494ffffffff00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000049499994ffffffff00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000044994994ffffffff00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000049494994ffffffff00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000044999994ffffffff00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000049499494ffffffff00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000044999994ffffffff00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000049499494ffffffff00000000000000000000000000000000
