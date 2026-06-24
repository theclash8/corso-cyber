
https://corso-cyber.acido.be/isoosi.html

ES 03:
	D1: 
		93.184.216.34 - PUBBLICO
	    10.0.1.152 - PRIVATO - si trova nel blocco RFC 1928 = 10.0.0.0 - 10.255.255.255
	D2:
		PACCHETTO SYN:
			2024-03-15 - DATA
			09:42:11.004123 - ORA
			TCP - PROTOCOLLO
			10.0.1.152 - SRC IP
			52340 - SRC PORT
			93.184.216.34 - DST IP
			80 - DST PORT
		PACCHETTO SYN-ACK:
			2024-03-15 - DATA
			09:42:11.047891 - ORA
			TCP - PROTOCOLLO
			93.184.216.34 - SRC IP
			80 - SRC PORT
			10.0.1.152 - DST IP
			52340 - DST PORT
		PACCHETTO ACK:
			2024-03-15 - DATA
			09:42:11.047994 - ORA
			TCP - PROTOCOLLO
			10.0.1.152 - SRC IP
			52340 - SRC PORT
			93.184.216.34 - DST IP
			80 - DST PORT
	D3:
		Il protocollo applicativo che sta trasportando il pacchetto con flag [.P]  inviato da 10.0.0.152 è  HTTP, lo si può dedurre dalla DST PORT 80.
	D4:
		LAYER coninvolti sono: APPLICATION (80/HTTP); TRANSPORT (TCP); NETWORK (IP).
	D5: 
		La differenza tra 64 e 51 è di 13, che è il numero di HOP che separa i due HOST.
	D6: 
		FEATURE della WORKSTATION 10.0.1.152 - 10.0.1.0/26
		NETWORK: 10.0.1.0
		SUBNET MASK: 255.255.255.192
		BROADCAST: 10.0.1.63
		RANGE inirizzi HOST validi: 10.0.1.0 - 10.0.1.63 (n. 64)
		RANGE indirizzi HOST utilizzabili 10.0.1.1 - 10.0.1.62 (n. 62)
	D7: 
		La procedura di chiusara è composta da 3 pacchetti: FIN+ACK; FIN+ACK; ACK
		FIN+ACK - utente dice al servere "voglio chiudere la connessione"
		FIN+ACK - servere dice ad utente "chiudo la connessione e confermo chiusura"
		ACK - utente dice al server "confermo arrivvo della chiusura"
	D8:
		TCP si trova nel LAYER TRANSPORT e IP si  trova nel LAYER INTERNET
		IP, INTERNET PROTOCOL, trova la strada per far viaggiare il pacchetto
		TCP, TRANSPORT CONTROL PROTOCOL, responsabile dell'integrità del pacchetto.

|**Protocollo**|**Numero IANA**|**Layer OSI**|**Servizio tipico**|
|---|---|---|---|
|**ICMP**|1|3 (Network)|Diagnostica di rete (es. ping, traceroute) e segnalazione errori IP.|
|**TCP**|6|4 (Transport)|Trasporto affidabile, orientato alla connessione (es. traffico HTTP, SSH, email).|
|**UDP**|17|4 (Transport)|Trasporto veloce, non affidabile e "connectionless" (es. DNS, streaming video, VoIP).|
|**OSPF**|89|3 (Network)|Routing dinamico interno per lo scambio di percorsi (Interior Gateway Protocol).|
|**ESP (IPSec)**|50|3 (Network)|Cifratura e autenticazione dei pacchetti per la creazione di tunnel VPN (Encapsulating Security Payload).|
