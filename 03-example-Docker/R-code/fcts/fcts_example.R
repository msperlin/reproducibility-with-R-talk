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