set ship:control:pilotmainthrottle to 0.
FUNCTION has_file {
	PARAMETER name.
	PARAMETER vol.

	switch to vol.
	list files in allFiles.
	for file in allFiles {

		IF file:NAME = name {switch to 1. return True.}

	}
	return False.
}
IF ship:STATUS = "PRELAUNCH" {
	COPYPATH("0:/universal_orbit_code.ks","1:/universal_orbit_code").
	RUN universal_orbit_code.
	DELETEPATH("universal_orbit_code.ks").
	//SWITCH TO 0. DELETEPATH("universal_orbit_code.ks"). SWITCH TO 1.
	RCS ON.
}

UNTIL False {

	IF has_file(munsat_update.ks,0){COPYPATH("0:/munsat_update","1:/munsat_update.ks"). SWITCH TO 0. DELETEPATH("munsat_update.ks"). SWITCH TO 1.}
	PRINT "IT IS " + has_file(munsat_update.ks,0) + " that I have it after checking thing 0 on 0".
	PRINT "IT IS " + has_file(munsat_update.ks,1) + " that I have it after checking thing 0 on 1".
	IF has_file(munsat_update.ks,1){RUN munsat_update.ks. DELETEPATH("munsat_update.ks").}
	PRINT "IT IS " + has_file(munsat_update.ks,0) + " that I have it after checking thing 1 on 0".
	PRINT "IT IS " + has_file(munsat_update.ks,1) + " that I have it after checking thing 1 on 1".
	PRINT "WAITING FOR UPDATE CODE".
	WAIT 3.

}