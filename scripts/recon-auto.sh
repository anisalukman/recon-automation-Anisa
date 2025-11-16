#!/bin/bash

# ==========================================================
#  Recon Automation Script
#  Author : Anisa Lukman
#  Description: Automasi recon (subfinder → anew → httpx)
# ==========================================================

INPUT_FILE="input/domains.txt"
SUBOUTPUT="output/all-subdomains.txt"
LIVEOUTPUT="output/live.txt"
PROGRESS_LOG="logs/progress.log"
ERROR_LOG="logs/errors.log"

# Membersihkan file lama
> $SUBOUTPUT
> $LIVEOUTPUT
> $PROGRESS_LOG
> $ERROR_LOG

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a $PROGRESS_LOG
}

error() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1" >> $ERROR_LOG
}

log "=== Recon Started ==="

if [[ ! -f "$INPUT_FILE" ]]; then
    error "File input/domains.txt tidak ditemukan!"
    exit 1
fi

log "Membaca daftar domain dari $INPUT_FILE..."

while read domain; do
    if [[ -z "$domain" ]]; then
        continue
    fi

    log "Menjalankan subfinder untuk: $domain"

    subfinder -silent -d "$domain" 2>> $ERROR_LOG \
    | anew $SUBOUTPUT \
    | tee -a $PROGRESS_LOG

done < "$INPUT_FILE"

log "Subdomain enumeration selesai."
log "Total subdomain unik: $(wc -l < $SUBOUTPUT)"

log "Menjalankan httpx untuk mencari live hosts..."
httpx -silent -mc 200 -l $SUBOUTPUT 2>> $ERROR_LOG \
| anew $LIVEOUTPUT \
| tee -a $PROGRESS_LOG

log "Jumlah live hosts: $(wc -l < $LIVEOUTPUT)"

log "=== Recon Completed ==="
