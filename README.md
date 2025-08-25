# 🐉 Kali Linux XFCE Desktop in Docker (with VNC + noVNC)

Run a **Kali Linux XFCE** desktop environment inside Docker with **VNC** and **noVNC (web browser access)**.  
This setup gives you a lightweight, portable Kali desktop environment you can access remotely!

---

## ✨ Features
- **Kali Linux (rolling release)** base image  
- **XFCE desktop** environment (the same one used in Kali by default)  
- **Kali themes** pre-installed → full dark mode dragon vibes 🐉  
- **VNC access** (port **5901**)  
- **Browser access via noVNC** (port **6080**, open in any browser)  
- **Firefox ESR** included  
- Useful tools: `vim`, `git`, `curl`, `wget`, etc.  

---

## 📦 Build the Image
Clone the repository and build the Docker image:

```bash
git clone https://github.com/MohammadKobirShah/docker-kali-linux-desktop.git
cd docker-kali-linux-desktop

docker build -t kali-xfce-vnc .
```

---

## 🚀 Run the Container
Start the container with VNC and noVNC enabled:

```bash
docker run -it -p 5901:5901 -p 6080:6080 --name kali-desktop kali-xfce-vnc
```

---

## 🖥️ Access the Kali Desktop
- Open **noVNC in your browser**:  
  ```
  http://localhost:6080
  ```

- Or connect via a VNC client to:  
  ```
  localhost:5901
  ```

(Default session autostarts XFCE desktop with no password — adjust for production!)

---

## 📂 File Layout
```
.
├── Dockerfile   # Docker build recipe
└── README.md    # Documentation (this file)
```

---

## ⚠️ Security Notice
This setup is configured with:
- **No VNC password** (`--I-KNOW-THIS-IS-INSECURE`)
- **Self-signed TLS cert**

It’s designed for **local testing/labs**.  
If you plan to expose it to the internet/cloud:
- Add `-passwd` option in `vncserver`  
- Use a proper SSL certificate  
- Run behind a secure reverse proxy  

---

## 🐉 Example Screenshot
Once running, you’ll see a full **Kali XFCE desktop** themed environment (with dark menus, dragon icons, and Firefox preinstalled) directly in your browser.

---

## 🛠️ Troubleshooting
- **Package not found** → Run `apt update` inside the container and try again.  
- **Blank VNC screen** → Make sure XFCE is installed (`kali-desktop-xfce`) and that you started the `vncserver`.  
- **Ports already in use** → Change `-p 5901:5901 -p 6080:6080` to different ports.  

---

## 📜 License
This project is provided under the **MIT License**.  
Kali Linux is a trademark of **Offensive Security** – this repo is just a Dockerized environment for convenience.
