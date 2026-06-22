_kernel space (sotto, driver) & user space (sopra)

_shell (creare, aprire, modificare file)

[Learn Shell - Free Interactive Shell Tutorial](https://www.learnshell.org/) (https://www.learnshell.org/)

[Bash Script: tutorial, esempio e guida alla Shell Linux | HTML.it](https://www.html.it/guide/shell-scripting-la-guida/) (https://www.html.it/guide/shell-scripting-la-guida/)

[(1339) CORSO COMPLETO SHELL BASH ITA 4 ORE - YouTube](https://www.youtube.com/watch?v=lGsXcy6KO3Q) (https://www.youtube.com/watch?v=lGsXcy6KO3Q)

[![Title: Titolo video: CORSO COMPLETO SHELL BASH ITA 4 ORE - Description: U,{b7163d06-5583-475e-86fd-2e25d8d868e6}{72},12.155017258382644,7.041666666666667](file:///C:/Users/matte/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png)](https://www.youtube.com/watch?v=lGsXcy6KO3Q)

_cia (disponibilità, integrità, sicurezza)

Saas: software as a service

Html= markdown language

Linux & kali, parrot (penetretion test)

_File system 

disco: magnetico o puntine                [dati & metadati(size, perm, address)]

#paragon

Attacco DoS & Accessibilità di dati

Comands:

-passwd

-h

-l

 ls  - l

 Bash               

|   |   |   |
|---|---|---|
|**Scritto**|**Significato**|**Uso tipico**|
|.|directory corrente|./script.py → script nella cartella attuale|
|./|directory corrente (come percorso)|ls ./ → lista contenuti attuali|
|..|directory padre|../file.txt → file nella cartella sopra|
|../|directory padre (come percorso)|ls ../ → lista contenuti della cartella padre|

 df –h

 ls /dev/sda

 ls /dev/sdb

Apt

Cd/var/ww

Cat

scp

Kill  0/-9

  
  
C:\                        /                              <-- radice

D:\                        /root

                               /x/Luca/file.txt              is File.txt

Cd/root

Risorse:

Processi: top, ps-aux

Systemd: ssh --> sshd

Id

Pid

Python --> py --> pyc --> bin

Miner

Hash: (/=chiave asincrona)

Impronta digitale univoca creata da un algoritmo.  
Risultato di una trasformazione matematica tramite algoritmo di un dato in una stringa univoca.

Algoritmi per generare l’hash:

Sha512

Rsa

Md5    

Hash delle crypto ( calcoli matematici univoci)

Cript delle password (md5 creato 40 anni fa, si usava ora bug... si usa ancora per.../ ora sha(512))

Md5:    sul sito e vedere....                 gli md5 sono univoci

Firme dei virus

Chiave asincrona: dato --> algoritmo + [mia stringa] --> hash

X     --> sha512   -->  [chiave privata] --> chiave pubblica

Web server 

Html

Creare una paggina di monitoring

Mkdir monitor

Cd monitor

Metrica (dashboard)

Sicurezza informatica :

Sicurezza del codice

Prevenire attacchi di ransomware(decripta i dati e chiede riscatto) o                  pishing(email)

I dati, personali, hanno molto valore.

Server side

Client side

Guerra ibrida

matteo@corso-cyber:~$ ssh-keygen -t rsa -b 2048

Generating public/private rsa key pair.

Enter file in which to save the key (/home/matteo/.ssh/id_rsa):

Created directory '/home/matteo/.ssh'.

Enter passphrase (empty for no passphrase):

Enter same passphrase again:

Your identification has been saved in /home/matteo/.ssh/id_rsa

Your public key has been saved in /home/matteo/.ssh/id_rsa.pub

The key fingerprint is:

SHA256:/dUmVMmg6s/MmLo/Lm45dlg+T/IU6lO9K39CR1vUPzE matteo@corso-cyber

The key's randomart image is:

+---[RSA 2048]----+

|             .o +|

|            .  Eo|

|           .  ..+|

|         ..  . +o|

|        S.... + *|

|        ...o.+ = |

|        =+.oo o  |

|       B.*%. o . |

|      ++O*=Boo+  |

+----[SHA256]-----+  
matteo@corso-cyber:~$ cd .ssh

[matteo@corso-cyber:~/.ssh$](mailto:matteo@corso-cyber:~/.ssh$) ls

id_rsa  id_rsa.pub

[matteo@corso-cyber:~/.ssh$](mailto:matteo@corso-cyber:~/.ssh$) cat id_rsa.pub

#Chiave pubblica#

[matteo@corso-cyber:~/.ssh$](mailto:matteo@corso-cyber:~/.ssh$) cat id_rsa

-----BEGIN OPENSSH PRIVATE KEY-----

#chiave privata#

-----END OPENSSH PRIVATE KEY-----

Git clone [git@github.com:theclash8/corso-cyber.git](mailto:git@github.com:theclash8/corso-cyber.git)

Ssh –T [git@github.com](mailto:git@github.com)

Mkdir Matteo

Git add Matteo

git config --global user.email [you@example.com](mailto:you@example.com)  
git config --global user.name "Your Name"

Git commit –m “ho creato una cartella”

Git config pull.rebase true

Git pull

Git push

Git checkout –b nome

Git branch

Git checkout nome

Git push origin nome

Feature

Doc

OS (file-processi) = sistemi operativi

Processo: systemd = 1 root:root

Web server: Apache2, nginx

Problema! È aperto a tutti

Per sicurezza:

Tecniche di sicurezza per sistema operativo: (linux)

Multiutenza

Permessi

3.11

95

98

Millenial

Nt

Nt40

2000

Xp

Linux: Multiutenza, anche da subito perché pensato fin da subito in ambito server  

Ms dos

Windows è più usato e di conseguenza è meno sicuro.

|   |   |   |   |   |
|---|---|---|---|---|
|**Sistema Operativo**|**Quota Mercato**|**Malware Target**|**Risk Level**|**Architettura Sicurezza**|
|**Windows**|73% licendi|90%+ malware aranzulla|🔴 Alto|Defender + aggiornamenti|
|**macOS**|15% licendi|<10% malware aranzulla|🟡 Medio|Sandbox + crittografia|
|**Linux**|4% licendi|Quasi assenti aranzulla|🟢 Basso|Open source + permessi|
|**Chrome OS**|2% licendi|Limitato sentinelone|🟢 Basso|Auto-aggiornante|

Ecosistema apple:    Completo e semplice da usare. Ma puoi usare solo apple...

Il play services

Gsvite

Dizionario di password per hacker, brute force

Permessi; exezuzione, lettura, scrittura

**chmod**

**chown**

|   |   |   |   |
|---|---|---|---|
||**U**|**G**|**o**|
|r|4|4|4|
|w|2|2|2|
|x|1|1|1|

4 = lettura, 2 = scrittura, 1 = esecuzione. I numeri si sommano: rwx = 7, rw = 6, rx = 5, r = 4.[1][2]

Ainod **df –i**

**Top**

**Ps aux**

**Cd /var/www**

**Ls –l html/**

R=4

W=2

X=1

   
  

CVE and zero day  
  
comandi  
cicli: if, for, while -----> variabili $

Output

> ps aux > processo.txt  
    ps aux >> processo.txt

| ps aux | processo

Processo &

Ps aux && WC-I  (and)

Ps aux || pidof  (or)

Stdout

Stperr

G = ognioccorrenza

Grep

Sed

Awk

Wc-l

sort

more

/var/log/sito  Cat acces.log | wc –l

/var/log/server cat acces.log | grep 34.131.164.42

/var/log/server cat acces.log | grep 34.131.164.42 | wc -l

/var/log/server cat acces.log | grep 34.131.164.42 | awk ‘{print $6}’ $NF

/var/log/server cat acces.log | grep 34.131.164.42 | awk ‘{print $6}’ | sort

Var = ‘ciao sono Luca’

Sed –e ‘s/Luca/Peppino/g’

REGEX P

Var = “<nome>luca</nome>”

Sed –e ‘s/nome/name/g’

Sed –e ‘/s/>.*

1 root 0.0

#NAGIOS#

[https://corso-cyber.acido.be/output.html](https://corso-cyber.acido.be/output.html)  
1. Numero righe 1302

Codice errore lato server numero: 1302

Accesso con metodo GET che da 200 sono: 1240




Reti e sicurezza informatica
Cosa è una rete:
	LAN: reti locali
	WAN: reti citattine e globali

Funzionamento di una rete locale:
	sniffing e modalità promiscua (etere)
	

iot
fattori
	capacità tecnica

Cosa è internet?
un sistema di reti interconnesse

(lan)—.——.—-——.(lan) . =info reti

attacchi dos
kernel space (kernel/):  
  ├── kernel/       → core logic, scheduler, CPU  
  ├── mm/           → memory manager  
  ├── fs/           → file systems (ext4, XFS, VFS)  
  ├── net/          → network stack (TCP/IP, netfilter) [web:16][web:24]  
  ├── drivers/     → device drivers (storage, network, GPU, USB) [web:16][web:24]  
  └── arch/         → architecture-specific code
  
protocollo: arpanet, arp

MoDem

Come fanno queste reti a parlarsi?
uno stack spiega ad un device il  modo in cui si devono comportare all intero di una rete:
	chi sono (ip address)
	dove sono (NETMASK)
	chi/dove sono gli altri (router)

traceroute -n 8.8.8.8

domini www.google.it

TCPid
reti locali: LAN, pc  connessi tra loro che comunicano senza router (switch)
rete non locale: WAN pc che comunicano tramite router

switch
hub
sniff

mappa  reti internet cavi soottomarini
traffico internet
cloudflare 20% traffico mondiale

musk
page
cf
meta
amazon (aws)

aws, gcp,  


Variabile $PATH

HANA RIPE

stack TCP/IP -  32 bit
xxxx.xxxx.xxxx.xxxx - 8bit x4 = 32
range di IP-  0.0.0.0 -255.255.255.255
range NETMASK - 255.0.0.0 - 255.255.255.255

private ip :
	- 192.168.0.0
	- 10.0.0.0
	- 172.16.28.0

public ip :
	- 192.168.1.206 - 192.168.1.0-192.168.1.255
	- 192.168.2.25 - non fa parte della mia rete
	- 192.168.1.25 - fa parte della mia rete

192.168.1.0 - 192.168.1.255
10.100.0.0 - 10.100.0.255


| IP                          | NETMASK         | IP disponibili | CLASSI di rete | CIDR |
| --------------------------- | --------------- | -------------- | -------------- | ---- |
| 192.168.0.0-192.168.0.0     | 255.255.255.255 | 1              |                | /32  |
| 192.168.1.0-192.168.0.255   | 255.255.255.0   | 256            | C              | /24  |
| 192.168.0.0-192.168.255.255 | 255.255.0.0     | 65.536         | B              | /16  |
| 192.0.0.0-192.255.255.255   | 255.0.0.0       | 16.777.216     | A              | /8   |
| 0.0.0.0-255.255.255.255     | 0.0.0.0         | 4.294.967.296  |                | /0   |
8bit - ottetti 32 bit - iP(CTP/IP) - stack a 32 bit


Ecco le 5 righe chiave, come nella tabella originale:

| IP range                      | NETMASK         | IP disponibili | CIDR |
| ----------------------------- | --------------- | -------------- | ---- |
| 192.168.0.0 – 192.168.0.0     | 255.255.255.255 | 1              | /32  |
| 192.168.1.0 – 192.168.1.255   | 255.255.255.0   | 256            | /24  |
| 192.168.0.0 – 192.168.255.255 | 255.255.0.0     | 65.536         | /16  |
| 192.0.0.0 – 192.255.255.255   | 255.0.0.0       | 16.777.216     | /8   |
| 0.0.0.0 – 255.255.255.255     | 0.0.0.0         | 4.294.967.296  | /0   |

192.168.42.0/24 (255.255.255.0) - hotspot degli smartphone

DHCP - servizio che gestisce gli indirizzi ip delle NETMASK e informazioni sul router

192.168.1.2 - 192.168.1.254

IPv4 - IPv6
 IPv4 - 32bit - /32
 IPv6 - 128bit - /64


NETWORK - informazione obbligatoria che ci dice inquale rete ci troviamo


LAN1 <-------------> LAN2
	    (TRANK)

NETWORK - 192.168.1.0
HOST1 - 192.168.1.1
HOST2 - 192.168.1.2
BRODCAST - 192.168.1.3
NETMASK - /30 - 255.255.255.252


10.0.0.0/8 - SUPER STANDARD (reti cittadine)


segmentazione delle reti:

| IP      | 10.0.0.0/8 | 10.100.0.0/24 | 10.100.1.0/24 | 10.200.0.0/16 |
| ------- | ---------- | ------------- | ------------- | ------------- |
| NETWORK | 10.0.0.0   | 10.100.0.0    |               |               |

mtu - grandezza  massima di un pacchetto alla volta 
mtu 1500 - standard



---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------

Standard contenuti negli RFC: request for comments. standard definitivo di internet gestita dalla IETF.

SNP
SMTP

TCP/IP protocollo di rete a 32bit
Transmission Control Protocol - 3wanhandshake 

UDP
User Datagram Protocol - streaming/videocall/giochi online - se perdi qualche frame ci sono i codec. Velocità di trasmissione più ampia.

ICMP
CARP
HTTP(S) con s quando è criptato
zsh


Pila ISO/OSI:

| Livello | Nome (English) | Funzione principale                                                      | Unità di dati                     | Protocolli/Device esempi                                 |
| ------- | -------------- | ------------------------------------------------------------------------ | --------------------------------- | -------------------------------------------------------- |
| 7       | Application    | Interfaccia diretta con le applicazioni utente, fornisce servizi di rete | Dati                              | HTTP, FTP, SMTP, DNS, Chrome, Firefox fastweb+1          |
| 6       | Presentation   | Crittografia, decrittografia, codifica dei dati per l'applicazione       | Dati                              | TLS, SSL, JPEG, MIME, crittografia fastweb+1             |
| 5       | Session        | Gestione, controllo e sincronizzazione delle sessioni tra dispositivi    | Dati                              | SIP, RPC, NetBIOS, gestione sessioni dmf.unisalento+1    |
| 4       | Transport      | Trasferimento affidabile dei dati, controllo errori, numeri di porta     | Segmenti (TCP) / Datagrammi (UDP) | TCP, UDP, porte 80/443 fastweb+1                         |
| 3       | Network        | Instradamento (routing) dei pacchetti tra reti, indirizzi IP             | Pacchetti                         | IP, ICMP, ARP, router fastweb+1                          |
| 2       | Data Link      | Creazione pacchetti di dati, controllo flusso, addresses MAC             | Frame                             | Switch, MAC, LLC, MAC dmf.unisalento+2                   |
| 1       | Physical       | Trasmissione fisica dei bit sul mezzo (cavi, radiofrequenza)             | Bit                               | Cavi, hub, modem, Wi-Fi, Bluetooth, DSL dmf.unisalento+2 |


NAT sistema che fa funzionare il routing e quindi lo scambio di pacchetti
BGP serve per annunciare le rotte. Protocollo ad assoluta fiducia.

@@Serverfarm a Tivoli di TIM per richiedere una stecca di IP

Multiplexing - standard che divide e gestisci tante connessioni (o flussi di dati/ segnali) per poter inviarle nel traffico di rete.

chrome - www.google.it - avere porta locale - connect to google por443
google risponde attraverso la porta locale ^

Server:
HTTP 80
HTTPS 443
SSH 22 
FTP 21
SMTP
SMTS 
...

netstat -tunap
netstat -polenta
nc -lvp 5000
telnet ...ip... porta(5000....)
echo " ciao" | nc indirizzo servere e porta

telnet - telnetd / ssh - shhd 
dove ssh.. è criptato
quando finiscono con "d" si comportano come server. "d" da demoni
ssh-deamon
systemd, sempre attivo in background


crt-key (https)
key-exchange (ssh-pgp) criptata

tecnologia SSL certificates oppure TLS oppure GNU/TLS
autoriti di certificazione centralizzate
Certificati:
=! server
=! IP
== Domini

grep -v

last
host "ip"
nmap "ip"
telnet "ip" "porta"
ssh "ip" -p "porta"



https://corso-cyber.acido.be/tcp.html
