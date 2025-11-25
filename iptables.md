# Recap
* Protocollo IP
	* IP Address
	* Netmask
	* GW
* TCP/IP
	* Application Level
	* 65535 Porte TCP + 65535 Porte UDP
* Firewall
	* Iptables (netfilter)
	* Windows Firewall
	* PF (Firewall BSD)
* Decisioni prese in pase a un filtro di un firewall sono
	* DENY
	* ACCEPT
	* LOG
# Firewall

Filtro di Pacchetti
-> Livello 3 e 4 della pila ISO/OSI
## Iptables

### Packet Filtering VS WAF

Con un Packet filter riesco a filtrare a livello TCP/IP:
* Src IP address
* Netmask
* HW address (MAC)
* Src Port
* Dst IP Address
* Dst Port

Con un WAF riesco a filtrare i pacchetti TCP secondo il loro contenuto
Un software WAF tra i più usati è SNORT

|                   | Iptables               | WAF               |
| ----------------- | ---------------------- | ----------------- |
| Livello ISO/OSI   | 3-4                    | 7                 |
| Utilizzo          | Packet filtering       | Content filtering |
|                   | Tutto il rage di porte | Porte specifiche  |
| Velocità/Overload | Molto veloce           | Meno veloce       |
| Spazio di lavoro  | Kernel space           | User space        |

UTENTE ---> SERVER VPN ---> RAGGIUNGO IL MIO SITO
|--- SSL ------|- UNENCRYPTED -|--- SSL  ---|

1194/UDP -> OpenVPN
8080-3194/TCP

Iptables è diviso in **TABELLE** e **CATENE**

* ***TABELLE**
	* filter
		* **CATENE**
			* INPUT
			* OUTPUT
			* FORWARD
				* KNOCKING
				* CATENA_AGGIUNTIVA
				* MEGA_DROP
				* STANNO_CERCANDO_DI_BUCARMI
	* nat
		* **CATENE**
			* PREROUTING
			* POSTROUTING
	* mangle
		* **CATENE**
			* PREROUTING
			* INPUT
			* OUTPUT
			* FORWARD
			* POSTROUGING

### Tabella Filter

-> Serve per filtrare i pacchetti e prende decisioni in merito a essi.

| Opzione    | Descrizione                             |
| ---------- | --------------------------------------- |
| -A         | Appendi la regola (alla fine)           |
| -p         | Seleziona il protocollo                 |
| --dport    | Seleziona la porta di destinazione      |
| --sport    | Seleziona la porta sorgente             |
| -s         | Seleziona source IP                     |
| -d         | Seleziona destination IP                |
| -j         | Specifica l'azione                      |
| -D         | Rimuove la regola                       |
| -I \<num\> | Inserisci la regola alla linea \<num\>  |
| -m         | matcha filtri avanzati (STATE, HW ADDR) |
| -L         | Lista delle regole                      |
| -N         | Crea catene separate                    |


**EG 1**
voglio bloccare il traffico in entrata per la porta 22/tcp
```bash
iptables -A INPUT -p tcp --dport 22 -j DROP
```

**iptables** -> nome del comando, inizializzo la regola
**-A INPUT** -> seleziona la catena
**-p tcp** -> seleziona il protocollo
**--dport 22** -> seleziona la porta di destinazione
**-j DROP** -> rifiuta il pacchetto

**EG 2**
voglio bloccare il traffico DNS in entrata  53/udp

```bash
iptables -A INPUT -p udp --dport 53 -j DROP
```

**EG 3**
voglio accettare il traffico DNS in entrata SOLO da DNS cloudflare (1.1.1.1)
```bash
iptables -A INPUT -p udp -s 1.1.1.1 --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j DROP
```

oppure

```bash
iptables -A INPUT -p udp -s ! 1.1.1.1 -j DROP
```

oppure

```bash
iptables -P INPUT DROP
```

-> **La priorità delle regole di iptables è a cascata**

**EG 4**

Voglio loggare tutti i pacchetti che arrivano sulla porta 22/tcp

```bash
iptables -A INPUT -p tcp --dport 22 -j LOG
```

```bash
IN=ens18 OUT= MAC=bc:24:11:b5:45:1e:c2:84:ba:95:d7:62:08:00 SRC=62.98.188.87 DST=10.100.0.175 LEN=88 TOS=0x00 PREC=0x00 TTL=43 ID=11817 DF PROTO=TCP SPT=33828 DPT=2222 WINDOW=75 RES=0x00 ACK PSH URGP=0 
```


**EG 5**
Voglio inserire una regola in 3a posizione che blocca il traffico https 443/tcp

```bash
iptables -I INPUT 3 -p tcp --dport 443 -j DROP
```

**EG 6**
Voglio cancellare la 3a regola che blocca il traffico https 443/tcp

```bash
iptables -D INPUT 3
```

oppure

```bash
iptables -D INPUT -p tcp --dport 443 -J DROP
```


## 3 way handshake

Nel protocollo UDP non ci si aspetta una risposta:

- Sorgente invia il pacchetto -> stop

![](Pasted%20image%2020251125154608.png)

Una volta che il 3 way handshake è stato eseguito i pacchetti vengono marcati con uno **STATUS HEADER**.

* *LISTEN*
* NEW
* ESTABLISHED
* RELATED

