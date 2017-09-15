LEGOTMP=/tmp/legomake
mkdir -p ${LEGOTMP}
cp -af ~/.p4* ${LEGOTMP}
alias 14u32='docker run --privileged -it \
	-e USERID=$(id -u) \
	-e USERNAME=$(id -un) \
	-e HOME=${HOME} \
	-e P4CONFIG=.p4config \
	-h $(hostname) \
	-v ${LEGOTMP}:${HOME}/ \
	-v $PWD/..:$(echo $PWD/..) \
	--env-file ~/.p4config \
	-w $PWD w1ball/lego_build_env'
alias legomake='14u32 make'
