alias ..='cd ..';
alias ...='cd ../..';
alias wtf='exit';
alias top='htop';
alias his='history | grep';
alias gmv='git mv';
alias ga.='git add .';
alias gaa='git add . --all';
alias gst='git status';
alias gdo='git diff origin/master';
alias gcs='git commit -S -m';
alias gch='git commit -S -m `hostname`';
alias gfm='git fetch && git merge origin/master';
alias gts='git tag -s';
alias gpt='git push --tags';
alias SKS='tail -f /var/lib/sks/db.log /var/lib/sks/recon.log /var/log/nginx/access.log';
alias mem='egrep --color "Mem|Cache|Swap" /proc/meminfo';
alias net='sudo netstat -anp | egrep --color';
alias TOP='speedometer -r eth0 -t eth0';
alias hey='cat /etc/hosts | grep localhome && sudo sed -i "s/.*\( localhome\)/`echo $SSH_CLIENT | cut -d \  -f 1`\1/g" /etc/hosts && cat /etc/hosts | egrep --color localhome';
