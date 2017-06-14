mkdir -p /tmp/legomake
cp -af ~/.p4* /tmp/legomake
alias 14u32='docker run --privileged -it \
	-e USERID=$(id -u) \
	-e USERNAME=$(id -un) \
	-e HOME=${HOME} \
	-h $(hostname) \
	-u $(id -u) \
	-v /tmp/legomake:${HOME}/ \
	-v $PWD/..:$(echo $PWD/..) \
	--env-file ~/.p4config \
	-w $PWD w1ball/lego_build_env'
alias legomake='14u32 make'
