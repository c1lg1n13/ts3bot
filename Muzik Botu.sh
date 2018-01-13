function redMessage {
    echo -e "\\033[36;1m${@}\033[0m"
}

function greenMessage {
    echo -e "\\033[32;1m${@}\033[0m"
}

function kekMessage {
    echo -e "\\033[36;1m${@}\033[0m"
}

if [ -z "$1" ]
then
echo "./RAW.sh (BotUser)"
exit 0
fi


BOTUSER = $1


clear
greenMessage "################################################"
kekMessage""
kekMessage  "               Sinirsiz Muzik Botu"
kekMessage  "                   Version 2.5 [ BETA ]"
kekMessage  "                   Script by"
kekMessage  "                  DREAMSGAMING"
kekMessage  "              _____________________"
kekMessage ""
kekMessage  "                 Iletisim: c1lg1n13@gmail.com"
kekMessage""
greenMessage "################################################"
sleep 2
  redMessage "Paketleri kur"
  sleep 1
  apt-get install sudo
  sleep 1
  apt-get install screen
  sleep 1
  apt-get install nano
  greenMessage "Seçenekler"
  
  OPTIONS=("SinusBot/Install" "SinusBot/Start" "YouTube-DL/Installation")
  select OPTION in "${OPTIONS[@]}"; do
    case "$REPLY" in
      1|2|3 ) break;;
      5 ) errorQuit;;
      *) errorContinue;;
    esac
  done
  
  if [ "$OPTION" == "SinusBot/Install" ]; then
    INSTALL="Install"
    elif [ "$OPTION" == "SinusBot/Start" ]; then
    INSTALL="Start"
    elif [ "$OPTION" == "YouTube-DL/Installation" ]; then
    INSTALL="YT"
  fi
  
  sleep 1
    if [[ $INSTALL == "Install" ]]; then
kekMessage  "               Kullanici Olustur"
sleep 2
adduser --disabled-login --force-badname $1
kekMessage  "               Kullanici Girisi"
sleep 1
sleep 2
sleep 2
kekMessage  "               Guncellestir"
apt-get update
kekMessage  "               Yukselt"
apt-get upgrade
clear
kekMessage  "               Gerekli yazilimi indirin"
apt-get install x11vnc xinit xvfb libxcursor1 ca-certificates bzip2 curl libglib2.0-0 nano screen -y
rm -rf /tmp/.X11-unix/X40 /tmp/.sinusbot.lock
kekMessage  "               Muzik botu indir"
sudo -u $1 -H sh -c ' cd && curl -O https://www.sinusbot.com/dl/sinusbot-beta.tar.bz2'
kekMessage  "               Teamspeak indir"
sudo -u $1 -H sh -c ' cd && wget http://dl.4players.de/ts/releases/3.0.19.4/TeamSpeak3-Client-linux_amd64-3.0.19.4.run'
sudo -u $1 -H sh -c ' cd && tar xfvx sinusbot-beta.tar.bz2'
sudo -u $1 -H sh -c ' cd && chmod 755 TeamSpeak3-Client-linux_amd64-3.0.19.4.run '
sudo -u $1 -H sh -c ' cd && clear '
echo "ENTER yazin, Q, Y"
sleep 2
sudo -u $1 -H sh -c ' cd && ./TeamSpeak3-Client-linux_amd64-3.0.19.4.run'

sudo -u $1 -H sh -c ' cd && cp plugin/libsoundbot_plugin.so TeamSpeak3-Client-linux_amd64/plugins/'
sudo -u $1 -H sh -c ' cd && mv config.ini.dist config.ini'
clear
echo "Type Port and Path"
sleep 2
sudo -u $1 -H sh -c ' cd && nano config.ini'
clear
sleep 2
sudo -u $1 -H sh -c 'script /dev/null && cd && screen -AmdS BOT ./sinusbot -override-password foobar'
sleep 2
    exit 0
      fi
    
	  if [ "$INSTALL" == "Start" ]; then
	  kekMessage  "               Muzik botunu baslat"
sleep 1
clear
sudo -u $1 -H sh -c 'cd; rm -rf /tmp/.X11-unix/X40 /tmp/.sinusbot.lock; screen -AmdS BOT ./sinusbot -override-password foobar'
clear
sudo -u $1 -H sh -c "script /dev/null; screen -r BOT"
    exit 0
      fi

      if [[ $INSTALL == "YT" ]]; then
	  sleep 1
kekMessage  "               Guncellestir"
sleep 2
apt-get update
kekMessage  "               Yukselt"
sleep 2
apt-get upgrade
clear
kekMessage  "               Gerekli Bileseni Yukle"
apt-get install curl -y
sleep 1
kekMessage  "              Gerekli Bileseni Yukle 2 "
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sleep 1
chmod a+rx /usr/local/bin/youtube-dl
echo "Hazir!"
fi

exit 0