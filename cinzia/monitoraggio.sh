#!/bin/bash
while true; do

    DISCO_USATO=$(df /dev/sda1 | grep sda1 | awk {'print $5'} | tr -d '%')
    RAM_USATA=$(free -m | awk '/Mem:/ {print $3}')
    CPU_USATA=$(mpstat 1 1 | grep "Average" | awk '{print 100 - $NF}')

    if [ "$RAM_USATA" -gt 400 ]; then
        wall "BUH!"
        cat <<EOF > "$OUTPUT"
      <!DOCTYPE html>
      <html>
      <head>
    <meta charset="UTF-8">
    <title>Monitor RAM</title>
    <style>
        body { font-family: Arial; background: #111; color: #eee; }
        table { border-collapse: collapse; width: 50%; margin: 50px auto; }
        th, td { border: 1px solid #555; padding: 10px; text-align: center; }
        th { background: #333; }
        td { background: #222; font-size: 20px; }
    </style>
</head>
<body>
<h2 style="text-align:center;">Monitor RAM</h2>
<table>
    <tr>
        <th>RAM Totale (MB)</th>
        <th>RAM Usata (MB)</th>
    </tr>
    <tr>
        <td>$RAM_TOTALE</td>
        <td>$RAM_USATA</td>
    </tr>
</table>
</body>
</html>
EOF

    sleep 5
done
else
        echo "RAM OK!!!!!!"
    fi
