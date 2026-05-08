# INFO

- [INFO](#info)
  - [SANDBOX](#sandbox)
    - [Check](#check)
    - [DRAFT](#draft)
  - [Docker](#docker)
    - [ARG / ENV / .env](#arg--env--env)
    - [Python 3.6.1](#python-361)
    - [Check Whitelist: Link](#check-whitelist-link)
    - [Docker Best Practices](#docker-best-practices)
    - [Docker Compose patterns](#docker-compose-patterns)
    - [Kubernetes](#kubernetes)
      - [Get Pod Name](#get-pod-name)
  - [Credentials](#credentials)
    - [FTP](#ftp)
  - [General](#general)
    - [Python](#python)
      - [Virtual environment](#virtual-environment)
    - [AWS](#aws)
      - [Fix corrupted sudoers file: link](#fix-corrupted-sudoers-file-link)
      - [Use AWS CLI from Lambda: link](#use-aws-cli-from-lambda-link)
    - [Windows ==](#windows-)
    - [Mac](#mac)
      - [Expose Docker on port 2375: link](#expose-docker-on-port-2375-link)
      - [List DNS](#list-dns)
  - [b3ck0nh0st1ng!](#b3ck0nh0st1ng)
    - [Linux](#linux)
      - [Find folders and delete them](#find-folders-and-delete-them)
      - [Banners: link](#banners-link)
      - [Print Date in "2019-04-02 12:49:39,574" format](#print-date-in-2019-04-02-124939574-format)
      - [Users](#users)
      - [Diff](#diff)
      - [SED Piping](#sed-piping)
      - [SED remove line breaks](#sed-remove-line-breaks)
      - [SED filter a number and count with AWK](#sed-filter-a-number-and-count-with-awk)
      - [Rename Network Interface: Link](#rename-network-interface-link)
      - [TAR](#tar)
      - [Space](#space)
      - [Space of current directory](#space-of-current-directory)
      - [Space of each directory in the current one](#space-of-each-directory-in-the-current-one)
      - [Download file from FTP via 'wget'](#download-file-from-ftp-via-wget)
      - [Linux Version](#linux-version)
      - [Ports being listened](#ports-being-listened)
      - [SSH from external](#ssh-from-external)
      - [SSH from external without password](#ssh-from-external-without-password)
      - [Locale](#locale)
      - [Glyphs (special chars)](#glyphs-special-chars)
      - [ZSH Codes](#zsh-codes)
      - [Execute the return of command](#execute-the-return-of-command)
      - [Script to create alias](#script-to-create-alias)
      - [Vim colors: Link](#vim-colors-link)
      - [Git Prompt: link](#git-prompt-link)
        - [Aliases](#aliases)
    - [Google API](#google-api)
    - [GIT](#git)
      - [Commit without password](#commit-without-password)
      - [Commit problems between Windows e Linux**](#commit-problems-between-windows-e-linux)
      - [Merging vs. Rebasing: Link](#merging-vs-rebasing-link)
      - [CR to LF before commit: Link](#cr-to-lf-before-commit-link)
      - [Cert Persmission issue](#cert-persmission-issue)
    - [Jenkins - General](#jenkins---general)
      - [Install Docker in Debian Container: Convenient Script](#install-docker-in-debian-container-convenient-script)
    - [Confluence](#confluence)
    - [Machines](#machines)
      - [SEP0260PA.SEPDSV.LOCAL](#sep0260pasepdsvlocal)
    - [General Stuff](#general-stuff)
    - [ATOM](#atom)
    - [Jenkins - SEP](#jenkins---sep)
      - [Dockerfile](#dockerfile)
      - [Original proxy](#original-proxy)
      - [Groups](#groups)
      - [Pipeline](#pipeline)
    - [SonarQube](#sonarqube)
      - [SonarScanner](#sonarscanner)
      - [Local Postgres](#local-postgres)
    - [NGINX](#nginx)
  - [Development](#development)
    - [Java](#java)
      - [Swagger Plugin for Documentation](#swagger-plugin-for-documentation)

## SANDBOX

```bash
 ___    _    _  _  ___   ___   ___ __  __
/ __|  /_\  | \| ||   \ | _ ) / _ \\ \/ /
\__ \ / _ \ | .` || |) || _ \| (_) |>  <
|___//_/ \_\|_|\_||___/ |___/ \___//_/\_\
```

https://forums.aws.amazon.com/thread.jspa?threadID=134543


$ date
Wed Sep 10 10:32:08 UTC 2014

$ sudo service ntp stop
 * Stopping NTP server ntpd 

$ sudo ntpdate ntp.ubuntu.com
10 Sep 10:27:56 ntpdate[22317]: step time server 91.189.94.4 offset -308.592767 sec

$ sudo service ntp start
 * Starting NTP server ntpd

$ date
Wed Sep 10 10:28:19 UTC 2014


-----------

https://serverfault.com/questions/842615/automatically-mount-bucket-with-s3fs-on-boot

/etc/fstab
s3fs#my-bucket-name /mnt/s3_bucket fuse _netdev,allow_other,umask=227,uid=33,gid=33,use_cache=/root/cache 0 0

------------

s3fs#beckon-logs:/production/prod-connector /mnt/beckon-logs-prod-connector fuse _netdev,allow_other,iam_role=auto,uid=appunni 0 0

---

### Check

**TestInfra**: <https://goo.gl/8ebWbA>

### DRAFT

---

## Docker

### ARG / ENV / .env

[**ARG vs ENV**](https://vsupalov.com/docker-arg-vs-env/)

[**Docker ARG, ENV and .env - a Complete Guide**](https://vsupalov.com/docker-arg-env-variable-guide/)

### Python 3.6.1

[Link](http://ubuntuhandbook.org/index.php/2017/07/install-python-3-6-1-in-ubuntu-16-04-lts/)

[Link](https://gist.github.com/tiagocardosos/5f0d2a5edaccb2f719baacf134cd790e)

### Check Whitelist: [Link](http://dlb1.aureacentral.com:12504/config)

### Docker Best Practices

- Dockerfile
  - Slow steps as early as possible
  - Win2016SQL (Iron) (requested by sunil for testing)
  - FS1
  - IPMON
  - Use .dockerignore to decrease context size
  - Prefer COPY over ADD

### Docker Compose patterns

- Create on docker-compose.yml for each Dockerfile

### Kubernetes

#### Get Pod Name

```bash
kubectl exec -it $(kubectl get pods | grep application-info | awk '{ print $1 }') /bin/sh
```

## Credentials

- docker-compose
- Dockerfile
- Jenkinsfile
- .env file
- assets
- components
- artifacts

### FTP

```bash
ftp://gbuild.gdev.com/peerapp
username: gbuildftp
password: EALhMiuJ8Ry
```

---

## General

### Python

#### Virtual environment

```bash
python3 -m venv env
source ./env/bin/activate
pip install -r requirements.txt
```


### AWS

#### Fix corrupted sudoers file: [link](http://asymmetrical-view.com/2012/11/07/fixing-sudoers-on-aws-ec2.html)

#### Use AWS CLI from Lambda: [link](https://bezdelev.com/hacking/aws-cli-inside-lambda-layer-aws-s3-sync/)

### Windows ==

**Change Wallpaper:** <https://www.windows-commandline.com/change-windows-wallpaper-command-line>

```dos
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d C:\Users\gs17091\OneDrive\Documents\Fotos\Guenther\Wallpapers\winter.bmp /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
gpedit.msc
```

---

### Mac

#### Expose Docker on port 2375: [link](https://github.com/docker/for-mac/issues/770)

```bash
docker run -d -v /var/run/docker.sock:/var/run/docker.sock -p 127.0.0.1:2375:2375 bobrik/socat TCP-LISTEN:2375,fork UNIX-CONNECT:/var/run/docker.sock

export DOCKER_HOST=tcp://localhost:2375
```

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

### Google API

```JavaScript

function onOpen(e) {
  UpdateJiraQuery();
}

function UpdateJiraQuery() {
  
  var spreadsheet = SpreadsheetApp.getActive();
  
  spreadsheet.setActiveSheet(spreadsheet.getSheetByName('Jira - QUERIES'), true);
  spreadsheet.getRange('1:1').activate();
  spreadsheet.getActiveSheet().insertRowsBefore(spreadsheet.getActiveRange().getRow(), 1);
  spreadsheet.getActiveRange().offset(0, 0, 1, spreadsheet.getActiveRange().getNumColumns()).activate();
  spreadsheet.getActiveSheet().deleteRows(spreadsheet.getActiveRange().getRow(), spreadsheet.getActiveRange().getNumRows());
  Utilities.sleep(25 * 1000)
  
  spreadsheet.setActiveSheet(spreadsheet.getSheetByName('Jira - QUERIES'), true);
  if (spreadsheet.getRange('A9').getValue().indexOf(spreadsheet.getRange('B3').getValue()) == 0) {
    spreadsheet.setActiveSheet(spreadsheet.getSheetByName('Jira - Tickets'), true);
    spreadsheet.getRange('A2').activate();
    spreadsheet.getRange('\'Jira - QUERIES\'!A9:E1000').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_VALUES, false);
  }
}


function UpdateTest() {
  var spreadsheet = SpreadsheetApp.getActive();
  
  spreadsheet.setActiveSheet(spreadsheet.getSheetByName('Jira - QUERIES'), true);
  
  var expectedNumberOfRecords = spreadsheet.getRange('B5').getValue();
  if (!isNaN(expectedNumberOfRecords)) {
    // The maximum number of records returned by Jira thru Google API is 100, so we need to
    // have as much queries as necessary
    var numberOfNecessaryQueries = Math.ceil(x / 100);
    var queryString = '';
    for (var i = 0; i < numberOfNecessaryQueries * 100; i += 100) {
      if (queryString != '') {
        queryString += ';';
      }
      queryString += 'JST_search($B$4, "key,summary,duedate,assignee,status", 100, ' + i + ');';
    }
    queryString = '={' + queryString + '}';
    spreadsheet.getRange('F9').setValue(queryString);
  }
}

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

### Jenkins - General

#### Install Docker in Debian Container: [Convenient Script](https://docs.docker.com/install/linux/docker-ce/debian/#install-using-the-convenience-script)

### Confluence

**Color**:

```CSS
style="color: rgb(33, 113, 174);font-size: 20.0px;"
````

---

## SEP

### Jenkins

jenkins - token - Rr4UXyxWyTQzznZ11xj9

- Jigit
  - <http://git.saqueepague.local/>
  - sep2/testes
  - master

### Docker Stuff

SEP Docker Host: 10.171.192.15
user: jq00087
password: bolota3006

============

JENKINS / MONGO: docker run -d --link mongo-test:mongo-test --link sonarqube:sonarqube --name jenkins -p 80:8080 --restart=always -p 50000:50000 -v /data/jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock sep/jenkins

REGISTRY:      docker run -d -p 5000:5000 --restart=always --name docker-registry -v /data/docker-registry:/var/lib/registry registry:2

DOCKER REGISTRY: docker run -d -p 5000:5000 --restart=always --name docker-registry -v /data/docker-registry:/var/lib/registry registry:2.6.2

MONGO TEST: docker run --name mongo-test --restart=always -v /data/mongo-test:/data/db -d mongo:3.4.9-jessie

MONGO: docker run --name mongo --restart=always -v /data/mongo:/data/db -p 27017:27017 -d mongo:3.4.9-jessie

**SonarQube:**

```bash
docker run -d --link postgres:postgres \
    --name sonarqube \
    --restart=always \
    -p 8080:9000 -p 9092:9092 \
    -e SONARQUBE_JDBC_USERNAME=sonar \
    -e SONARQUBE_JDBC_PASSWORD=sonar@sep \
    -e SONARQUBE_JDBC_URL="jdbc:postgresql://postgres:5432/sonar" \
    -v /data/sonarqube/data:/opt/sonarqube/data \
    -v /data/sonarqube/extensions:/opt/sonarqube/extensions \
    sonarqube
```

POSTGRES: docker run --name postgres -v /data/postgres:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres@sep -d --restart=always postgres

CHANNEL-MANAGER:

```bash
docker run --name channel-manager --link mongo:mongo -p 3001:3000 -d -e MONGODB_URI=mongodb://sep0260pa.sepdsv.local:27017/ChannelManager -e PORT=3000 -e NODE_ENV=di -e JWT_SECRET=abc123 -e AUTH_HOST=http://localhost:9020 docker-registry.saqueepague.local:5000/sep/channel-manager
```

### Machines

#### SEP0260PA.SEPDSV.LOCAL

Ports

- 80 - Jenkins
- 2375 – Docker Daemon
- 8080 – SonarQube
- 3001 – Channel Manager 1
- 3002 – Channel Manager 2
- 3003 – Channel Manager 3
- 3004 – Channel Manager 4
- 3101 – Channel Manager Web 1
- 3102 – Channel Manager Web 2
- 3501 – ATM Legacy Box 1
- 3502 – ATM Legacy Box 2
- 5000 - Docker Registry
- 50000 – Jenkins
- 27017 – MongoDB – Dev 1
- 27018 – MongoDB – Test

### General Stuff

```bash
== run command >>> docker run busybox:1.24 echo "Hello World"
== interactive and tty >>> docker run -i -t busybox:1.24
== detached >>> docker run -d ===>
== remove image after exit >>> docker run --rm
== name the container >>> docker run --name hello_world busybox:1.24
== inspect >>> docker inspect container_id

== port >>> docker run -it -d -p 8888:8080 tomcat:8.0
== commit >>> docker commit container_id respository_name:tag
== images >>> docker images

== build >>> docker build -t repo/image path // Ex: docker build -t test_repo_0/debian .

== exec >>> docker exec -it cf9fd0626c09 bash
== useradd >>> RUN useradd -ms /bin/bash username
== WORKDIR > is the initial dir folder

sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

### ATOM

```bash
Snippets ES6: /mnt/c/Users/gs17091/.atom/packages

> grep -r -A 1 --include "*.cson" setTimeout .

- Sync
1debd8ed3590b6e2317758d517a27d90c59d37a0
98f651d596234793726a392e8b52ee89
```

---

### Jenkins - SEP

**SEP AD:** svc_jenkins / 10Nz@KvNu*RhC7iPglbn
**Passwd** sep2@2017!
**Token:** eb62abcd1453459eb402cbb6b75771ce
**Token:** _aFy4mmPzBRY7_M1LjyD
**host:** sep0080pa.sepdsv.local

#### Dockerfile

```Dockerfile
FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
#RUN apt-get update && apt-get install -y node@8.5.0 yarn@1.1.0

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g yarn
RUN apt-get install -y maven
RUN curl https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar xvz -C /tmp/ && mv /tmp/docker/docker /usr/bin/docker

# drop back to the regular jenkins user - good practice
USER jenkins
```

#### Original proxy

10.172.80.50:80
jenkins

#### Groups

OU=Users,OU=Ger. Tecnologia,OU=Porto Alegre,OU=Rio Grande do Sul,OU=Brasil,OU=Structure

#### Pipeline

```groovy
node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("getintodevops/hellonode")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
```

```groovy
node("peerapp-director") {

  stage("Checkout SCM") {
    deleteDir()

    dir("ubdirector") {
      git credentialsId: "github-access",
        url: "git@github.com:trilogy-group/versata-peerapp-ubdirector.git"
    }

    dir("latest-35x") {
      git credentialsId: "github-access",
        url: "git@github.com:trilogy-group/versata-peerapp-ubdirector.git"
    }

    dir("ub-ran") {
      git credentialsId: "github-access",
        url: "git@github.com:trilogy-group/versata-peerapp-ub-ran.git"
    }
  }

  stage("Build") {
    sh "ln -s ub-ran/iso iso"
    sh "ubdirector/build-scripts/build.sh"
  }

  stage("Archive Artifacts") {
    def NEXUS_URL = "https://nexus.devfactory.com"
    def REPO = "peerapp-director-release"
    def REPO_PATH = "peerapp-director-4.2.0/${BUILD_NUMBER}"

    def files = [
      ["/mnt/storage/builds/products/jobs/${JOB_NAME}/builds/${BUILD_NUMBER}/archive/", "Installer_PADirector_4.2.0b${BUILD_NUMBER}-RELEASE-PA-CentOS.iso"],
      ["/mnt/storage/builds/products/jobs/${JOB_NAME}/builds/${BUILD_NUMBER}/archive/", "PADirectorCHROOT-4.2.0-${BUILD_NUMBER}.tgz"],
      ["/mnt/storage/builds/products/jobs/${JOB_NAME}/builds/${BUILD_NUMBER}/archive/", "PADirectorFull-4.2.0-${BUILD_NUMBER}.tgz"],
      ["/mnt/storage/builds/products/jobs/${JOB_NAME}/builds/${BUILD_NUMBER}/archive/", "celerity_install-4.2.0-${BUILD_NUMBER}.sh"],
      ["ubdirector/", "Upgrade_PADirector_4.2.0b${BUILD_NUMBER}-RELEASE-PA.run"],
      ["ubdirector/", "Upgrade_PADirector_4.2.0b${BUILD_NUMBER}-RELEASE-PA.sh"]
    ]

    withCredentials([usernamePassword(credentialsId: "service.tc.nexus",
        passwordVariable: "NEXUS_PASSWD", usernameVariable: "NEXUS_USER")]) {

      sh """
        export NEXUS_USER='${NEXUS_USER}'CAf
        export NEXUS_PASSWD='${NEXUS_PASSWD}'
      """

      files.each {
        def filePath = it[0] + it[1]
        def fileName = it[1]

        def cmdCurlMD5 = $/curl -X PUT -v --progress-bar -u $$NEXUS_USER:$$NEXUS_PASSWD --upload-file ${filePath}.md5 ${NEXUS_URL}$/repository$/${REPO}$/${REPO_PATH}$/${fileName}.md5/$
        def cmdCurl = $/curl -X PUT -v --progress-bar -u $$NEXUS_USER:$$NEXUS_PASSWD --upload-file ${filePath} ${NEXUS_URL}$/repository$/${REPO}$/${REPO_PATH}$/${fileName}/$

        echo "${cmdCurlMD5}"
        sh cmdCurlMD5

        echo "${cmdCurl}"
        sh cmdCurl
      }
    }
  }
}

```

### SonarQube

```bash
docker run -d --link jenkins:jenkins --link postgres:postgres \
    --name sonarqube \
  --restart=always \
    -p 8080:9000 -p 9092:9092 \
    -e SONARQUBE_JDBC_USERNAME=sonar \
    -e SONARQUBE_JDBC_PASSWORD=sonar@sep \
    -e SONARQUBE_JDBC_URL="jdbc:postgresql://postgres:5432/sonar" \
    -v /data/sonarqube/data:/opt/sonarqube/data \
    -v /data/sonarqube/extensions:/opt/sonarqube/extensions \
    sonarqube
```

**Jenkins Webhook:** <http://jenkins:8080/sonarqube-webhook>

token-channel-manager: d8151369239bdbc0f08745e39f6c6a4de35b18b9
token-jenkins: ebfa86dd98e0813e3c3daad2e5c9506b4d7fd2b4

#### SonarScanner

```bash
sonar-scanner \
  -Dsonar.projectKey=channel-manager \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://sep0260pa.sepdsv.local:9000 \
  -Dsonar.login=token-channel-manager
```

#### Local Postgres

```bash
docker run -it --rm --link postgres:postgres postgres psql -h postgres -U postgres
```

**POSTGRES:**

- postgres=# grant all privileges on database sonar to sonar;
- postgres=# alter user sonar with password 'sonar@sep';

### NGINX

[Location Chars](http://nginx.org/en/docs/http/ngx_http_core_module.html#location)

[Proxy Socket.io](https://fadeit.dk/blog/2015/05/21/socketio-namespaces-and-nginx/)

## Development

### Java

#### Swagger Plugin for Documentation

- io.github.swagger2markup:swagger2markup-maven-plugin
- io.github.swagger2markup:swagger2markup-gradle-plugin

groupId:artifactId
