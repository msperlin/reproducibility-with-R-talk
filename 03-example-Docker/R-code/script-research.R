library(GetDFPData2)
library(tidyverse)

graphics.off()

df_info <- get_info_companies(cache_folder = tempdir()) |>
  filter(SIT_REG  == 'ATIVO')

create_plot <- function(df_in) {
  
  tb_sector <- df_in |>
    group_by(SETOR_ATIV) |>
    count(name = 'freq') |>
    ungroup() |>
    arrange(desc(freq)) |>
    slice_max(n = 10, order_by = freq)
  
  tb_sector 
  
  p <- ggplot(tb_sector, aes(x = reorder(SETOR_ATIV, freq), 
                             y = freq)) + 
    geom_col() + 
    theme_minimal() + coord_flip() + 
    labs(title = 'Distribution of top sectors in active companies in B3',
         caption = str_glue('Code execution in {Sys.getenv("USER")} at {Sys.time()} '),
         x = '' ,
         y = 'Frequency')
  
  return(p)
}

p <- create_plot(df_info) 

try({
  x11() ; p
  })

fs::dir_create('/home/output')
ggsave(filename = '/home/output/plot.png', 
       plot = p, 
       width = 7, height = 7)



