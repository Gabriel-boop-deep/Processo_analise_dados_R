# Etapa: Perguntar
# Nesta etapa, você define a pergunta ou problema que deseja abordar com a análise de dados.

# Exemplo de pergunta: "Qual é a relação entre a idade dos clientes e o valor gasto em um determinado produto?"

# Etapa: Preparar
# Nesta etapa, você importa os dados relevantes e realiza as transformações necessárias.

# Instalar e carregar as bibliotecas necessárias
install.packages("tidyverse")  # Pacote para manipulação e visualização de dados
install.packages("readr")  # Pacote para leitura de arquivos CSV
install.packages("dplyr")  # Pacote para manipulação de dados
install.packages("ggplot2")  # Pacote para criação de gráficos
install.packages("scales")  # Pacote para formatação de eixos em gráficos

library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(scales)

# Importar dados
dados <- read_csv("caminho/do/arquivo.csv")  # Substitua "caminho/do/arquivo.csv" pelo caminho correto do seu arquivo CSV

# Etapa: Processar
# Nesta etapa, você limpa e transforma os dados para que possam ser analisados.

dados <- dados %>%
  select(-coluna_indesejada) %>%
  mutate(data = as.Date(data, format = "%Y-%m-%d")) %>%
  mutate(coluna_com_NA = if_else(is.na(coluna_com_NA), mean(coluna_com_NA, na.rm = TRUE), coluna_com_NA))

# Etapa: Analisar
# Nesta etapa, você realiza as análises estatísticas e visualizações dos dados.

dados %>%
  summary()

dados %>%
  ggplot(aes(x = idade, y = valor_gasto)) +
  geom_point() +
  labs(x = "Idade", y = "Valor Gasto") +
  scale_x_continuous(labels = comma) +
  scale_y_continuous(labels = dollar)

# Etapa: Compartilhar
# Nesta etapa, você compartilha os resultados da análise, como relatórios ou visualizações.

dados %>%
  ggsave("caminho/do/grafico.png")  # Substitua "caminho/do/grafico.png" pelo caminho e nome de arquivo desejado

# Etapa: Agir
# Nesta etapa, você toma decisões ou realiza ações com base nas análises feitas.

# Exemplo de ação: "Vamos direcionar nossas campanhas de marketing para os clientes mais jovens, pois eles tendem a gastar mais."
