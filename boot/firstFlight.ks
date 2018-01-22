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
lock THROTTLE to 1.
stage.

until (stage:liquidfuel < 2) {
  clearscreen.
  print "APOAPSIS AT: " + APOAPSIS.
  wait 0.1.
}
safeStage(1).

until (stage:liquidfuel < 2) {
  clearscreen.
  print "APOAPSIS AT: " + APOAPSIS.
  WAIT 0.1.
}
safeStage(1).

wait until ALTITUDE > 70000.
set BRAKES to TRUE.
wait until SHIP:VERTICALSPEED < 0.
set LIGHTS to TRUE.
lock STEERING to heading(90,90).
wait until ALTITUDE < 5000.
stage.
