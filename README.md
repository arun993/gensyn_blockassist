# Gensyn Blockassit

Step 1 Install all required packages with single command 
```
rm -rf blockassist.sh && wget https://raw.githubusercontent.com/arun993/gensyn_blockassist/refs/heads/main/blockassist.sh && chmod +x blockassist.sh && ./blockassist.sh
```

## Login guide 
### 1 ) With cloudflare recomanded if you are on wsl 
```
wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x cloudflared
./cloudflared tunnel --url http://localhost:3000

```
