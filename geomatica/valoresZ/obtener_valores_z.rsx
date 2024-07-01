##Walsh toolkit=group
##Obtener valores en Z=name
##Ingrese_tu_capa_vectorial=vector
##Ingresa_tu_DEM=raster
##Formato_de_salida=output vector
library(qgisprocess)
print_ascii_title <- function(title) {
    cat("\n")
    cat("|", strrep("=", nchar(title) + 2), "|\n", sep = "")
    cat("|", title, "|\n", sep = " ")
    cat("|", strrep("=", nchar(title) + 2), "|\n", sep = "")
    cat("\n")
}
condicion = ("fid" %in% names(Ingrese_tu_capa_vectorial))
if (condicion){
    Ingrese_tu_capa_vectorial <- st_zm(Ingrese_tu_capa_vectorial) |> subset(select = -fid)
} 

valores_z <- qgis_function('native:setzfromraster')
geoproceso <- valores_z(
  INPUT = Ingrese_tu_capa_vectorial,
  RASTER = Ingresa_tu_DEM,
  BAND = 1) |> 
  qgis_extract_output(name = 'OUTPUT') |> 
  st_read()
print_ascii_title("WALSH Toolkit - ejecutado")
Formato_de_salida <- geoproceso