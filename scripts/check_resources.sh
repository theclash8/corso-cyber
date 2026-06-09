#!/bin/bash

while true; do
    # Vogliamo una pagaina HTML.
    # Il titolo deve essere "Vivaigattini.it - Monitoring Page"
    # Sottotitolo, Ciao sono Luca
    # Voglio una sezione con la data, e altre info simpatiche e utili
    # Qui deve essere creata una tabella 3x2 che verrà popolata con il while sotto.

    HTML_HEADER='<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="refresh" content="10" />
  <title>Vivaigattini.it - Monitoring Page</title>
  <style>
    body { font-family: monospace; background: #0d1117; color: #c9d1d9; padding: 2rem; }
    h1   { color: #fff; margin-bottom: 0.2rem; }
    h2   { color: #8b949e; font-weight: normal; margin-bottom: 1.5rem; }
    .info-bar { margin-bottom: 1.5rem; color: #8b949e; font-size: 0.85rem; }
    table { border-collapse: collapse; width: 100%; max-width: 700px; }
    td    { padding: 1rem 1.5rem; border: 1px solid #30363d; font-size: 1.1rem; text-align: center; }
    .ok   { background: #1a4731; color: #3fb950; }
    .warn { background: #4a1010; color: #fff; }
    .label { font-size: 0.75rem; display: block; margin-bottom: 0.3rem; opacity: 0.7; }
  </style>
</head>
<body>
  <h1>Vivaigattini.it - Monitoring Page</h1>
  <h2>Ciao sono Luca</h2>
  <div class="info-bar">
    📅 '"$(date '+%A %d %B %Y')"' &nbsp;|&nbsp; 🕐 '"$(date '+%H:%M:%S')"' &nbsp;|&nbsp; 🖥️ '"$(hostname)"'
  </div>
  <table>'

    DISCO_USATO=$(df /dev/sda1 | grep sda1 | awk {'print $5'} | tr -d '%')
    RAM_USATA=$(free -m | awk '/Mem:/ {print $3}')
    CPU_USATA=$(mpstat 1 1 | grep "Average" | awk '{print 100 - $NF}')

    if [ "$RAM_USATA" -gt 400 ]; then
        # Qui voglio che una cella della tabella diventi rossa con una scritta bianca
        TD_RAM="<td class=\"warn\"><span class=\"label\">RAM</span>${RAM_USATA} MB ⚠</td>"
    else
        # Qui deve essere verde
        TD_RAM="<td class=\"ok\"><span class=\"label\">RAM</span>${RAM_USATA} MB ✓</td>"
    fi

    if [ "$CPU_USATA" -gt 90 ]; then
        # Qui voglio che una cella della tabella diventi rossa con una scritta bianca
        TD_CPU="<td class=\"warn\"><span class=\"label\">CPU</span>${CPU_USATA}% ⚠</td>"
    else
        # Qui deve essere verde
        TD_CPU="<td class=\"ok\"><span class=\"label\">CPU</span>${CPU_USATA}% ✓</td>"
    fi

    if [ "$DISCO_USATO" -gt 80 ]; then
        # Qui voglio che una cella della tabella diventi rossa con una scritta bianca
        TD_DISK="<td class=\"warn\"><span class=\"label\">Disco</span>${DISCO_USATO}% ⚠</td>"
    else
        # Qui deve essere verde
        TD_DISK="<td class=\"ok\"><span class=\"label\">Disco</span>${DISCO_USATO}% ✓</td>"
    fi

    HTML_FOOTER='  </table>
</body>
</html>'

    echo "${HTML_HEADER}
    <tr>${TD_RAM}${TD_CPU}${TD_DISK}</tr>
    <tr>
      <td style=\"color:#8b949e\"><span class=\"label\">Soglia</span>&gt; 400 MB</td>
      <td style=\"color:#8b949e\"><span class=\"label\">Soglia</span>&gt; 90%</td>
      <td style=\"color:#8b949e\"><span class=\"label\">Soglia</span>&gt; 80%</td>
    </tr>
${HTML_FOOTER}" > /var/www/html/luca_monitoring.html

    sleep 10
done
