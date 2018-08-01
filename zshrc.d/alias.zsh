#config zsh
alias zshconfig="vim ~/.zshrc"

#burp suite
alias burp="nohup java -jar ~/bin/burpsuite &"

#chrome
alias okta="google-chrome --new-window smartsheet.okta.com"
alias bugcrowd="google-chrome --new-window tracker.bugcrowd.com"
alias appdot="google-chrome --new-window app.smartsheet.com"
alias github.hq="google-chrome --new-window github.hq.smartsheet.com"
alias incog="google-chrome --incognito"

#password
alias configure-me="sudo puppet apply /home/ngibb/git/workstation-config/puppet-code/configure_me.pp -t"

#vpn
alias vpn="sudo openconnect --authgroup SMARTSHEET-ALL https://oasis.smartsheet.com -u $USER"

#intellij
alias intJ="nohup ~/intj/bin/idea.sh"

#?
alias ump="nohup ~/bin/upm-1.14/upm.sh"

#curls
alias kcurl='curl --negociate -u :'
alias iecurl='curl -s -i -H '\''X-PNRG-CCSEED: HtAIT9cf51lF6Ka4D+kETBjcENDq1vXYlL3KE8P6DR8='\'' -A '\''Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/4.0; InfoPath.2; SV1; .NET CLR 2.0.50727; WOW64)'\'''
