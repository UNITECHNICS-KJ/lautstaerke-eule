# Lautstärke-Eule

Lautstärke-Ampel fürs Kinderzimmer. Zeigt den Pegel als riesige dB-Zahl (grün / gelb / rot),
gibt bei anhaltendem Lärm eine Verwarnung mit lautem Alarm und Sprachansage und verhängt nach
der letzten Verwarnung eine Spielpause. Gebaut am 31.10.2026.

## Dateien

| Datei | Zweck |
|---|---|
| `app.html` | Quelle, zugleich die Fassung für claude.ai-Artifacts |
| `index.html` | eigenständige Seite, erzeugt mit `bash build.sh` |

## Mikrofon

In der claude.ai-Artifact-Ansicht ist das Mikrofon gesperrt, dort geht nur der Probelauf
(Schieberegler simuliert die Lautstärke). Mit Mikrofon läuft die App

- am Laptop: `index.html` doppelt anklicken (Edge/Chrome fragen nach dem Mikrofon),
- am Handy: nur über `https://` (z. B. GitHub Pages). Ist ein Link vorhanden, in `app.html`
  bei `APP_URL` eintragen, dann zeigt die Artifact-Fassung ihn bei gesperrtem Mikrofon an.

## Regeln (alle in den Einstellungen änderbar, Knopf 1 s gedrückt halten)

- Grenze 72 dB, gelb ab 66 dB. Die Anzeige ist nicht geeicht (`BASE = 100` auf dBFS),
  Feinabgleich über „Anzeige korrigieren“.
- Verwarnung erst, wenn es insgesamt 3 s zu laut war. Kurze Spitzen zählen nicht; das
  Lärmkonto baut sich bei Ruhe mit halber Geschwindigkeit wieder ab.
- Nach jeder Verwarnung 15 s Schonzeit. Während Alarm und Ansage misst die Eule nicht.
- 3. Verwarnung = Spielpause 5 min. Die Pausenzeit läuft nur, solange die Zahl grün ist.
- Nach 10 min ohne neue Verwarnung wird eine gelöscht (mit Lob). Lob auch alle 15 min ohne Verwarnung.
- Verwarnungen und laufende Pause überstehen Neuladen (localStorage), Beenden und
  „Spielen wieder erlauben“ brauchen gedrückt Halten.
