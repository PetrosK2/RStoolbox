## *******************************************************************************************************************
## ESdistance (Observer range) obtained from NASA JPL HORIZONS Web-Interface
## http://ssd.jpl.nasa.gov/horizons.cgi 
## for the time period 1970-01-01 : 2069-12-31 deltaT = 1d
## The 100year distances (in AU) were then averaged per DOY 
## resulting in this lookup vector ranging from DOY 1 : 336
.ESdistance <- readRDS("data-raw/sun_earth_dists.rds")

## Raster data type lookup table
.DATATYPEdb <- read.table(text="datatype min max
				LOG1S 0 1
				INT1S -127 127
				INT1U 0 255
				INT2S 32767 32767
				INT2U 0 65534
				INT4S -2147483647 2147483647
				INT4U 0 4294967296
				FLT4S -3.4e+38 3.4e+38
				FLT8S -1.7e+308 1.7e+308", sep=" ", head=TRUE, row.names="datatype")


## *******************************************************************************************************************
## Landsat auxilliary data. Taken from Chander et al 2009
## spatRes resampling: http://landsat.usgs.gov/band_designations_landsat_satellites.php
.LANDSATdb <- list(
		LANDSAT1 = list (
				MSS =  data.frame(band = paste0("B", 4:7, "_dn"),
						bandtype   = rep("REF", 4),
						centerWavl = c(0.548, 0.652, 0.747, 0.900),
						spatRes1   = rep(60, 4), ## resampled
						## All MSS sensors are cross-calibrated to Landsat 5 MSS, so reflectance calculations need to use Landsat 5 MSS parameters for ESUN.
						## http://landsat.usgs.gov/NewMSSProduct.php
						## These are the LS5 ESUN values from Chander 2009:
						esun = c(1824, 1570, 1249, 853.4) ,  
						stringsAsFactors = FALSE
				)
		),
		
		LANDSAT2 = list (
				MSS =  data.frame(band = paste0("B", 4:7, "_dn"),
						bandtype = rep("REF", 4),
						centerWavl = c(0.548, 0.659, 0.750, 0.899),
						spatRes1 = rep(60, 4), ##resampled
						## All MSS sensors are cross-calibrated to Landsat 5 MSS, so reflectance calculations need to use Landsat 5 MSS parameters for ESUN.
						## http://landsat.usgs.gov/NewMSSProduct.php
						## These are the LS5 ESUN values from Chander 2009:
						esun = c(1824, 1570, 1249, 853.4) ,  ## Chander 2009
						stringsAsFactors = FALSE
				)
		),
		
		LANDSAT3 = list (
				MSS =  data.frame(band = paste0("B", 4:7, "_dn"),
						bandtype = rep("REF", 4),
						centerWavl = c(0.545, 0.656, 0.743,	0.896),
						spatRes1 = rep(60, 4), ##resampled
						## All MSS sensors are cross-calibrated to Landsat 5 MSS, so reflectance calculations need to use Landsat 5 MSS parameters for ESUN.
						## http://landsat.usgs.gov/NewMSSProduct.php
						## These are the LS5 ESUN values from Chander 2009:
						esun = c(1824, 1570, 1249, 853.4) ,  ## Chander 2009
						stringsAsFactors = FALSE
				)
		
		),
		
		LANDSAT4 = list (
				MSS =  data.frame(band = paste0("B", 1:4, "_dn"),
						bandtype = rep("REF", 4),
						centerWavl = c(0.550, 0.650, 0.757,	0.916),
						spatRes1 = rep(60, 4), ##resampled
						## All MSS sensors are cross-calibrated to Landsat 5 MSS, so reflectance calculations need to use Landsat 5 MSS parameters for ESUN.
						## http://landsat.usgs.gov/NewMSSProduct.php
						## These are the LS5 ESUN values from Chander 2009:
						esun = c(1824, 1570, 1249, 853.4) ,  ## Chander 2009
						stringsAsFactors = FALSE
				)
		
		),
		
		LANDSAT5 = list (
				TM = data.frame(band = paste0("B", 1:7, "_dn"),
						bandtype = c(rep("REF", 5), "TIR", "REF"),
						centerWavl = c(0.485, 0.569, 0.66, 0.840, 1.676, 11.435, 2.223),
						spatRes1 = rep(30, 7),
						spatRes2 = c(rep(30,5), 60, 30), ## TM Band 6 was acquired at 120-meter resolution, but products processed before February 25, 2010 are resampled to 60-meter pixels. Products processed after February 25, 2010 are resampled to 30-meter pixels.
						esun = c(1983, 1796, 1536, 1031, 220, NA, 83.44) ,
						stringsAsFactors = FALSE
				),
				MSS =  data.frame(band = paste0("B", 1:4, "_dn"),
						bandtype = rep("REF", 4),
						centerWavl = c(0.552, 0.650,0.759,0.923),
						spatRes1 = rep(60, 4), ##resampled
						esun = c(1824, 1570, 1249, 853.4) ,  ## Chander 2009
						stringsAsFactors = FALSE
				)
		),
		
		LANDSAT7 = list(
				ETM = data.frame(band = paste0("B",c(1:6, "6_VCID_1", "6_VCID_2", 7:8), "_dn"),
						bandtype = c(rep("REF", 5), rep("TIR",3), "REF", "PAN"),
						spatRes1 = c(rep(30, 9), 15),
						spatRes2 = c(rep(30,5), rep(60,3), 30, 15),  ## ETM+ Band 6 is acquired at 60-meter resolution. Products processed after February 25, 2010 are resampled to 30-meter pixels.
						centerWavl = c(0.485, 0.560, 0.660, 0.835, 1.650, rep(11.335,3),2.220,0.706),
						esun = c(1997,1812,1533,1039,230.8,rep(NA,3),84.9,1362),
						stringsAsFactors = FALSE
				)
		),
		
		LANDSAT8 = list(
				OLI_TIRS = data.frame(band = c(paste0("B",1:11, "_dn"), "BQA"),
						bandtype = c(rep("REF", 7), "PAN", "REF", "TIR", "TIR", "QA"),
						spatRes1 = c(rep(30, 7), 15, rep(30,4)),
						spatRes2 = c(rep(30, 7), 15, rep(30,4)),  ## ETM+ Band 6 is acquired at 60-meter resolution. Products processed after February 25, 2010 are resampled to 30-meter pixels.
						centerWavl = c(0.44,0.48,0.56,0.655,0.865,1.61,2.2,0.59,1.37,10.6,11.5, NA), 
						esun = c(1895.57139, 2005.40760, 1820.55317 , 1549.31890,  951.28307, 
								247.93538, 85.87907 ,  367.00629, NA, NA, 1718.38626, NA ),
						stringsAsFactors = FALSE
				)
		)
) 


exponents <- c(-4, -2, -1, -.7, -.5)
for(s in names(.LANDSATdb)){
	for(sen in names(.LANDSATdb[[s]])) {
		bandType		<- .LANDSATdb[[s]][[sen]][,"bandtype"] == "REF"
		centerWavl		<- .LANDSATdb[[s]][[sen]][bandType, "centerWavl"] 
		bands 			<- .LANDSATdb[[s]][[sen]][bandType, "band"]
		
		## Calc Chavez Tab 1
		TAB1			<- sapply(exponents, function(x) centerWavl ^ x)
		rownames(TAB1)  <- bands
		colnames(TAB1)	<- c("veryClear", "clear", "moderate", "hazy", "veryHazy")
		
		## Calc Chavez Tab 2, but only until SHVB = B4, larger wavelengths don't make sense to estimate haze
		hazeBands <- if(s %in% paste0("LANDSAT",1:3)) paste0("B", 4:7, "_dn") else  paste0("B", 1:4, "_dn")
		TAB2 <- lapply(hazeBands, function(SHVB){ sweep(TAB1, 2, TAB1[SHVB,], "/")})
		TAB2 <- do.call("cbind", TAB2)
		colnames(TAB2) <- paste0(rep(paste0("B", 1:4, "_dn"), each = 5),"_", colnames(TAB2))
		
		.LANDSATdb[[s]][[sen]] <-  merge(.LANDSATdb[[s]][[sen]] , TAB2, by.x = "band", by.y = "row.names", all.x = TRUE, sort = FALSE)
		rownames(.LANDSATdb[[s]][[sen]]) <- .LANDSATdb[[s]][[sen]]$band
	}
}



## *******************************************************************************************************************
## Save internal data
save(.ESdistance, .LANDSATdb, .DATATYPEdb, file = "R/sysdata.rda", compress = "gzip")
