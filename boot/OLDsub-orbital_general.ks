for i in list(1,2,3,4,5) {print "launching in " + (5-i). wait 1. clearscreen.}
lock steering to heading(90,90). lock throttle to 1. stage.
when (stage:liquidfuel < 5) and (stage:solidfuel < 5) then {
print "safe stage". wait 1.
lock throttle to 0. stage. wait 1. lock throttle to 0.3.
print "done staging".
}
wait until (ship:verticalspeed < -10) and (atmosphere:scale > 0.01).
stage.
lock steering to body:srfretrograde.
wait until False.