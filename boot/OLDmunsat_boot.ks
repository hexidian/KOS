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
UNTIL FALSE{
IF ship:STATUS = "PRELAUNCH" {
	COPYPATH("0:/universal_orbit_code.ks","1:/universal_orbit_code").
	RUN universal_orbit_code.
	DELETEPATH("universal_orbit_code.ks").
	//SWITCH TO 0. DELETEPATH("universal_orbit_code.ks"). SWITCH TO 1.
	RCS ON.
}

IF (ship:STATUS = "ORBITING") AND (SHIP:BODY:NAME = "KERBIN"){
	COPYPATH("0:/mun_transfer.ks","1:/mun_transfer").
	RUN mun_transfer.
	DELETEPATH("mun_transfer.ks").
	//SWITCH TO 0. DELETEPATH("mun_transfer.ks"). SWITCH TO 1.

}

IF (ship:STATUS = "ESCAPING") AND (SHIP:BODY = "MUN"){
	COPYPATH("0:/mun_orbit.ks","1:/mun_orbit").
	RUN mun_orbit.
	DELETEPATH("mun_orbit.ks").
	//SWITCH TO 0. DELETEPATH("mun_orbit.ks"). SWITCH TO 1.

}
}