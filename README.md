# LFS (Linux From Scratch) - version 12.0
Automation script by Kawsar

Inspired by Write Your Own Operating System From YouTube
https://www.youtube.com/@writeyourownoperatingsystem

# Requirements:
- A 64-bit Linux host machine
- A USB Drive (16GB minimum, 32GB recommended)

# Usage
## Clone the repository to your local Linux host
<code>git clone https://github.com/KawsarKurban/LFS</code>

<code>chmod +x *.sh</code>

## Run create_user script first
<code>./create_user.sh</code>

You should be switched to lfs user shell

## Run env_user script
<code>./env_user.sh</code>

Plug in your USB drive and change the drive letter in the start.sh script accordingly. In this case, USB drive is /dev/sdb
## Run start script
<code>./start.sh</code>
