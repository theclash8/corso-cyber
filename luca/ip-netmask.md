# Recap

- Cosa è una rete
	- LAN - reti locali
	- WAN - reti globali o cittadine

- Funzionamento di una rete locale
	- sniffing e modalità promiscua

* 3 domande
	* Chi sono? - INDIRIZZO IP
	* Dove sono? - NETMASK
	* Chi/dove sono gli altri? - DEFAULT GW - ROUTER

### UTILY

- Script Play
```
script --timing=timing.log sessione.log
``` 

* Variabile $PATH
```
luca@corso-cyber:~$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

luca@corso-cyber:~$ whereis ls
ls: /usr/bin/ls /usr/share/man/man1/ls.1.gz

```

## INDIRIZZO IP - NETMASK

**8bit -> 4 ottetti -> 32bit -> IP (TCP/IP) -> stack a 32bit**

```
luca@corso-cyber:~$ ifconfig 
ens18: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.100.0.130  netmask 255.255.255.0  broadcast 10.100.0.255
        inet6 fe80::be24:11ff:fed6:a30a  prefixlen 64  scopeid 0x20<link>
        ether bc:24:11:d6:a3:0a  txqueuelen 1000  (Ethernet)
        RX packets 2105691  bytes 692921795 (660.8 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1657542  bytes 341176054 (325.3 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 354  bytes 111796 (109.1 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 354  bytes 111796 (109.1 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

CHI SONO? - **10.100.0.130**
DOVE SONO?  - **255.255.255.0**

**IANA - RIPE:** Organizzazioni che si occupano dell'allocazione degli indirizzi IP.

stack TCP/IP - **32bit**

xxx.xxx.xxx.xxx - 8bit x 4 = **32bit**

**RANGE DI IP** - 0.0.0.0 - 255.255.255.255
**RANGE NETMASK** - 255.0.0.0.0 - 255.255.255.255

-> **Private IP**
	* 192.168.0.0
	* 10.0.0.0
	* 172.16.28.0

-> Public IP
* Tutti gli altri eccetto netmask e reti locali

### Netmask

| IP                            | Netmask         | IP DISPONIBILI | CLASSI di RETI |
| ----------------------------- | --------------- | -------------- | -------------- |
| 192.168.0.0 - 192.168.0.0     | 255.255.255.255 | 1              |                |
| 192.168.1.0 - 192.168.0.255   | 255.255.255.0   | 256            | C              |
| 192.168.0.0 - 192.168.255.255 | 255.255.0.0     | 65.534         | B              |
| 192.0.0.0 - 192.255.255.255   | 255.0.0.0       | 16.777.214     | A              |
| 0.0.0.0 - 255.255.255.255     | 0.0.0.0         | 4.294.967.294  |                |
255.255.255.255 -> /32 (CIDR)
255.255.255.0 -> /24 (CIDR)
255.255.0.0 -> /16 (CIDR)
255.0.0.0 -> /8 (CIDR)

192.168.1.0/24 -> 192.168.0.0 netmask 255.255.255.0

### Altri standard IP

192.168.42.0/24 (255.255.255.0) -> Hotspot degli smartphone

-> **DHCP**: servizio che gestisce gli indirizzi IP, netmask e informazioni sul router.

router: 192.168.1.1
netmask: /24 - 255.255.255.0
192.168.1.2 -> 192.168.1.254

---

## ROUTER

```
luca@corso-cyber:~$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.100.0.1      0.0.0.0         UG    0      0        0 ens18
10.100.0.0      0.0.0.0         255.255.255.0   U     0      0        0 ens18
```

CHI SONO GLI ALTRI - **10.100.0.1**

## IPV4 - IPV6

-> IPV4: 32bit - IPV6: 128bit (2¹²⁸ = 340.282.366.920.938.463.463.374.607.431.768.211.456)

IPV4 -> /32
IPV6 -> /64

### ESEMPIO  BRUTTO

HACKERINO 192.168.1.1
LAN 1 <------------------------------>  LAN 2

* PC ufficio                                       * PC magazzino
* WLAN                                            * VIDEOSORVEGLIANZA MAGAZZINO


Network - 192.168.1.0
Host 1 - 192.168.1.1
Host 2 - 192.168.1.2
Broadcast - 192.168.1.3
Netmask - /30 - 255.255.255.252


TCP
**IP**
PHY


10.0.0.0/8 - 10.100.0.0/24 + 10.100.1.0/24 - 10.200.0.0/16

network ->10.0.0.0
network -> 10.100.0.0

