#!/usr/bin/env bash
set -e  # Exit on any error
set -o pipefail

# Colors
PINK='\033[1;35m'
NC='\033[0m' # No Color

# Clone repository
git clone https://github.com/gensyn-ai/blockassist.git
cd blockassist

# Run setup script
./setup.sh

# Install pyenv
curl -fsSL https://pyenv.run | bash

# Configure pyenv in the current session
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"

# Reload bashrc
source ~/.bashrc

# Install dependencies for Python
sudo apt update
sudo apt install -y \
    make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    libsqlite3-dev curl git libncursesw5-dev xz-utils tk-dev libxml2-dev \
    libxmlsec1-dev libffi-dev liblzma-dev

# Install Python
pyenv install 3.10
pyenv global 3.10

# Install Python packages
pip install --upgrade pip
pip install psutil readchar

# Download and install cuDNN
wget https://developer.download.nvidia.com/compute/cudnn/9.11.0/local_installers/cudnn-local-repo-ubuntu2204-9.11.0_1.0-1_amd64.deb
sudo dpkg -i cudnn-local-repo-ubuntu2204-9.11.0_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-ubuntu2204-9.11.0/cudnn-local-4EC753EA-keyring.gpg /usr/share/keyrings/
echo "deb [signed-by=/usr/share/keyrings/cudnn-local-4EC753EA-keyring.gpg] file:///var/cudnn-local-repo-ubuntu2204-9.11.0 /" | sudo tee /etc/apt/sources.list.d/cudnn-local.list
sudo apt update
sudo apt install -y libcudnn9 libcudnn9-dev

# Add CUDA to PATH
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

# Final message in pink
echo -e "${PINK}All processes completed! Now run:${NC} python run.py"
