for i in list(1,2,3,4,5){
  clearscreen.
  print "launching in " + (5-i).
  wait 1.
}
lock steering to heading(90,90).
stage.
wait until (stage:solidfuel < 2).
wait 1.
stage.
wait until (altitude < 3000 and ship:verticalspeed < -10).
stage.
