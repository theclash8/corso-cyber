OUTPUT_DIR=/home/roberto/public_html/
cat $OUTPUT_DIR/header.html > $OUTPUT_DIR/monitoring.html
N_ACCOUNT=$(ls /home/ | wc -l)
echo "Ci sono in totale" $N_ACCOUNT " account esistenti" >> $OUTPUT_DIR/monitoring.html
CONTA_CONNESSIONI=$(netstat -tunap | grep ":22 " | awk '{print $5}' |  wc -l)
echo "<br>Ci sono attualmente " $CONTA_CONNESSIONI " connessioni" >> $OUTPUT_DIR/monitoring.html
if [ $CONTA_CONNESSIONI -ge 15 ] && [ $CONTA_CONNESSIONI -lt 25 ]; then
        echo " WARNING: Numero sospetto di connessioni" >> $OUTPUT_DIR/monitoring.html
elif [ $CONTA_CONNESSIONI -ge 25 ]; then
        echo " WARNING CRITICO:Numero critico di connessioni" >> $OUTPUT_DIR/monitoring.html
fi
