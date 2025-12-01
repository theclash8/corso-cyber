Le Netmask servono per far capire al pc quale è la sua rete locale
gli indirizzi ipv4 sono a 32 bit 

Reti locali
192.168.0.0 --> Netmask 255.255.255.0
172.16.0.0 --> netmask 255.255.0.0
10.0.0.0 --> Netmask 255.0.0.0

Netmask cidr

Approfondimento Gemini:

### Netmask (Maschera di Sottorete)

La Netmask è un parametro fondamentale nella configurazione di una rete IP. Il suo scopo principale è quello di **determinare quale parte di un indirizzo IP identifica la rete (network portion) e quale parte identifica l'host specifico all'interno di quella rete (host portion)**.

Immagina un indirizzo IP come un indirizzo postale: la Netmask ti dice quale parte dell'indirizzo è la "città" (la rete) e quale parte è il "numero civico" (l'host).

Quando un computer deve inviare un pacchetto dati, confronta l'indirizzo IP di destinazione con il proprio indirizzo IP e la propria Netmask.

- Se l'indirizzo di destinazione si trova nella stessa rete locale (determinata dalla Netmask), il computer invia il pacchetto direttamente.
- Se l'indirizzo di destinazione si trova in una rete diversa, il computer invia il pacchetto al suo gateway predefinito (solitamente un router), che si occuperà di inoltrarlo.

### Indirizzi IPv4

Gli indirizzi IPv4 sono, come hai notato, a **32 bit**. Questo significa che sono una sequenza di 32 zeri o uno. Per renderli più leggibili, vengono solitamente divisi in quattro gruppi di 8 bit (chiamati "ottetti"), separati da punti. Ogni ottetto può assumere un valore da 0 a 255.

Esempio: un indirizzo IP come `192.168.1.10` in binario sarebbe:  
`11000000.10101000.00000001.00001010`

### Reti Locali (Indirizzi IP Privati)

Gli indirizzi che hai menzionato sono esempi di **indirizzi IP privati**. Questi intervalli sono stati riservati dall'IANA (Internet Assigned Numbers Authority) per l'uso all'interno di reti private (come la tua casa o l'ufficio) e non sono instradabili direttamente su Internet. Questo aiuta a conservare gli indirizzi IP pubblici e fornisce un livello di sicurezza.

Ecco i tre intervalli principali di indirizzi IP privati e le loro Netmask "classiche":

1. **`10.0.0.0` a `10.255.255.255`**
    
    - **Netmask classica:** `255.0.0.0`
    - In binario: `11111111.00000000.00000000.00000000`
    - Questo significa che il primo ottetto (`10`) identifica la rete, mentre i restanti tre ottetti possono essere usati per gli host. È una rete molto grande, adatta a grandi organizzazioni.
2. **`172.16.0.0` a `172.31.255.255`**
    
    - **Netmask classica:** `255.255.0.0`
    - In binario: `11111111.11111111.00000000.00000000`
    - Qui, i primi due ottetti (`172.16` fino a `172.31`) identificano la rete, e gli ultimi due ottetti sono per gli host.
3. **`192.168.0.0` a `192.168.255.255`**
    
    - **Netmask classica:** `255.255.255.0`
    - In binario: `11111111.11111111.11111111.00000000`
    - In questo caso, i primi tre ottetti (`192.168.x`) identificano la rete, e solo l'ultimo ottetto è disponibile per gli host. È la configurazione più comune per le reti domestiche e piccole imprese.

### Come funziona la Netmask in binario

La Netmask è composta da una serie di "1" seguiti da una serie di "0".

- I bit a "1" nella Netmask corrispondono alla parte dell'indirizzo IP che identifica la **rete**.
- I bit a "0" nella Netmask corrispondono alla parte dell'indirizzo IP che identifica l'**host**.

Per determinare l'indirizzo di rete, si esegue un'operazione logica AND bit a bit tra l'indirizzo IP e la Netmask.

Esempio:  
Indirizzo IP: `192.168.1.10` (`11000000.10101000.00000001.00001010`)  
Netmask: `255.255.255.0` (`11111111.11111111.11111111.00000000`)

AND bit a bit:  
`11000000.10101000.00000001.00000000` = `192.168.1.0` (Indirizzo di rete)

### Netmask CIDR (Classless Inter-Domain Routing)

La notazione CIDR è un modo più compatto e flessibile per rappresentare le Netmask. Invece di scrivere l'intera Netmask in formato decimale puntato, si indica l'indirizzo IP seguito da una barra (`/`) e il **numero di bit consecutivi a "1" nella Netmask**.

Questo numero rappresenta la lunghezza del prefisso di rete.

Esempi di conversione:

- `255.255.255.0` ha 24 bit a "1" consecutivi. Quindi, un indirizzo come `192.168.1.0` con questa Netmask si scrive `192.168.1.0/24`.
- `255.255.0.0` ha 16 bit a "1" consecutivi. Quindi, `172.16.0.0` con questa Netmask si scrive `172.16.0.0/16`.
- `255.0.0.0` ha 8 bit a "1" consecutivi. Quindi, `10.0.0.0` con questa Netmask si scrive `10.0.0.0/8`.

Il CIDR ha sostituito il vecchio sistema di classi (Classe A, B, C) perché permette una maggiore flessibilità nella suddivisione delle reti (subnetting), consentendo di creare reti di dimensioni più precise e di utilizzare gli indirizzi IP in modo più efficiente.