FUNCTION safeStage {
  PARAMETER throt.
  lock THROTTLE to 0.
  wait 0.1.
  stage.
  wait 0.2.
  lock THROTTLE TO throt.
}

for i in list(1,2,3,4,5){
  print "launching in " + (5-i).
  wait 1.
  clearscreen.
}

lock STEERING to heading(90,90).
stage.
wait until (stage:solidfuel < 2).
wait 1.
lock STEERING to heading(0,0).
wait until (eta:APOAPSIS < 1).
wait until (ALTITUDE < 30000).
stage.
wait 1.
lock STEERING to heading(90,90).
wait until (ALTITUDE < 5000).
stage.
