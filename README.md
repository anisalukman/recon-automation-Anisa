# 🚀 RECON-AUTOMATION-ANISA

## 📌 **Deskripsi**

Project ini adalah automasi recon menggunakan `subfinder`, `anew`, dan `httpx`. Script menjalankan pipeline end-to-end untuk:

* 🔍 Subdomain enumeration
* 🧹 Deduplication
* 🌐 Live host checking
* 📝 Logging lengkap

## 📂 **Struktur Direktori**

*(replace dengan tree sebenarnya)*

## 🛠 **Install Tools**

```bash
sudo apt update
sudo apt install golang -y

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

go install -v github.com/tomnomnom/anew@latest

echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
source ~/.bashrc
```

## ▶️ **Cara Menjalankan**

```bash
chmod +x scripts/recon-auto.sh
./scripts/recon-auto.sh
```

## 📥 **Contoh Input (input/domains.txt)**

```
tesla.com
github.com
google.com
yahoo.com
hackerone.com
```

## 📤 **Contoh Output (output/live.txt)**

```
https://shop.tesla.com [200]
https://github.com [200]
```


