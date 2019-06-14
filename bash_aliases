export P4CONFIG=~/.p4config
LEGOTMP=/tmp/legomake
WS=$(p4 info | fgrep 'Client root' | cut -d: -f2)
mkdir -p ${LEGOTMP}
cp -af ~/.p4* ${LEGOTMP}
alias 14u32='docker run --privileged -it \
	-v ${LEGOTMP}:${HOME}/ \
	-v /etc/resolv.conf:/etc/resolv.conf \
	-v ${WS}:$(echo ${WS}) \
	--env-file ~/.p4config \
	--dns=172.24.8.99 \
	-e USERID=$(id -u) \
	-e USERNAME=$(id -un) \
	-e HOME=${HOME} \
	-e P4CONFIG=~/.p4config \
	-h $(hostname) \
	-w $PWD w1ball/lego_build_env'
alias legomake='14u32 make'
