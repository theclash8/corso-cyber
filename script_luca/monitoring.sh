#!/bin/bash

OUTPUT_DIR=./
FILENAME="monitoring.html"
OUTPUT_FILE=$OUTPUT_DIR/$FILENAME

header() {
  echo '<!DOCTYPE html> <html lang="it">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>La pagina di monitoring di Luca</title>
  </head>
  <body>
    <h1>Monitoring Page</h1>
    <p>'
}

footer() {
  echo '</body></html>'
}

server_uptime() {
  uptime | awk {'print $3, $4'} | sed -e 's/,//g'
}

lista_utenti() {
  ls /home
}

lista_utenti_collegati() {
  who | awk {'print $1'} | sort | uniq
}

disk_space() {
  SPAZIO_TOTALE=$(df -m | grep nvme0n1p4 | awk {'print $2'})
  SPAZIO_USATO=$(df -m | grep nvme0n1p4 | awk {'print $3'})
  SPAZIO_DISPONIBILE=$(df -m | grep nvme0n1p4 | awk {'print $4'})
  PERCENTUALE_SPAZIO_UTILIZZATO=$(df -m | grep nvme0n1p4 | awk {'print $5'} | sed -e 's/%//'g)
  
  if [ $PERCENTUALE_SPAZIO_UTILIZZATO -ge 80 ]; then
    COLOR="red"
  else
    COLOR="green"
  fi
  echo "<td>Spazio utilizzato</td><td style=\"background-color: $COLOR;\">$SPAZIO_DISPONIBILE</td>"
}

ram_usage() {
  RAM_TOTALE=$(free -m | grep "Mem" | awk {'print $2'})
  RAM_USAGE=$(free -m | grep "Mem" | awk {'print $3'})
  RAM_AVAILABLE=$(free -m | grep "Mem" | awk {'print $7'})
  TOTAL_20=$(( RAM_TOTALE * 20 / 100 ))


  if [ $RAM_AVAILABLE -lt $TOTAL_20 ]; then
    COLOR="red"
  else
    COLOR="green"
  fi
  echo "<td>Ram Usata</td><td style=\"background-color: $COLOR;\">$RAM_USAGE</td>"



}
  

header > $OUTPUT_FILE
echo "<table border=1>
    <tr>
      <th>Check</th>
      <th>Result</th>
    </tr>
    <tr>
      <td>Uptime</td>
      <td>$(server_uptime)</td>
    </tr>
    <tr>
      <td>Utenti Collegati</td>
      <td>$(lista_utenti_collegati)</td>
    </tr>
    <tr>
      $(disk_space)
    <tr>
    <tr>
      $(ram_usage)
</table>" >> $OUTPUT_FILE

footer >> $OUTPUT_FILE
