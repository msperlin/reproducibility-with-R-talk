library(GetDFPData2)
library(tidyverse)

df_info <- get_info_companies(cache_folder = tempdir()) |>
  filter(SIT_REG  == 'ATIVO')

tb_sector <- df_info |>
  group_by(SETOR_ATIV) |>
  count(name = 'freq') |>
  ungroup() |>
  arrange(desc(freq)) |>
  slice_max(n = 8, order_by = freq)

tb_sector  

p <- ggplot(tb_sector, aes(x = reorder(SETOR_ATIV, freq), 
                           y = freq)) + 
  geom_col() + 
  theme_minimal() + coord_flip() + 
  labs(title = 'Distribution of top sectors in B3',
       caption = str_glue('Code execution in {Sys.getenv("USER")} at {Sys.time()} '))

#   x11() ; p

ggsave(filename = 'plot.png', 
       plot = p)