-> Domanda: Perché chiudiamo il traffico in OUTPUT e INPUT.

**EG 7**

```bash
# Scrivo firewall per un webserver che ha la porta 80, 443 aperta, OUTPUT abilitato e SSH abilitato da ip 192.168.1.234

iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -s 192.168.1.234 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# OUTPUT ACCETTIAMO

iptables -P FORWARD DROP
```


- apache2 deve sapere l'ip di un host (ad es www.apache.org)
	- apache2 prova ad aprire una connessione verso www.apache2.org
	- il SO assegna la porta 40120 pre la risposta da www.apache2.org
	- apache2 vuole sapere l'indirizzo IP di www.apache2.org
	- il SO assegna la porta 42120 al DNS RESOLVER
	- il DNS RESOLVER apre una connessione verso 1.1.1.1
	- 1.1.1.1 risponde alla richiesta con una connessione verso la porta 42120

**EG 8**
Voglio che la connessione SSH sia aperta solo per l'IP 192.168.1.208 con mac-address `98:3b:8f:b2:68:1c`

```bash
iptables -A INPUT -p tcp --dport 22 -s 192.168.1.208 -m mac --mac-source 98:3b:8f:b2:68:1c -j ACCEPT
```

**TRAFFIC SHAPING**

**EG 9**

Ho un ufficio con:
* 18 postazioni dipendenti fisse
* 1 hotspot WIFI con max 20 connessioni disponibili - modalità bridge
* 1 postazione CEO
* 1 postazione CTO
* 100mb/s di Fibra
* VOIP

- Valutazione singola postazione
- 50 mbit/s CEO
- Full range CTO
- 10mb/s x postazione - 25mbit/s X 1G (al giorno)
- 5mb/s x wifi client
- VOIP alta priorità

-> tc (utility di traffic shaping) + mark dei pacchetti secondo il mittente -> viene passato a tc che decide la velocità di trasferimento.

arriva il pacchetto, viene markato secondo

```bash
iptables -t mangle -A PREROUTING -s 192.168.1.0/24 -j MARK --set-mark 1
```

# Port knocking

```bash
# Setup e Creazione Catene
iptables -N KNOCKING
iptables -N KNOCK_2_LOGIC
iptables -N KNOCK_3_LOGIC

# Logica di Protezione SSH (INPUT)
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name SSH_OPEN --rcheck --seconds 60 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j DROP
iptables -A INPUT -p tcp -m multiport --dports 12345,54321,8888 -m state --state NEW -j KNOCKING

# Logica Sequenziale (KNOCKING)
# Colpo 3: Se in KNOCK2, salta alla logica di sblocco.
iptables -A KNOCKING -p tcp --dport 8888 -m recent --name KNOCK2 --rcheck --seconds 15 -j KNOCK_3_LOGIC
# Colpo 2: Se in KNOCK1, salta alla logica di avanzamento.
iptables -A KNOCKING -p tcp --dport 54321 -m recent --name KNOCK1 --rcheck --seconds 15 -j KNOCK_2_LOGIC
# Colpo 1: Aggiunge l'IP alla lista KNOCK1 e droppa.
iptables -A KNOCKING -p tcp --dport 12345 -m recent --name KNOCK1 --set -j DROP
# Blocca tutti gli altri colpi non sequenziali.
iptables -A KNOCKING -j DROP

# Logica di Avanzamento (Catene Ausiliarie)
# KNOCK_2_LOGIC (Passaggio da KNOCK1 a KNOCK2):
iptables -A KNOCK_2_LOGIC -m recent --name KNOCK1 --remove
iptables -A KNOCK_2_LOGIC -m recent --name KNOCK2 --set -j DROP
# KNOCK_3_LOGIC (Sblocco Finale):
iptables -A KNOCK_3_LOGIC -m recent --name KNOCK2 --remove
iptables -A KNOCK_3_LOGIC -m recent --name SSH_OPEN --set -j RETURN

```

Script di connessione

``` bash
➜  ~ cat test.sh 
SERVER="corso-cyber.acido.be"
UTENTE=""

# 1. Colpo 1: Porta 12345
nc -zv -w 1 $SERVER 12345

# 2. Colpo 2: Porta 54321
nc -zv -w 1 $SERVER 54321

# 3. Colpo 3: Porta 8888
nc -zv -w 1 $SERVER 8888

# 4. Connessione SSH (entro 60 secondi dall'ultimo colpo)
ssh $UTENTE@$SERVER
```


**EG 10**

```bash
# il traffico che arriva da 12.56.45.120 e 151.38.67.20-125 è traffico malevolo

iptables -N ROBA_BRUTTISSIMA

iptables -A INPUT -s 12.56.45.120 -j ROBA_BRUTTISSIMA
iptables -A INPUT -s 151.38.67.20-151.38.67.125 -j ROBA_BRUTTISSIMA


iptables -A ROBA_BRUTTISSIMA -j LOG --log-format "è silvana"
iptables -A ROBA_BRUTTISSIMA -j DROP 

```

### Uso del **!** come negazione di una condizione

Bash:
```bash
if [ $VARIABILE_A_CASO != "1" ]; then
	echo "la variabile non è 1"
fi
``` 

Python:
```python
if VARIABLE_A_CASO != 1:
	print("la variabile non è 1")
```

