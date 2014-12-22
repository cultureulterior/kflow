ROT={:nw=>:ne,:ne=>:se,:se=>:sw,:sw=>:nw}

class Xorb
  def self.method_missing(name,*args)
    case name
    when :n
      $n||={}
      $n[args[0]]=args[1..-1].flatten(1)
    when :marker
      $name=args[1]
    when :rotate
      dir = args[1]||around
      $n[args[0]].each{|dir,name|
        [case dir
        when :cw
          return ROT[by]
        when :around
          return ROT[ROT[a]]
        when :ccw
          return ROT[ROT[ROT[a]]]
        end,
         name]}
    when :ne,:se,:sw,:nw,:around,:cw,:ccw
      return name
    else
      return args.map{|dir| [dir,name]}
    end
  end
  marker "isometricLandscape/PNG/land"
  n 125,grass(ne,se),road(sw,nw)
  n 126,rotate(125)
  n 127,rotate(126,ccw)
  n 123,rotate(125,cw)
  n 104,road(ne,nw,se),grass(sw)
  n 105,road(se),grass(nw,ne,sw)
  n 41,beach(se,sw),grass(nw,ne)
  n 43,grassrim(se,nw),grass(ne),water(sw)
  n 96,rotate(104,cw)
  n 81,lot(sw,se,nw,ne)
  n 80,lot(sw,se,nw),grass(ne)
  n 114,lotedge(sw,se),grass(nw,ne)
  n 66,water(sw,se,nw,ne)
  n 60,beach(se,ne),water(sw,nw)
  n 61,rotate(60)
  n 59,sand(sw,se,nw,ne)
  n 68,rotate(61,cw)
  n 69,grassrim(sw,se),water(nw,ne)
  n 77,rotate(69,cw)
  n 76,rotate(77)
  n 78,canal(se,ne),grass(sw,nw)
  n 79,rotate(78)
  n 23,road(sw,ne),canal(nw,se)
  n 27,beach(se,nw),grass(ne),water(sw)
  n 35,rotate(27,cw)
  n 34,rotate(35)
  n 42,rotate(35,cw)
  n 49,rotate(41,cw)
  n 48,rotate(49)
  n 50,grassrim(sw,ne),water(se),grass(nw)
  n 51,rotate(50)
  n 55,rotate(49,cw)
  n 62,grassrim(se,ne),grass(sw,nw)
  n 63,rotate(62)
  n 70,rotate(63,cw)
  n 64,canal(sw,ne),grass(se,nw)
  n 72,rotate(64,cw)
  n 65,bankedcanal(se,nw),grass(sw,ne)
  n 71,rotate(78,cw)
  n 74,road(se,nw),grass(sw,ne)
  n 82,rotate(74,cw)
  n 84,rotate(77,cw)
  n 85,bankedcanal(sw,se),grass(ne,nw)
  n 86,rotate(79,cw)
  n 80,lotedge(se,nw),grass(ne),lot(sw)
  n 87,rotate(80,ccw)
  n 88,rotate(87)
  n 89,rotate(104,ccw)
  n 90,road(sw,se,nw,ne)
  n 92,rotate(85,ccw)
  n 93,rotate(92)
  n 95,rotate(88,cw)
  n 96,rotate(89)
  n 97,rotate(96,cw)
  n 100,rotate(93,cw)
  n 94,lot(sw),lotedge(se,nw),road(ne)
  n 102,rotate(94,cw)
  n 101,rotate(102)
  n 105,road(se),grass()
  n 108,rotate(102,cw)
  n 111,rotate(105,cw)
  n 112,rotate(111,cw)
  n 117,rotate(112,cw)
  n 119,rotate(114,cw)
  n 118,rotate(119)
  n 122,rotate(119,cw)
end

p $n
