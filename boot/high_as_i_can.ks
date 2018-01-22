for i in list(1,2,3,4,5){
  clearscreen.
  print "launching in " + (5-i).
  wait 1.
}
lock steering to heading(90,90).
lock throttle to 1.
stage.
until (stage:solidfuel < 2) {
  clearscreen.
  print "APOAPSIS: " + APOAPSIS.
  wait 0.2.
}
wait 0.5.
stage.
until (stage:liquidfuel < 2) {
  clearscreen.
  print "APOAPSIS: " + APOAPSIS.
  wait 0.2.
}
wait 0.5.
stage.
wait until (altitude < 80000).
until (altitude < 5000) {
  lock steering to retrograde.
  wait 1.
}
stage.
wait until (altitude < 1200).
stage.
