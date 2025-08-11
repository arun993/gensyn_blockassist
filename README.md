# Gensyn Blockassit

Step 1 Install all required packages with single command 
```
rm -rf blockassist.sh && wget https://raw.githubusercontent.com/arun993/gensyn_blockassist/refs/heads/main/blockassist.sh && chmod +x blockassist.sh && ./blockassist.sh
```

## Login guide 
### 1 ) With cloudflare recomanded if you are on wsl 
open another wal terminal and these comands 
```
wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x cloudflared
```
```
./cloudflared tunnel --url http://localhost:3000
```
Cloudflare will start you will get a link in the logs open it in your browser and login with your gmail Done!

### 2 ) With local tunnel recommanded for VPS 
open another wal terminal and these comands
```
npm install -g localtunnel
```
```
curl https://loca.lt/mytunnelpassword > Copy your ip address
```
Copy your ip address
```
lt --port 3000
```
Open the link in browser and paste you ip address then login page will appear soon . 
