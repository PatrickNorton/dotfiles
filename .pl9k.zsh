# Powerlevel9k customisation

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="white"

zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')
        local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{blue}'
                echo -n "%{$color%}%BWifi Off%b"

        elif [ "$ssid" = "" ]; then
            local color='%F{blue}'
            echo -n "%{$color%}%BNo Wifi%b"

        else
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{white}'

                [[ $speed -gt 100 ]] && color='%F{green}'
                [[ $speed -lt 50 ]] && color='%F{red}'
                [[ $speed -eq 0 ]] && color='%F{blue}'

                echo -n "%{$color%}$speed Mbps \uf1eb%f" # removed char not in my PowerLine font
        fi
}
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_BATTERY_STAGES=(" " " " " " " " " ")	#  \uF244  \uF243  \uF242  \uF241  \uF240

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}>>> %f'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs swap newline time command_execution_time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status pyenv background_jobs battery custom_wifi_signal)
