OUTPUT_DIR=/home/roberto/public_html/
cat $OUTPUT_DIR/header.html > $OUTPUT_DIR/monitoring.html
UPTIME=$(uptime -p)
echo "<br>Il server e' up da: $UPTIME" >> "$OUTPUT_DIR/monitoring.html"
N_ACCOUNT=$(ls /home/ | wc -l)

echo "<br>Ci sono in totale" $N_ACCOUNT " account esistenti" >> $OUTPUT_DIR/monitoring.html
CONTA_CONNESSIONI=$(netstat -tunap | grep ":22 " | awk '{print $5}' |  wc -l)
echo "<br>Ci sono attualmente " $CONTA_CONNESSIONI " connessioni" >> $OUTPUT_DIR/monitoring.html
if [ $CONTA_CONNESSIONI -ge 15 ] && [ $CONTA_CONNESSIONI -lt 25 ]; then
        echo " WARNING: Numero sospetto di connessioni" >> $OUTPUT_DIR/monitoring.html
elif [ $CONTA_CONNESSIONI -ge 25 ]; then
        echo " WARNING CRITICO:Numero critico di connessioni" >> $OUTPUT_DIR/monitoring.html
fi

FREE_RAM=$(free -m | awk 'NR==2 {print $4}')
TOTAL_RAM=$(free -m | awk 'NR==2 {print $2}')
PERC_RAM=$(( FREE_RAM * 100 / TOTAL_RAM ))

echo "<br><br>RAM libera: ${PERC_RAM}%" >> "$OUTPUT_DIR/monitoring.html"
TOTAL_DISK=$(df -m | awk 'NR==4 {print $2}')
FREE_DISK=$(df -m | awk 'NR==4 {print $4}')
PERC_DISK=$(( FREE_DISK * 100 / TOTAL_DISK ))

echo "<br><br>Spazio disco libero: ${PERC_DISK}%" >> "$OUTPUT_DIR/monitoring.html"

TRAFFICO_TOT=$(/sbin/ifconfig ens18 | grep "TX packets" | awk '{print $6,$7}' | sed 's/[()]//g')
echo "<br><br>Attualmente c'è un traffico di ${TRAFFICO_TOT}" >> "$OUTPUT_DIR/monitoring.html"

echo "<br><br><b>Top 5 processi per CPU:</b><br>" >> "$OUTPUT_DIR/monitoring.html"
echo "<pre>" >> "$OUTPUT_DIR/monitoring.html"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 >> "$OUTPUT_DIR/monitoring.html"
echo "</pre>" >> "$OUTPUT_DIR/monitoring.html"

