FROM dorowu/ubuntu-desktop-lxde-vnc:focal-lxqt

WORKDIR /tmp

# Install SQL Workbench
RUN wget "https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
RUN apt install ./dbeaver-ce_latest_amd64.deb

# Install Edge
RUN wget -O - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft.gpg
RUN rm /etc/apt/sources.list.d/microsoft-edge*.list || true
RUN sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'
RUN apt update && apt install -y microsoft-edge-stable

