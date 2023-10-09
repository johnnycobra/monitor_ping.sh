#!/bin/bash

# Endereço IP 
ip_destino="8.8.8.8"

# Nome do arquivo log
nome_arquivo="ping_logs.txt"

# Intervalo entre os pings em segundos
intervalo_ping=4

# Número de pings a serem realizados
num_pings=10

# Função para realizar o ping e salvar os logs
executar_ping() {
  for ((i=1; i<=$num_pings; i++)); do
    data_hora=$(date +"%Y-%m-%d %H:%M:%S")
    resultado_ping=$(ping -n 1 $ip_destino)
    
    # Escreve a saída do ping no arquivo de log
    echo "$data_hora - Resultado do ping: $resultado_ping" >> $nome_arquivo
    
    # intervalo antes do próximo ping
    sleep $intervalo_ping
  done
}

# Limpa o arquivo de log
if [ -e "$nome_arquivo" ]; then
  rm "$nome_arquivo"
fi

# Executa a função para realizar o ping e salvar os logs
executar_ping

echo "Processo de ping concluído. Logs do ping armazenados em $nome_arquivo"

