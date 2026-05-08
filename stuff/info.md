# INFO

## SANDBOX

```bash
 ___    _    _  _  ___   ___   ___ __  __
/ __|  /_\  | \| ||   \ | _ ) / _ \\ \/ /
\__ \ / _ \ | .` || |) || _ \| (_) |>  <
|___//_/ \_\|_|\_||___/ |___/ \___//_/\_\
```


---

## General

### AWS

#### Fix corrupted sudoers file: [link](http://asymmetrical-view.com/2012/11/07/fixing-sudoers-on-aws-ec2.html)

### Windows ==

**Change Wallpaper:** <https://www.windows-commandline.com/change-windows-wallpaper-command-line>

```dos
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d C:\Users\gs17091\OneDrive\Documents\Fotos\Guenther\Wallpapers\winter.bmp /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
gpedit.msc
```

---

### Mac

#### List DNS

```bash
cat /etc/resolv.conf

# -or-

scutil --dns
```
b3ck0nh0st1ng!
---

### Linux

#### Find folders and delete them

```bash
sudo find . -name Yes... ".svn" -type d -exec rm -rf "{}" \;
```

#### Banners: [link](http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20)

#### Print Date in "2019-04-02 12:49:39,574" format

```bash
$(date +"%Y-%m-%d %H:%M:%S,%N")
```

#### Users

Add user to group:

```bash
usermod -a -G examplegroup exampleusername
```

#### Diff

```bash
diff -r -y --suppress-common-lines dir1 dir2
```

#### SED Piping

```bash
# Remove @xxx from network interface names
ip addr | sed -r 's/(.*)(@.*)(:.*)/\1\3/'
```

#### SED remove line breaks

```bash
sed -r ':a;N;$!ba;s/\n/ /g'
```

#### SED filter a number and count with AWK

Example:

```bash
2018-12-30 08:20:13       1212 beckon-com/docs/674459271/711994973
2018-12-30 08:20:13       9656 beckon-com/docs/674459271/711994975
2018-12-30 08:20:16       1132 beckon-com/docs/674459271/711994989
2018-12-30 08:20:18       1000 beckon-com/docs/674459271/711994995
```

Command:

```bash
cat test.txt | sed -E 's/^.* {1,}([0-9]+) .*$/\1/g' | awk '{s+=$1} END {print s}'
```

#### Rename Network Interface: [Link](https://unix.stackexchange.com/questions/205010/centos-7-rename-network-interface-without-rebooting/219277)

```bash
/sbin/ip link set eth1 down
/sbin/ip link set eth1 name eth123
/sbin/ip link set eth123 up
```

#### TAR

```bash
# compress
tar -cvpf ../file.tar .

# decompress
tar --same-owner -xvf ../file.tar

```

#### Space

```bash
df -h
```

#### Space of current directory

```bash
du -h -s .
```

#### Space of each directory in the current one

```bash
du -h -s *
```

#### Download file from FTP via 'wget'

```bash
wget --user=NAME --password=PASSWORD ftp://url/path/file.name

# wget -c "$MELISSA_GEO_URL" -O /tmp/GeoCOM.zip && \
```

#### Linux Version

```bash
lsb_release -a

# or

uname -mrs
```

#### Ports being listened

sudo netstat -tulpn | grep LISTEN

#### SSH from external

- change password: > passwd "user"
- enable login - add to AllowUsers or AllowGroups in: > vim /etc/ssh/sshd_config
- apply: > sudo service sshd restart

#### SSH from external without password

Reference: <http://www.linuxproblem.org/art_9.html>

> First log in on A as user a and generate a pair of authentication keys. Do not enter a passphrase:

```bash
a@A:~> ssh-keygen -t rsa
a@A:~> ssh b@B mkdir -p .ssh
a@A:~> cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'
a@A:~> ssh
```

> If it doesn't work
> Put the public key in .ssh/authorized_keys2
> Change the permissions of .ssh to 700
> Change the permissions of .ssh/authorized_keys2 to 640

#### Locale

> Run dpkg-reconfigure locales as root - login and logout after that

#### Glyphs (special chars)

> You need a Powerline patched font to make the glyphs work:

[Link](https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts)

#### ZSH Codes

[Link](http://www.nparikh.org/unix/prompt.php)

#### Execute the return of command

```bash
> <command> | source /dev/stdin
```

#### Script to create alias

```bash
#!/bin/bash
aliasName=$1
aliasCmd=$2
setAliasCmd="alias ${aliasName}='${aliasCmd}'"

sedCmd="$ a\\${setAliasCmd}"

sed -i "${sedCmd}" ~/.bash_aliases

echo $setAliasCmd
#sed -i '$ a\this is line 2 without redirection' test
```

#### Vim colors: [Link](https://unix.stackexchange.com/questions/88879/better-colors-so-comments-arent-dark-blue-in-vim)

#### Git Prompt: [link](https://github.com/olemb/git-prompt)

Beckon:

```bash
PS1='\[\033[1;30m\]\T ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\[\033[1;31m\]\h \[\033[01;34m\]\w\[\033[00m\] $(git-prompt) \n> '
```

Original:

```bash
Original: PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u \[\033[01;34m\]\w\[\033[00m\] $(git-prompt) \n> '
```

##### Aliases

```bash
alias ws='cd /mnt/c/@workspaces/'
alias omz='cd ~/.oh-my-zsh/'
alias rob='vim ~/.oh-my-zsh/themes/robbyrussell.zsh-theme'
alias opt='cd /opt/'
alias bashrc='sudo vim ~/.bashrc'
alias aliases='sudo vim ~/.bash_aliases'
alias apply='source /dev/stdin'
alias zshrc='sudo vim ~/.zshrc'
```



### GIT

#### Commit without password

sudo git config --global credential.helper '!echo password=Er123123123!; echo'
sudo git config --global credential.username gs17091

#### Commit problems between Windows e Linux**

```bash
> git config --global core.filemode false
```

#### Merging vs. Rebasing: [Link](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)

#### CR to LF before commit: [Link](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)

```bash
> git config --global core.autocrlf input
> git config --global core.safecrlf false
```

#### Cert Persmission issue

```bash
> chmod 600 ~/.ssh/config
```

#### Local Postgres

```bash
docker run -it --rm --link postgres:postgres postgres psql -h postgres -U postgres
```