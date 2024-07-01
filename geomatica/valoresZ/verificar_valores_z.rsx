##Walsh toolkit=group
##Verificar valores en Z=name
##Ingrese_tu_capa_vectorial=vector
##Resultado=output string
library(sf)
library(glue)
print_ascii_title <- function(title) {
    cat("\n")
    cat("|", strrep("=", nchar(title) + 2), "|\n", sep = "")
    cat("|", title, "|\n", sep = " ")
    cat("|", strrep("=", nchar(title) + 2), "|\n", sep = "")
    cat("\n")
}
Layer <- Ingrese_tu_capa_vectorial
z_min <- st_z_range(Layer)["zmin"] |> as.vector()
z_max <- st_z_range(Layer)["zmax"] |> as.vector()

if(!is.na(z_min)){
  mensaje <- glue('<p style="color:blue;">La presente capa vectorial tiene valores en Z donde:</p><br><b>Zmin: {z_min}\nZmax: {z_max} </b> ...')
} else {
  mensaje <- 'Esta capa no presenta valores Z'
}
print_ascii_title("WALSH Toolkit - Resultados")
Resultado = mensaje


