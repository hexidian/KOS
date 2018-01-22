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

COPYPATH("0:/universal_orbit_code.ks","1:/universal_orbit_code").
RUN universal_orbit_code.
DELETEPATH("universal_orbit_code.ks").
//SWITCH TO 0. DELETEPATH("universal_orbit_code.ks"). SWITCH TO 1.

UNTIL False {

	IF has_file(mun_flyby_update.ks,1){RUN mun_flyby_update.ks. DELETEPATH("mun_flyby_update.ks").}
	IF has_file(mun_flyby_update.ks,0){COPYPATH("0:/mun_flyby_update","1:/mun_flyby_update.ks"). SWITCH TO 0. DELETEPATH("mun_flyby_update.ks"). SWITCH TO 1.}
	WAIT 5.
	PRINT "WAITING FOR UPDATE CODE".

}