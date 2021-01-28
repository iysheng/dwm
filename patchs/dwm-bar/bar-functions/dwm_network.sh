#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

#dwm_network () {
#    CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
#    if [ "$CONNAME" = "" ]; then
#        CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
#    fi
#
#    PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')
#    PUBLIC=$(curl -s https://ipinfo.io/ip)
#
#    printf "%s" "$SEP1"
#    if [ "$IDENTIFIER" = "unicode" ]; then
#        printf "🌐 %s %s | %s" "$CONNAME" "$PRIVATE" "$PUBLIC"
#    else
#        printf "NET %s %s | %s" "$CONNAME" "$PRIVATE" "$PUBLIC"
#    fi
#    printf "%s\n" "$SEP2"
#}
#dwm_network

dwm_wifi () {
    wifi_status=$(nmcli dev | grep -E "wifi.* connected" | wc -l)

    if [ $wifi_status -gt 0 ];then
        printf "直 "
    else
        printf "睊 "
    fi
}

dwm_wifi
