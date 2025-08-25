# Kali base image (amd64)
FROM --platform=linux/amd64 kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# Update and install XFCE desktop + Kali themes + VNC + noVNC + essentials
RUN apt update -y && apt install -y --no-install-recommends \
    kali-desktop-xfce \
    kali-themes \
    kali-wallpapers \
    tigervnc-standalone-server \
    novnc websockify \
    firefox-esr \
    sudo xterm \
    systemd systemd-sysv \
    dbus-x11 x11-utils x11-xserver-utils x11-apps \
    snapd vim net-tools curl wget git tzdata ca-certificates \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Prepare X11 auth file
RUN touch /root/.Xauthority

# Expose VNC (5901) + noVNC WebSocket (6080)
EXPOSE 5901
EXPOSE 6080

# Launch VNC server + self-signed cert + noVNC + keep alive
CMD bash -c '\
    vncserver -localhost no -SecurityTypes None -geometry 1280x800 --I-KNOW-THIS-IS-INSECURE && \
    openssl req -new -subj "/C=JP" -x509 -days 365 -nodes -out self.pem -keyout self.pem && \
    websockify -D --web=/usr/share/novnc/ --cert=self.pem 6080 localhost:5901 && \
    tail -f /dev/null'
