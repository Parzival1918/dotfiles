# Add things to PATH
# MACBOOK AIR
#set PATH $PATH /Users/parzival1918/.local/bin # pipx bin
#set PATH $PATH /Users/parzival1918/.detaspace/bin # detaspace bin
#set PATH $PATH /opt/homebrew/bin /opt/homebrew/sbin # homebrew bins
# from zsh $PATH
#set PATH $PATH /Users/parzival1918/.reflex/.nvm/versions/node/v18.17.0/bin /Users/parzival1918/.bun/bin /System/Cryptexes/App/usr/bin /Users/parzival1918/bin /Library/TeX/texbin /Library/Apple/usr/bin /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin /var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin /Users/parzival1918/.cargo/bin /Users/parzival1918/.local/bin /Users/parzival1918/Library/Python/3.11/bin /Users/parzival1918/.local/bin
# NIPOGI DESKTOP
set PATH $PATH /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin /home/unstraycato/programs/ovito-basic-3.9.4-x86_64/bin /home/unstraycato/programs/julia-1.9.4/bin /home/unstraycato/programs/travis-src-220729/exe /home/unstraycato/.config/emacs/bin /home/unstraycato/.cargo/bin /home/unstraycato/.local/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games /snap/bin /snap/bin 

# set the prompt, using the preset plain-text-symbols 
starship init fish | source

# hledger main journal location
set -x LEDGER_FILE $HOME/finance/hledger/main.journal

set -x EDIT hx
set -x EDITOR hx
set -x VISUAL hx

# zellij
#if set -q ZELLIJ
#else
#  zellij
#end

#keychain --agents ssh --eval id_ed25519 -q --noask | source
keychain --eval id_ed25519 --noask -q | source
