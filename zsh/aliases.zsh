alias reload!='. ~/.zshrc'
alias h='cd ~/'

alias c='clear'
alias pk='pkill -9'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

alias expose='ngrok -authtoken $NGROKTOKEN --subdomain=couch'
alias iterm='open -a iTerm.app `pwd`'

alias mkdir='mkdir -pv'
alias finder='open ./'
alias gd='git diff'

##UPDATERS
alias :vu='vim +PluginUpdate +qa'
alias :bu='brew update && brew upgrade --all'
alias :zu='upgrade_oh_my_zsh'

##DIRECTORY MAPPINGS
hash -d work=~/SnipSnap/
hash -d gh=~/GithubCode/

## FUNCTIONS ##
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} is using ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}
