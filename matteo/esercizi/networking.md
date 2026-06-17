ES 01Chi sono, dove sono, chi sono gli altri

Dato questo output di `ifconfig`:

eth0: inet 172.16.5.42  netmask 255.255.0.0  broadcast 172.16.255.255

Chi sono? (indirizzo host)= 172.16.5.42

Dove sono? (indirizzo di rete e range)= 172.16.0.0 - 172.16.0.0-172.16.255.255

Quanti host può avere questa rete?= 65.534

Qual è l'indirizzo di broadcast?= 172.16.255.255
	
--------------------------------------------------------------------------
ES 02Completa la tabella CIDR

Compila le celle vuote. Mostra come hai ricavato il numero di IP disponibili.

| NETMASK         | CIDR | IP disponibili (host) |
| --------------- | ---- | --------------------- |
| 255.255.255.0   | /24  | 254                   |
| 255.0.0.0       | /8   | 16.777.214            |
| 255.255.0.0     | /16  | 65.534                |
| 255.255.255.255 | /32  | 0                     |
| 0.0.0.0         | /0   | 4.294.967.294         |

--------------------------------------------------------------------------
ES 03IP privato, pubblico o speciale?

Per ogni indirizzo indica se è privato pubblico o speciale (broadcast, ecc.). Giustifica la risposta.

10.0.0.1 -> privato, perchè nel range 10.0.0.0-10.255.255.255

172.16.254.1 -> privato, perchè nel range 172.16.0.0-172.31.255.255

192.168.100.50 -> privato, perchè nel range 192.168.0.0-192.168.255.255

8.8.8.8 -> pubblico, fuori dai range sopra citati & DNS pubblico di Google

172.32.0.1 -> pubblico, fuori dai range sopra citati

255.255.255.255 -> speciale, perchè broadcast

192.169.1.1 -> pubblico, fuori dai range sopra citati

--------------------------------------------------------------------------
ES 04DHCP e router

Un PC si connette alla rete. Il DHCP gli assegna:

IP:      192.168.5.73
Netmask: 255.255.255.0
Gateway: 192.168.5.1

In quale range si trovano gli host di questa rete? 192.168.5.1-192.168.5.255

Qual è l'indirizzo di broadcast? 192.168.5.255

Quanti host può avere questa rete? 254

Il PC può comunicare direttamente con `192.168.6.1`? Perché? No, perchè non sono nella stessa rete privata.

--------------------------------------------------------------------------
ES 05Leggi la routing table

Dato questo output di `route -n`:

Destination     Gateway         Genmask           Flags  Iface
0.0.0.0         192.168.1.1     0.0.0.0           UG     eth0
192.168.1.0     0.0.0.0         255.255.255.0     U      eth0

Qual è il default gateway? 192.168.1.1

Se il PC vuole raggiungere `192.168.1.50`, usa il gateway o no? no

Se vuole raggiungere `8.8.8.8`, cosa fa il sistema? manda il pacchetto al router.

Cosa significa il flag `UG`? Corrisponde allostato del route. U = attivo; G = richiede gateway

--------------------------------------------------------------------------
ES 06L'esempio brutto — rete /30

Durante la lezione abbiamo visto questa rete:

HACKERINO 192.168.1.1  
LAN 1 <——————————> LAN 2  
  · PC ufficio              · PC magazzino  
  · WLAN                   · Videosorveglianza  
  
Network: 192.168.1.0  
Netmask: 255.255.255.252  (/30)

Quanti host può avere questa rete?= 2

Quali sono gli indirizzi host validi? 192.168.1.1 & 192.168.1.2

Qual è il broadcast? 192.168.1.3

Perché si chiama "esempio brutto"? Cosa succede se aggiungi un terzo PC? 
Si chiama esempio brutto perchè non considera che gli ip degli altri dispositivi, e quindi il netmask è sbagliato.
Se aggiungo un terzo pc, possibile solo se il terzo pc ha un ip uguale a quelli disponibili come host ovvero si finge o 192.168.1.1 oppure 192.168.1.2, allora risulteranno due IP uguali. Questo creerà un problema di comunicazione tra LAN1 e LAN2. Cioè se abbiamo due IP 192.168.1.1 e il pc ufficio invia il pacchetto all'IP 192.168.1.2. Quando arriverà la risposta dal PC magazzino all'IP doppiato,  allora il pacchetto arriverà solo ad uno dei due IP in modo casuale.
Quindi se io sto utilizzando il PC ufficio avrò un problema nel comunicare in modo efficiente con il PC del magazzino.

Come si chiama il dispositivo `192.168.1.1` in questo schema e quale ruolo ha?
Il dispositivo 192.168.1.1 si riferisce al gateway ovvero al router, che ha lo scopo di inviare i pacchetti ad IP non presenti nella rete in considerazione.

--------------------------------------------------------------------------
ES 07Progetta una rete aziendale

Sei l'amministratore di una piccola azienda. Devi collegare in rete:

1 router

5 PC ufficio

1 stampante di rete

1 server NAS

Scegli l'indirizzo di rete e la netmask. Giustifica la scelta.
NETWORK = 192.168.1.0 
NETMASK = 255.255.255.240

Assegna un IP statico a ogni dispositivo.
192.168.1.1 = ROUTER
192.168.1.2 = server NAS
192.168.1.3 = STAMPANTE di rete

Indica l'indirizzo di broadcast e il range DHCP per i PC.
BROADCAST = 192.168.1.15
range DHCP = 192.168.1.4-192.168.1.8

Il NAS deve essere raggiungibile anche da internet. Cosa cambia?
Deve essere raggiungibile anche da internet, perchè altrimenti rimane accessibile solo nella rete locale, quindi solo dai pc in ufficio.

Non esiste una risposta unica corretta — conta il ragionamento e la coerenza tra le scelte.
