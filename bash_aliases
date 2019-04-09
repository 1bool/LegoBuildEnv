P4HOME=${HOME}/Develop/Belkin
LEGOTMP=/tmp/legomake
mkdir -p ${LEGOTMP}
cp -af ~/.p4* ${LEGOTMP}
if [ -d ${P4HOME}/dl ]; then
alias 14u32='docker run --privileged -it -e USERID=$(id -u) -e USERNAME=$(id -un) -e HOME=${HOME} -e P4CONFIG=.p4config -h $(hostname) -v ${LEGOTMP}:${HOME}/ -v ${P4HOME}:$(echo ${P4HOME}) --env-file ~/.p4config -w $PWD w1ball/lego_build_env'
else
alias 14u32='docker run --privileged -it -e USERID=$(id -u) -e USERNAME=$(id -un) -e HOME=${HOME} -e P4CONFIG=.p4config -h $(hostname) -v ${LEGOTMP}:${HOME}/ -v $PWD/..:$(echo $PWD/..) --env-file ~/.p4config -w $PWD w1ball/lego_build_env'
fi
alias legomake='14u32 make'
