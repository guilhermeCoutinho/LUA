function dist ( p1 ,p2 )

  return math.sqrt ( ( p2.x - p1.x) * ( p2.x - p1.x) + (p2.y - p1.y)*(p2.y - p1.y) )
end

p3 = {x = 3,
     y = 4}
p4 = {x = 0,
     y = 0}

print (dist(p3,p4))
