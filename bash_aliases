export P4CONFIG=~/.p4config
LEGOTMP=/tmp/legomake
WS=$(p4 info | fgrep 'Client root' | cut -d: -f2)
mkdir -p ${LEGOTMP}
cp -f ~/.p4{config,enviro,tickets} ${LEGOTMP}
alias 14u32='docker run --privileged -it --dns=172.24.8.99 -e USERID=$(id -u) -e USERNAME=$(id -un) -e HOME=${HOME} -e P4CONFIG=~/.p4config -h $(hostname) -v ${LEGOTMP}:${HOME}/ -v ${WS}:$(echo ${WS}) --env-file ~/.p4config -w $PWD w1ball/lego_build_env'
alias legomake='14u32 make'
