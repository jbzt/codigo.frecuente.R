# script para convertir nombres de genes, o IDs, e intercambiarlos usando biomart

library(biomaRt)

# base de datos a usar
ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")

# ids de entrada (a modo de ejemplo)
ids.interes=c("ENST00000395956.7", "ENST00000676005.1")

# que tipo de ids estoy usando de entrada?
ensembl@filters[,1] #aca veo todas las opciones, me quedo con la que me intresa
ensembl@filters[56,1] # estas son las que me interesan en este ejemplo

# que tipo de info quiero que me devuelva
ensembl@attributes[,1]
ensembl@attributes[63,1] #encontre la que me intresa

# esto es solo para ver si funciona la herramienta
# como pensarlo: yo te doy estos VALUES, anda a la tabla MART, fijate en la columna que puse en FILTERS,  y dame la data de las columnas ATRIBUTES

getBM(attributes = 'hgnc_symbol', # caracteristicas que quiero que me devuelva
      filters = 'ensembl_transcript_id_version', #caracteristica con la que voy a comparar mi lista de genes
      values = ids.interes, # lista de genes de interes
      mart = ensembl) # datos a usar

#sumo un comentario de prueba para probar la herramienta <3 Agus
