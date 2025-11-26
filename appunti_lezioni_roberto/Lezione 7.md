# **BGP — Border Gateway Protocol**

È il **protocollo di routing di Internet**.

Serve ai **grandi router degli ISP** (Telecom, Vodafone, Cloudflare, Google…) per:

- **scambiarsi informazioni** su quali reti IP esistono nel mondo
    
- scegliere **il percorso migliore** per raggiungere una destinazione
    

### Cosa “annuncia” BGP?

Blocchi di indirizzi IP:

`Esempio: 8.8.8.0/24 (Google DNS)`

Gli ISP dicono agli altri:  
“Se vuoi raggiungere 8.8.8.0/24 → passi da me”

### Caratteristiche importanti:

|Caratteristica|Effetto|
|---|---|
|Inter-domain routing|collega reti diverse (AS)|
|Path vector|sceglie il percorso migliore|
|Basato su **AS** (Autonomous System)|ogni ISP ha un numero AS (es: AS15169 = Google)|
|Fondamentale per Internet|senza BGP → Internet collassa|

### Problemi di sicurezza:

❌ **BGP Hijacking** → un AS annuncia IP che non gli appartengono  
(Usato da stati o hacker per **dirottare traffico**)

❌ **BGP Leak** → un ISP diffonde rotte sbagliate  
(può far “rompere Internet”)

➡️ **BGP è il cuore di Internet ma NON ha autenticazione** → grosso problema.

---

# 📡 **POP — Point of Presence**

Sono **punti di accesso distribuiti nel mondo** che ti collegano ai servizi nel modo più **veloce e vicino**.

📌 Dentro un PoP trovi:

- router
    
- switch
    
- server di caching
    
- connessioni ad alta velocità
    
- peering tra operatori
    

### Perché esistono?

Per ridurre:

- **latenza**
    
- **congestione**
    
- **costi di transito**
    

Esempi:

- YouTube ha PoP ovunque → il video è già **vicino a te**
    
- Cloudflare/Google hanno **migliaia** di PoP globali
    

➡️ POP = **ciò che rende Internet veloce e locale**.

---

# 🔁 **NAT — Network Address Translation**

Senza NAT Internet sarebbe collassata.

Serve per:

- **mappare IP privati → IP pubblico**
    
- permettere a più dispositivi interni di **uscire usando un solo IP pubblico**
    

Esempio tipico:

`Dispositivi in LAN → 192.168.1.x IP Pubblico del router → 93.45.12.90`

Quando un PC interno va su Internet:

`192.168.1.25:53412 → tradotto in → 93.45.12.90:40000`

⭐ NAT = firewall naturale  
(da Internet non si può raggiungere un host interno senza regola di port forwarding)

---

# 🔥 **iptables e MASQUERADE**

Il comando che hai scritto:

`iptables -t nat -A POSTROUTING -j MASQUERADE`

Significa:

> “Per tutti i pacchetti che escono verso Internet, **nascondi** l’IP interno e sostituiscilo con l’IP pubblico dell’interfaccia di uscita.”

È **NAT dinamico**:

- funziona anche se l’IP pubblico cambia (es. DHCP del provider)
    

### Dove si applica:

Tabella:

- `-t nat` → tabella NAT
    

Catena:

- `POSTROUTING` → dopo aver deciso dove spedire il pacchetto
    

Azione:

- `MASQUERADE` → cambia sorgente col **miglior IP di uscita**
    

➡️ Questo comando **trasforma un Linux in un router NAT**.

---

# 🎯 Mini riepilogo per studiare

|Argomento|A cosa serve|
|---|---|
|**BGP**|Routing tra ISP → tiene in piedi Internet|
|**PoP**|Accesso locale ai contenuti per essere più veloce|
|**NAT**|Molti IP privati → 1 IP pubblico|
|**MASQUERADE**|NAT dinamico lato Linux router|