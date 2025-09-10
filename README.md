# 🚀 MediaFlow Proxy per HuggingFace

> **Utilizza questo Dockerfile per installare facilmente qualsiasi MediaFlow Proxy su HuggingFace Spaces**

## 📋 Descrizione

Questo progetto fornisce un Dockerfile ottimizzato per deployare MediaFlow Proxy su HuggingFace Spaces, combinando le funzionalità di due repository principali:

- 🎯 **[mhdzumair/mediaflow-proxy](https://github.com/mhdzumair/mediaflow-proxy)** - Proxy server ad alte prestazioni per streaming media
- 🔧 **[nzo66/HF-MFP](https://github.com/nzo66/HF-MFP)** - Configurazioni specifiche per HuggingFace

## ✨ Caratteristiche

- 📦 **Setup automatico** - Clone e merge automatico di entrambi i repository
- 🐳 **Docker ottimizzato** - Immagine leggera basata su Python 3.10
- ⚡ **Performance elevate** - Configurato con Uvicorn e 4 workers
- 🔒 **Sicuro** - Supporto per DRM e proxy avanzati
- 🌐 **HuggingFace Ready** - Preconfigurato per Spaces

## 🛠️ Installazione

### HuggingFace Spaces
1. Crea un nuovo Space su HuggingFace
2. Carica questo Dockerfile
3. (OPZIONALE) Modifica il link per mediaflow-proxy se ne vuoi usare uno custom
4. Configura le Variabili d'Ambiente (vedi sezione sotto)
5. Il deployment avverrà automaticamente

## ⚙️ Configurazione Variabili d'Ambiente

### 📋 Come impostare le Variabili su HuggingFace Spaces

#### Passaggi per la configurazione:

1. **Accedi al tuo Space**
   - Vai su [HuggingFace Spaces](https://huggingface.co/spaces)
   - Apri il tuo Space MediaFlow Proxy

2. **Naviga alle Impostazioni**
   - Clicca sulla tab **"Settings"** (Impostazioni) nel tuo Space
   - Scorri verso il basso fino alla sezione **"Variables and secrets"**

3. **Aggiungi le Variabili**
   - Clicca su **"New secret"** per aggiungere ogni variabile
   - Inserisci nome e valore come specificato sotto
   - Clicca **"Save"** per ogni variabile

### 🔑 Variabili Richieste

#### Variabile Obbligatoria:

```
API_PASSWORD
```

*⚠️ Sostituisci "YourPassword" con una password sicura di tua scelta*

#### Variabili per MammaMia (Opzionali):
Se utilizzi l'addon MammaMia, aggiungi anche:

```
TRANSPORT_ROUTES
```

Ecco come dovrebbero apparire le tue variabili nelle Settings SECRET di HuggingFace:

| Nome Variabile | Valore | Descrizione |
|---|---|---|
| `API_PASSWORD` | `MiaPasswordSicura123!` | Password per accedere al proxy |
| `TRANSPORT_ROUTES` | Opzionale `{"all://*.ichigotv.net": {"verify_ssl": false}, "all://ichigotv.net": {"verify_ssl": false}}` | Solo per addon MammaMia |
| `ENABLE_STREAMING_PROGRESS` | Opzionale `false`/`true` | Abilita il logging del progresso streaming. Default è `false` |
| `DISABLE_HOME_PAGE` | Opzionale `false`/`true` | Disabilita l'interfaccia della home page. Restituisce 404 per il percorso root e accesso diretto a index.html. Default è `false` |
| `DISABLE_DOCS` | Opzionale `false`/`true` | Disabilita la documentazione API (Swagger UI). Restituisce 404 per il percorso /docs. Default è `false` |
| `DISABLE_SPEEDTEST` | Opzionale `false`/`true` | Disabilita l'interfaccia speedtest. Restituisce 404 per il percorso /speedtest e accesso diretto a speedtest.html. Default è `false` |
| `STREMIO_PROXY_URL` | Opzionale Esempio: `http://127.0.0.1:11470` | URL del server Stremio per il proxying alternativo dei contenuti. |
| `M3U8_CONTENT_ROUTING` | Opzionale `mediaflow`/`stremio`/`direct` | Strategia di routing per gli URL dei contenuti M3U8: `mediaflow` (default), `stremio`, o `direct` |

### 🔒 Note di Sicurezza

- **API_PASSWORD**: Usa una password forte e unica
- Le variabili d'ambiente sono private e visibili solo a te
- Non condividere mai le tue credenziali
- Puoi modificare le variabili in qualsiasi momento dalle Settings

### ✅ Verifica Configurazione

Dopo aver impostato le variabili:
1. Il tuo Space si riavvierà automaticamente
2. Controlla i **"Logs"** per verificare che non ci siano errori
3. Testa la connessione al proxy con la password impostata
4. Se ci sono problemi, controlla che le variabili siano state salvate correttamente

---

💡 **Suggerimento**: Le variabili d'ambiente vengono applicate automaticamente al riavvio del container. Non è necessario ricompilare l'immagine Docker.

📚 **Documentazione**: Per maggiori informazioni, consulta i repository originali linkati nella sezione Descrizione.
