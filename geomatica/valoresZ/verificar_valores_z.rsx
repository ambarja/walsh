##Walsh toolkit=group
##Verificar valores en Z=name
##Ingrese_tu_capa_vectorial=vector
##Resultado=output string

library(sf)
library(glue)

# Función para imprimir título en formato ASCII
print_ascii_title <- function(title) {
    cat("\n")
    cat("|", strrep("=", nchar(title) + 2), "|\n", sep = "")
    cat("|", title, "|\n", sep = " ")
    cat("|", strrep("=", nchar(title) + 2), "|\n", sep = "")
    cat("\n")
}

# Capa vectorial ingresada
Layer <- Ingrese_tu_capa_vectorial

# Obtener rango de valores Z
z_range <- st_z_range(Layer)

# Verificar si existen valores Z
if (!is.null(z_range) && length(z_range) > 0) {
  z_min <- as.vector(z_range["zmin"])
  z_max <- as.vector(z_range["zmax"])
  
  # Crear mensaje con los valores de Z
  mensaje <- glue('<p style="color:blue;">La presente capa vectorial tiene valores en Z donde:</p><br><b>Zmin: {z_min}\nZmax: {z_max} </b> ...')
} else {
  # Mensaje si no hay valores Z
  mensaje <- 'Esta capa no presenta valores Z'
}

# Imprimir título
print_ascii_title("WALSH Toolkit - Resultados")

# Asignar mensaje a la variable de salida
Resultado <- mensaje
