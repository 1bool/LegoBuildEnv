PRE-INSTALL
====

Make sure you have previously run `p4v` and have downloaded some code, so that you have `.p4*` files in your `$HOME` directory

Install Docker
----
```bash
sudo apt-get install docker.io
sudo usermod -aG docker $USER
```
Logout and login to get `usermod` take effect

INSTALL
====

Get the docker image
----

```bash
docker pull w1ball/lego_build_env
```
Make the legomake aliases
----

Copy and paste following code to terminal

```bash
cat <<- 'EOF' >> ~/.bash_aliases
export P4CONFIG=~/.p4config
LEGOTMP=/tmp/legomake
WS=$(p4 info | fgrep 'Client root' | cut -d: -f2 | cut -d' ' -f2)
mkdir -p ${LEGOTMP}
cp -af ~/.p4* ${LEGOTMP}
alias 14u32='docker run --privileged -it --dns=172.22.60.101 \
	-e P4CONFIG=~/.p4config \
	-e USERID=$(id -u) \
	-e USERNAME=$(id -un) \
	-e HOME=${HOME} \
	-h $(hostname) \
	-v ${LEGOTMP}:${HOME}/ \
	-v ${WS}:${WS} \
	-v ${HOME}/.netrc:${HOME}/.netrc \
	-v /opt/buildroot-gcc463_NTPL/:/opt/buildroot-gcc463_NTPL/ \
	-v /opt/toolchains/:/opt/toolchains/ \
	-v /projects/:/projects/ \
	--env-file ~/.p4config \
	-w $PWD \
	w1ball/lego_build_env'
alias legomake='14u32 make'
EOF
```
Logout and login to have the `.bash_aliases` take effect

USAGE
====

Just replace original make command with legomake

```bash
cd ${PROJECT_DIRECTORY}
legomake menuconfig
legomake
legomake clean
etc...
```
