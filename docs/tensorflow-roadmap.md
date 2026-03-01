# TensorFlow – Myöhemmän vaiheen kehitysmuistio
## AI-ITSM-Compliance-Auto | Gatehouse Infrastructure

---

## Miksi TensorFlow poistettiin nyt

- Python 3.14 ei tue TensorFlowia (max 3.12)
- Projekti toimii ilman sitä — raportointi ja validointi pyörivät
- Riippuvuus oli turha tässä vaiheessa

---

## Milloin TensorFlow otetaan takaisin

Kun jokin seuraavista on totta:

- Python 3.12 on asennettu kehitysympäristöön
- Projekti tarvitsee oikeaa ML-logiikkaa, ei vain sääntöpohjaista validointia
- AI-ITSM-moduuli laajenee luokittelun suuntaan

---

## Mitä TensorFlowlla tullaan tekemään

### 1. Incidenttien automaattinen luokittelu
**Idea:** ITSM-tiketit luokitellaan automaattisesti prioriteetin ja kategorian mukaan ML-mallin avulla — ei manuaalisesti.

**Käytännössä:**
- Syöte: tiketti-teksti (otsikko + kuvaus)
- Malli: tekstiluokittelija (esim. LSTM tai yksinkertainen dense-verkko)
- Tuloste: prioriteetti (P1/P2/P3) + kategoria (verkko/identiteetti/laite/sovellus)

**Hyöty Gatehouse-kontekstissa:** AI-assistoitu riskiluokittelu ennen quality gatea — change request saa automaattisen riskiluokan ehdotuksen.

---

### 2. Anomalioiden tunnistus infralokeista
**Idea:** Lokidata analysoidaan ja poikkeamat tunnistetaan automaattisesti.

**Käytännössä:**
- Syöte: GitHub Actions -lokit, CI/CD-pipeline-output
- Malli: autoencoder anomalioiden tunnistukseen
- Tuloste: hälytys jos pipeline käyttäytyy poikkeavasti

**Hyöty:** Compliance-rikkomusten ennakointi ennen kuin ne näkyvät auditissa.

---

### 3. Compliance-riskin ennustaminen
**Idea:** Change requestin tekstin perusteella ennustetaan kuinka todennäköisesti se rikkoo ISO 27001 -kontrollin.

**Käytännössä:**
- Syöte: change-request.md -tiedosto
- Malli: binääriluokittelija (compliant / non-compliant)
- Tuloste: riskiprosentti + suositeltu hyväksyjämäärä

**Hyöty:** Validate-change-request.py saa ML-kerroksen sääntöpohjaisen logiikan rinnalle.

---

## Tekninen toteutuspolku

```
Vaihe 1: Asenna Python 3.12
Vaihe 2: Luo venv312 ja asenna requirements.txt TF:llä
Vaihe 3: Rakenna yksinkertainen luokittelija synteettisellä datalla
Vaihe 4: Integroi validate-change-request.py -skriptiin
Vaihe 5: Lisää ML-tulos compliance-raporttiin
```

---

## Minimaalinen aloituspiste (kun aika tulee)

```python
# Yksinkertainen tekstiluokittelija TensorFlowlla
import tensorflow as tf
from tensorflow.keras.layers import Dense, Embedding, GlobalAveragePooling1D
from tensorflow.keras.models import Sequential

model = Sequential([
    Embedding(input_dim=10000, output_dim=16),
    GlobalAveragePooling1D(),
    Dense(16, activation='relu'),
    Dense(3, activation='softmax')  # P1, P2, P3
])

model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])
```

Tämä on lähtöpiste incidenttien prioriteettiluokitteluun.

---

## Yhteys Gatehouse-arkkitehtuuriin

```
Change Request
     ↓
ML Risk Classifier (TensorFlow)  ← TULEVA VAIHE
     ↓
Policy Engine (nykyinen validate-change-request.py)
     ↓
Quality Gate (pass/fail)
     ↓
Compliance Report (ISO 27001)
```

ML-kerros ei korvaa policy engineä — se täydentää sitä.

---

## Muistettavaa

- TensorFlow vaatii Python 3.9–3.12
- Aloita synteettisellä harjoitusdatalla, ei oikeilla tiketeillä
- Pidä ML-logiikka erillisessä moduulissa (ml/classifier.py)
- Dokumentoi malli ja sen päätökset — auditointiketju pätee myös ML:ään

---

*Luotu: 2026-03-02 | Gatehouse Infrastructure kehitysmuistio*
