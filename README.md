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
