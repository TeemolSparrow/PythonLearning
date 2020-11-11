#!env perl
#Author: autoCreated
my $para_num = "1";
my %para;
@array_pre_flag = ();
@array_redhat_flag = ();
@array_debian_flag = ();
@array_suse_flag = ();
@array_ubuntu_flag = ();
@array_centos_flag = ();
@array_other_linux_flag = ();
@array_appendix_flag = ();
@array_circle_flag = ();

$para{Linux_su_password} = $ARGV[1];
$para{Linux_su_user} = $ARGV[2];

$pre_cmd{1} = "if [ -f /etc/pam.d/login ];then
if [[ -n `cat /etc/pam.d/login|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*required.*pam_tally2?\\.so\"|grep -w \"deny\"` ]];then
echo \"result1=\"`cat /etc/pam.d/login|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*required.*pam_tally2?\\.so\"|awk -F\"deny=\" '{print\$2}'|awk '{print\$1}'`
else
echo \"result1=Not configured\"
fi
if [[ -n `cat /etc/pam.d/login|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*include[[:space:]]*(system|common)-auth\"` ]];then
echo \"result2=true\"
else
echo \"result2=false\"
fi
else
echo \"result=The /etc/pam.d/login file not found\"
fi
if [ -f /etc/pam.d/sshd ];then
if [[ -n `cat /etc/pam.d/sshd|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*required.*pam_tally2?\\.so\"|grep -w \"deny\"` ]];then
echo \"result1=\"`cat /etc/pam.d/sshd|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*required.*pam_tally2?\\.so\"|awk -F\"deny=\" '{print\$2}'|awk '{print\$1}'`
else
echo \"result1=Not configured\"
fi
if [[ -n `cat /etc/pam.d/sshd|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*include[[:space:]]*(system|common)-auth\"` ]];then
echo \"result2=true\"
else
echo \"result2=false\"
fi
else
echo \"result=The /etc/pam.d/sshd file not found\"
fi
if [ -f /etc/pam.d/system-auth ];then
if [[ -n `cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*required.*pam_tally2?\\.so\"|grep -w \"deny\"` ]];then
echo \"result3=\"`cat /etc/pam.d/system-auth|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*required.*pam_tally2?\\.so\"|awk -F\"deny=\" '{print\$2}'|awk '{print\$1}'`
else
echo \"result3=Not configured\"
fi
else
echo \"result3=SUSE\"
fi
if [ -f /etc/pam.d/common-auth ];then
if [[ -n `cat /etc/pam.d/common-auth|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*required.*pam_tally2?\\.so\"|grep -w \"deny\"` ]];then
echo \"result4=\"`cat /etc/pam.d/common-auth|grep -v \"^[[:space:]]*#\"|egrep \"auth[[:space:]]*required.*pam_tally2?\\.so\"|awk -F\"deny=\" '{print\$2}'|awk '{print\$1}'`
else
echo \"result4=Not configured\"
fi
else
echo \"result4=Redhat\"
fi
";
push(@array_other_linux_flag, 1);push(@array_redhat_flag, 1);push(@array_debain_flag, 1);push(@array_suse_flag, 1);push(@array_ubuntu_flag, 1);push(@array_centos_flag, 1);$pre_cmd{3} = "cat /etc/profile |grep -v \"^[[:space:]]*#\"|grep -v \"^\$\"|grep \"TMOUT\"
";
push(@array_other_linux_flag, 3);push(@array_redhat_flag, 3);push(@array_debain_flag, 3);push(@array_suse_flag, 3);push(@array_ubuntu_flag, 3);push(@array_centos_flag, 3);$pre_cmd{4} = "if grep -v \"^[[:space:]]*#\" /etc/ssh/sshd_config|grep -i \"PermitRootLogin no\"
then echo \"This device does not permit root to ssh login,check result:true\";
else
echo \"This device permits root to ssh login,check result:false\";
fi
if grep  -v \"^[[:space:]]*#\" /etc/ssh/sshd_config|egrep \"^protocol[[:space:]]*2|^Protocol[[:space:]]*2\"
then echo \"SSH protocol version is 2,check result:true\"
else
echo \"SSH protocol version is not 2,check result:false\"
fi
";
push(@array_other_linux_flag, 4);push(@array_redhat_flag, 4);push(@array_debain_flag, 4);push(@array_suse_flag, 4);push(@array_ubuntu_flag, 4);push(@array_centos_flag, 4);$pre_cmd{5} = "export LANG=en_US.UTF-8
if [[ `cat /etc/redhat-release 2>/dev/null|cut -b 22` -eq 7 ]] || [[ `cat /etc/redhat-release 2>/dev/null|cut -b 41` -eq 7 ]];then
echo \"telnet_status=\"`systemctl|grep telnet|grep active|wc -l`
echo \"ssh_status=\"`ps -ef|grep \"sshd\"|grep -v \"grep\"|wc -l`
else
echo \"telnet_status=\"`chkconfig --list |egrep \"*.telnet\"|egrep -i \"on\"|wc -l`
echo \"ssh_status=\"`ps -ef|grep \"sshd\"|grep -v \"grep\"|wc -l`
fi
unset telnet_status ssh_status
";
push(@array_other_linux_flag, 5);push(@array_redhat_flag, 5);push(@array_debain_flag, 5);push(@array_suse_flag, 5);push(@array_ubuntu_flag, 5);push(@array_centos_flag, 5);$pre_cmd{7} = "awk '{print \$1\":\"\$2}' /etc/profile|grep -v \"^[[:space:]]*#\"|grep -i umask|tail -n1
";
push(@array_other_linux_flag, 7);push(@array_redhat_flag, 7);push(@array_debain_flag, 7);push(@array_suse_flag, 7);push(@array_ubuntu_flag, 7);push(@array_centos_flag, 7);$pre_cmd{8} = "ls -alL /etc/passwd /etc/shadow /etc/group
echo \"passwd_total=\"`ls -alL /etc/passwd 2>/dev/null|grep -v  \"[r-][w-]-[r-]--[r-]--\"|grep \"[r-][w-][x-][r-][w-][x-][r-][w-][x-]\"|wc -l`
echo \"shadow_total=\"`ls -alL /etc/shadow 2>/dev/null|grep -v  \"[r-][w-]-------\"|grep \"[r-][w-][x-][r-][w-][x-][r-][w-][x-]\"|wc -l`
echo \"group_total=\"`ls -alL /etc/group 2>/dev/null|grep -v  \"[r-][w-]-[r-]--[r-]--\"|grep \"[r-][w-][x-][r-][w-][x-][r-][w-][x-]\"|wc -l`
";
push(@array_other_linux_flag, 8);push(@array_redhat_flag, 8);push(@array_debain_flag, 8);push(@array_suse_flag, 8);push(@array_ubuntu_flag, 8);push(@array_centos_flag, 8);$pre_cmd{9} = "cat /etc/login.defs |grep -v \"^[[:space:]]*#\"|grep -E '^\\s*PASS_MAX_DAYS|^\\s*PASS_MIN_DAYS|^\\s*PASS_WARN_AGE'
";
push(@array_other_linux_flag, 9);push(@array_redhat_flag, 9);push(@array_debain_flag, 9);push(@array_suse_flag, 9);push(@array_ubuntu_flag, 9);push(@array_centos_flag, 9);$pre_cmd{10} = "awk -F: '(\$3 == 0) { print \$1 }' /etc/passwd
echo \"result=\"`awk -F: '(\$3 == 0) { print \$1 }' /etc/passwd | grep -v \"^[[:space:]]*#\" |grep -v root|wc -l`
";
push(@array_other_linux_flag, 10);push(@array_redhat_flag, 10);push(@array_debain_flag, 10);push(@array_suse_flag, 10);push(@array_ubuntu_flag, 10);push(@array_centos_flag, 10);$pre_cmd{11} = "Calculate (){
echo \"result1=\"`cat \$1|egrep -v \"[[:space:]]*#\"|awk 'BEGIN{RS=\" \"}{print \$0}'|awk -F\"=\" '/dcredit/{print\$2}'|awk '{print\$1}'|awk -F\"-\" '{print\$2}'`
echo \"result2=\"`cat \$1|egrep -v \"[[:space:]]*#\"|awk 'BEGIN{RS=\" \"}{print \$0}'|awk -F\"=\" '/lcredit/{print\$2}'|awk '{print\$1}'|awk -F\"-\" '{print\$2}'`
echo \"result3=\"`cat \$1|egrep -v \"[[:space:]]*#\"|awk 'BEGIN{RS=\" \"}{print \$0}'|awk -F\"=\" '/ucredit/{print\$2}'|awk '{print\$1}'|awk -F\"-\" '{print\$2}'`
echo \"result4=\"`cat \$1|egrep -v \"[[:space:]]*#\"|awk 'BEGIN{RS=\" \"}{print \$0}'|awk -F\"=\" '/ocredit/{print\$2}'|awk '{print\$1}'|awk -F\"-\" '{print\$2}'`
echo \"result5=\"`cat \$1|egrep -v \"[[:space:]]*#\"|awk 'BEGIN{RS=\" \"}{print \$0}'|awk -F\"=\" '/minlen/{print\$2}'|awk '{print\$1}'`
}
if ([ -f /etc/redhat-release ] && [ -f /etc/pam.d/system-auth ]);then
if [[ `cat /etc/redhat-release|grep -aPo '(?<=release\\s)\\d'` -ge \"7\" ]];then
if [[ -n `cat /etc/pam.d/passwd|egrep -v \"[[:space:]]*#\"|egrep \"password[[:space:]]+required[[:space:]]+pam_pwquality.so\"` ]];then
echo \"result0=Found pam_pwquality.so module\"
FILE=/etc/security/pwquality.conf;
Calculate \"\$FILE\";
unset FILE
else
echo \"result0=Missing pam_pwquality.so module\"
fi
else
FILE=/etc/pam.d/system-auth;
Calculate \"\$FILE\";
unset FILE
fi
elif ([ -f /etc/SuSE-release ] && [ -f /etc/pam.d/common-password ]);then
FILE=/etc/pam.d/common-password
Calculate \"\$FILE\";
unset FILE
fi
";
push(@array_other_linux_flag, 11);push(@array_redhat_flag, 11);push(@array_debain_flag, 11);push(@array_suse_flag, 11);push(@array_ubuntu_flag, 11);push(@array_centos_flag, 11);$pre_cmd{12} = "echo \$PATH
echo \"result=`echo \$PATH|egrep \"^\\.\\:|^\\.\\.\\:|\\:\\.\$|\\:\\.\\.\$|\\:\\.\\:|\\:\\.\\.\\:\"|wc -l`\"
";
push(@array_other_linux_flag, 12);push(@array_redhat_flag, 12);push(@array_debain_flag, 12);push(@array_suse_flag, 12);push(@array_ubuntu_flag, 12);push(@array_centos_flag, 12);$pre_cmd{16} = "export LANG=en_US.UTF-8
if [[ `cat /etc/redhat-release 2>/dev/null|cut -b 22` -eq 7 ]] || [[ `cat /etc/redhat-release 2>/dev/null|cut -b 41` -eq 7 ]];then
telnet_status=`systemctl|grep \"telnet.socket\"|wc -l`
else
telnet_status=`chkconfig --list|egrep \"telnet.*\"|grep -w \"on\"|wc -l`
fi
if [ \$telnet_status -ge 1 ];then
echo \"pts_count=\"`cat /etc/securetty|grep -v \"^[[:space:]]*#\"|grep \"pts/*\"|wc -l`
else
echo \"Telnet process is not open\"
fi
unset telnet_status
";
push(@array_other_linux_flag, 16);push(@array_redhat_flag, 16);push(@array_debain_flag, 16);push(@array_suse_flag, 16);push(@array_ubuntu_flag, 16);push(@array_centos_flag, 16);$pre_cmd{17} = "cat /etc/profile|grep -v \"^[[:space:]]*#\"|grep \"ulimit[[:space:]]*-S[[:space:]]*-c[[:space:]]*0[[:space:]]*>[[:space:]]*/dev/null[[:space:]]*2>&1\"
cat /etc/security/limits.conf|grep -v \"[[:space:]]*#\"
";
push(@array_other_linux_flag, 17);push(@array_redhat_flag, 17);push(@array_debain_flag, 17);push(@array_suse_flag, 17);push(@array_ubuntu_flag, 17);push(@array_centos_flag, 17);$pre_cmd{18} = "if [ -f /etc/syslog.conf ];
then
cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';
fi;
if [ -s /etc/syslog-ng/syslog-ng.conf ];
then
ret_1=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"port(514)\"|awk '{print \$2}'`;
if [ -n \"\$ret_1\" ];
then
ret_2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(\$ret_1)\"`;
if [ -n \"\$ret_2\" ];
then
echo \"Set the log server:true\";
else
echo \"not Set the log server:false\";
fi;
fi;
fi;
if [ -f /etc/rsyslog.conf ];
then cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep -E '[[:space:]]*.+@.+';
fi
";
push(@array_other_linux_flag, 18);push(@array_redhat_flag, 18);push(@array_debain_flag, 18);push(@array_suse_flag, 18);push(@array_ubuntu_flag, 18);push(@array_centos_flag, 18);$pre_cmd{19} = "if [[ -n `ps -ef|grep \"sshd\"|grep -v grep` ]];then
echo \"result=SSH is running\"
if [ -f /etc/motd ];then
if [ -s /etc/motd ];then
echo \"result=banner is not null\"
else
echo \"result=banner is null\"
fi
else
echo \"result=The /etc/motd file not found\"
fi
else
echo \"result=SSH not running\"
fi
";
push(@array_other_linux_flag, 19);push(@array_redhat_flag, 19);push(@array_debain_flag, 19);push(@array_suse_flag, 19);push(@array_ubuntu_flag, 19);push(@array_centos_flag, 19);$pre_cmd{20} = "cat /etc/shadow|sed '/^\\s*#/d'|awk -F: '(\$2!~/^*/) && (\$2!~/^!!/) {print \$1\":\"}'|egrep \"^lp:|^sync:|^halt:|^news:|^uucp:|^operator:|^games:|^gopher:|^smmsp:|^nfsnobody:|^nobody:\"
egrep \"^lp:|^sync:|^halt:|^news:|^uucp:|^operator:|^games:|^gopher:|^smmsp:|^nfsnobody:|^nobody:\" /etc/passwd|awk -F: '(\$7!~/bin\\/false/) {print \$1\":\"\$7}'
echo \"result_pw=\"`cat /etc/shadow|sed '/^\\s*#/d'|awk -F: '(\$2!~/^*/) && (\$2!~/^!!/) {print \$1}'|egrep \"^lp:|^sync:|^halt:|^news:|^uucp:|^operator:|^games:|^gopher:|^smmsp:|^nfsnobody:|^nobody:\"|wc -l`
echo \"result_shell=\"`egrep \"^lp:|^sync:|^halt:|^news:|^uucp:|^operator:|^games:|^gopher:|^smmsp:|^nfsnobody:|^nobody:\" /etc/passwd|awk -F: '(\$7!~/bin\\/false/) {print \$1\":\"\$7}'|wc -l`
";
push(@array_other_linux_flag, 20);push(@array_redhat_flag, 20);push(@array_debain_flag, 20);push(@array_suse_flag, 20);push(@array_ubuntu_flag, 20);push(@array_centos_flag, 20);$pre_cmd{21} = "ls -lL /etc/passwd 2>/dev/null
echo \"passwd=\"`ls -lL /etc/passwd 2>/dev/null|grep -v \"[r-][w-]-[r-]--[r-]--\"|wc -l`
ls -lL /etc/group 2>/dev/null
echo \"group=\"`ls -lL /etc/group 2>/dev/null|grep -v \"[r-][w-]-[r-]--[r-]--\"|wc -l`
ls -lL /etc/services 2>/dev/null
echo \"services=\"`ls -lL /etc/services 2>/dev/null|grep -v \"[r-][w-]-[r-]--[r-]--\"|wc -l`
ls -lL /etc/shadow 2>/dev/null
echo \"shadow=\"`ls -lL /etc/shadow 2>/dev/null|grep -v \"[r-]--------\"|wc -l`
ls -lL /etc/xinetd.conf 2>/dev/null
echo \"xinetd=\"`ls -lL /etc/xinetd.conf 2>/dev/null|grep -v \"[r-][w-]-------\"|wc -l`
ls -lLd /etc/security 2>/dev/null
echo \"security=\"`ls -lLd /etc/security 2>/dev/null|grep -v \"[r-][w-]-------\"|wc -l`
";
push(@array_other_linux_flag, 21);push(@array_redhat_flag, 21);push(@array_debain_flag, 21);push(@array_suse_flag, 21);push(@array_ubuntu_flag, 21);push(@array_centos_flag, 21);$pre_cmd{22} = "if [ -f /etc/syslog.conf ];
then
syslog=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"*.err\\;kern\\.debug\\;daemon\\.notice[[:space:]]*/var/adm/messages\"|wc -l`;
if [ \$syslog -ge 1 ];
then
echo \"syslog check result:true\";
else
echo \"syslog check result:false\";
fi;
fi;
if [ -f /etc/rsyslog.conf ];
then
rsyslog=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"*.err\\;kern\\.debug\\;daemon\\.notice[[:space:]]*/var/adm/messages\"|wc -l`;
if [ \$rsyslog -ge 1 ];
then
echo \"rsyslog check result:true\";
else
echo \"rsyslog check result:false\";
fi;
fi;
if [ -s /etc/syslog-ng/syslog-ng.conf ];
then suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"level(err) or facility(kern) and level(debug) or facility(daemon) and level(notice)\"`;
if [ -n \"\$suse_ret\" ];
then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep 'file(\"/var/adm/msgs\")'`;
if [ -n \"\$suse_ret2\" ];
then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination(msgs)\"`;
fi;
fi;
fi;
if [ -n \"\$suse_ret3\" ];
then echo \"suse:valid\";
else echo \"suse:no value\";
fi;
unset suse_ret suse_ret2 suse_ret3 rsyslog syslog;
";
push(@array_other_linux_flag, 22);push(@array_redhat_flag, 22);push(@array_debain_flag, 22);push(@array_suse_flag, 22);push(@array_ubuntu_flag, 22);push(@array_centos_flag, 22);$pre_cmd{23} = "UP_GIDMIN=`(grep -v ^# /etc/login.defs |grep \"^GID_MIN\"|awk '(\$1=\"GID_MIN\") {print \$2}')`
UP_GIDMAX=`(grep -v ^# /etc/login.defs |grep \"^GID_MAX\"|awk '(\$1=\"GID_MAX\") {print \$2}')`
egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$4>='\$UP_GIDMIN' && \$4<='\$UP_GIDMAX') {print \$1\":\"\$3\":\"\$4}'
echo \$UP_GIDMIN \$UP_GIDMAX
echo \"result=\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$4>='\$UP_GIDMIN' && \$4<='\$UP_GIDMAX') {print \$1\":\"\$3\":\"\$4}'|wc -l`
unset UP_GIDMIN UP_GIDMAX
";
push(@array_other_linux_flag, 23);push(@array_redhat_flag, 23);push(@array_debain_flag, 23);push(@array_suse_flag, 23);push(@array_ubuntu_flag, 23);push(@array_centos_flag, 23);$pre_cmd{24} = "if [[ -n `ps -ef|grep sshd|grep -v grep` ]];then
echo \"SSH is running\"
if [ -e /etc/ssh/sshd_config ];then
Banner_file=`cat /etc/ssh/sshd_config|grep -v \"^#\"|grep -v \"^\$\"|grep -w Banner|awk '{print\$2}'`
if [ -n \"\$Banner_file\" ];then
cat /etc/ssh/sshd_config|grep -v \"^#\"|grep -v \"^\$\"|grep -w Banner
if [ -e \$Banner_file ];then
echo \"Banner file:\$Banner_file\"
if [ -s \$Banner_file ];then
echo \"result=yes\"
else
echo \"result=The \$Banner_file is empty\"
fi
else
echo \"result=The \$Banner_file file not found\"
fi
else
echo \"result=Banner is not configured\"
fi
else
echo \"result=The /etc/ssh/sshd_config not found\"
fi
unset Banner_file
else
echo \"result=SSH not running\"
fi
";
push(@array_other_linux_flag, 24);push(@array_redhat_flag, 24);push(@array_debain_flag, 24);push(@array_suse_flag, 24);push(@array_ubuntu_flag, 24);push(@array_centos_flag, 24);$pre_cmd{25} = "echo \"ip_forward=\"`sysctl -n net.ipv4.ip_forward`
";
push(@array_other_linux_flag, 25);push(@array_redhat_flag, 25);push(@array_debain_flag, 25);push(@array_suse_flag, 25);push(@array_ubuntu_flag, 25);push(@array_centos_flag, 25);$pre_cmd{26} = "ps -ef |grep \"rpc\"
if [[ -n `ps -ef|grep nfsd|grep -v grep` ]];then
echo \"result=nfs is running\"
cat /etc/hosts.allow|grep -v \"^[[:space:]]*#\"|grep \"^nfs:\"
if [[ -n `cat /etc/hosts.allow|grep -v \"^[[:space:]]*#\"|grep \"^nfs:\"` ]];then
echo \"result1=true\"
else
echo \"result1=false\"
fi
cat /etc/hosts.deny|grep -v \"^[[:space:]]*#\"|egrep -i \"nfs:ALL|ALL:ALL\"
if [[ -n `cat /etc/hosts.deny|grep -v \"^[[:space:]]*#\"|egrep -i \"nfs:ALL|ALL:ALL\"` ]];then
echo \"result2=true\"
else
echo \"result2=false\"
fi
else
echo \"result=nfs not running\"
fi
";
push(@array_other_linux_flag, 26);push(@array_redhat_flag, 26);push(@array_debain_flag, 26);push(@array_suse_flag, 26);push(@array_ubuntu_flag, 26);push(@array_centos_flag, 26);$pre_cmd{27} = "cat /etc/inittab|grep -v \"^#\"|grep \"ctrlaltdel\"
";
push(@array_other_linux_flag, 27);push(@array_redhat_flag, 27);push(@array_debain_flag, 27);push(@array_suse_flag, 27);push(@array_ubuntu_flag, 27);push(@array_centos_flag, 27);$pre_cmd{28} = "cat /etc/hosts.allow |sed '/^#/d'|sed '/^\$/d'|egrep -i \"sshd|telnet|all\"
cat /etc/hosts.deny |sed '/^#/d'|sed '/^\$/d'|egrep -i \"all:all\"
echo \"allowno=\"`egrep -i \"sshd|telnet|all\" /etc/hosts.allow |sed '/^#/d'|sed '/^\$/d'|wc -l`
echo \"denyno=\"`egrep -i \"sshd|telnet|all\" /etc/hosts.deny |sed '/^#/d'|sed '/^\$/d'|wc -l`
";
push(@array_other_linux_flag, 28);push(@array_redhat_flag, 28);push(@array_debain_flag, 28);push(@array_suse_flag, 28);push(@array_ubuntu_flag, 28);push(@array_centos_flag, 28);$pre_cmd{29} = "awk -F: '( \$2 == \"\" ) { print \$1 }' /etc/shadow
echo \"result=\"`awk -F: '( \$2 == \"\" ) { print \$1 }' /etc/shadow |wc -l`
";
push(@array_other_linux_flag, 29);push(@array_redhat_flag, 29);push(@array_debain_flag, 29);push(@array_suse_flag, 29);push(@array_ubuntu_flag, 29);push(@array_centos_flag, 29);$pre_cmd{30} = "redhat_version=`cat /etc/redhat-release 2>/dev/null|awk -F\"release\" '{print \$2}'|awk -F\\. '{print \$1}'|sed 's/\\s*//g'|awk -F. '{print\$1}'`
suse_version=`cat /etc/SuSE-release 2>/dev/null|grep -i \"VERSION\"|awk -F'=' '{print \$2}'|sed 's/[[:space:]]//g'|awk -F. '{print\$1}'`
if [ -n \"\$suse_version\" ] || [ \"\$redhat_version\" -lt 7 ];then
if [ -n \"`ps -ef|grep ntp|grep -v grep`\" ];then
echo \"Process is running\";
grep \"^server\" /etc/ntp.conf|grep -v \"127.127.1.0\"|grep -v \"127.0.0.1\";
echo \"ntpserver1=\"`grep \"^server\" /etc/ntp.conf|grep -v \"127.127.1.0\"|grep -v \"127.0.0.1\"|wc -l`;
else
echo \"Process is not running\";
crontab -l 2>/dev/null|grep -v \"^#\"|grep ntp;
echo \"ntpserver2=\"`crontab -l 2>/dev/null|grep -v \"^#\"|grep ntp|wc -l`;
fi
elif [ \"\$redhat_version\" -eq 7 ];then
if [ -n \"`ps -ef|grep chrony|grep -v grep`\" ];then
echo \"Process is running\"
grep \"^server\" /etc/chrony.conf|grep -v \"127.127.1.0\"|grep -v \"127.0.0.1\";
echo \"ntpserver1=\"`grep \"^server\" /etc/chrony.conf|grep -v \"127.127.1.0\"|grep -v \"127.0.0.1\"|wc -l`;
else
echo \"Process is not running\"
crontab -l 2>/dev/null|grep -v \"^#\"|grep ntp;
echo \"ntpserver2=\"`crontab -l 2>/dev/null|grep -v \"^#\"|grep ntp|wc -l`;
fi
fi
unset redhat_version suse_version
";
push(@array_other_linux_flag, 30);push(@array_redhat_flag, 30);push(@array_debain_flag, 30);push(@array_suse_flag, 30);push(@array_ubuntu_flag, 30);push(@array_centos_flag, 30);$pre_cmd{31} = "echo \"accept_redirects=\"`sysctl -n net.ipv4.conf.all.accept_redirects`
";
push(@array_other_linux_flag, 31);push(@array_redhat_flag, 31);push(@array_debain_flag, 31);push(@array_suse_flag, 31);push(@array_ubuntu_flag, 31);push(@array_centos_flag, 31);$pre_cmd{32} = "FTPSTATUS=`ps -ef|grep ftpd|grep -v grep|wc -l`
Check_ftp ()
{
if [ -f /etc/vsftpd.conf ];
then
FTPCONF=\"/etc/vsftpd.conf\";
else
if [ -f /etc/vsftpd/vsftpd.conf ];
then
FTPCONF=\"/etc/vsftpd/vsftpd.conf\";
fi;
fi;
if [ -f \"\$FTPCONF\" ]
then
if [ `grep -v \"^[[:space:]]*#\" \$FTPCONF|grep -i \"ftpd_banner\"|wc -l` -ne 0 ];
then
echo \"vsftpd is running.Banner in \$FTPCONF is recommended.FTP check result:true\";
else
echo \"vsftpd is running.Banner in \$FTPCONF is not recommended.FTP check result:false\";
fi;
fi;
if [ -f /etc/pure-ftpd/pure-ftpd.conf ];
then
if [ `cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"FortunesFile\"|wc -l` -eq 0 ]
then
echo \"pure-ftpd is running.banner in pure-ftpd.conf is not recommended.FTP check result:false.\";
else
if [ -s \"`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"FortunesFile\"|awk '{print \$2}'`\" ];
then
echo \"pure-ftpd is running.Banner in pure-ftpd.conf is recommended.FTP check result:true.\";
else
echo \"pure-ftpd is running.Banner in pure-ftpd.conf is not recommended.FTP check result:false.\";
fi;
fi;
else
if [ -f /etc/pure-ftpd.conf ]
then
if [ `cat /etc/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"FortunesFile\"|wc -l` -eq 0 ]
then
echo \"pure-ftpd is running.banner in pure-ftpd.conf is not recommended.FTP check result:false.\";
else
if [ -s \"`cat /etc/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"FortunesFile\"|awk '{print \$2}'`\" ];
then
echo \"pure-ftpd is running.Banner in pure-ftpd.conf is recommended.FTP check result:true.\";
else
echo \"pure-ftpd is running.Banner in pure-ftpd.conf is not recommended.FTP check result:false.\";
fi;
fi
fi;
fi;
if [ -f /etc/ftpaccess ];
then
if [ `cat /etc/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*banner\"|wc -l` -eq 0 ]
then
echo \"wu-ftpd is running.banner in wu-ftpd.conf is not recommended.FTP check result:false.\";
else
if [ -s \"`cat /etc/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*banner\"|awk '{print \$2}'`\" ];
then
echo \"wu-ftpd is running.Banner in wu-ftpd.conf is recommended.FTP check result:true.\";
else
echo \"wu-ftpd is running.Banner in wu-ftpd.conf is not recommended.FTP check result:false.\";
fi;
fi;
else
if [ -f /etc/ftpd/ftpaccess ]
then
if [ `cat /etc/ftpd/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*banner\"|wc -l` -eq 0 ]
then
echo \"wu-ftpd is running.banner in wu-ftpd.conf is not recommended.FTP check result:false.\";
else
if [ -s \"`cat /etc/ftpd/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*banner\"|awk '{print \$2}'`\" ];
then
echo \"wu-ftpd is running.Banner in wu-ftpd.conf is recommended.FTP check result:true.\";
else
echo \"wu-ftpd is running.Banner in wu-ftpd.conf is not recommended.FTP check result:false.\";
fi;
fi;
fi;
fi;
if [ -f /etc/proftpd.conf ];
then
if [ -s \"`cat /etc/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed '/<Anonymous.*>/,/<\\/Anonymous>/d'|grep -i \"DisplayConnect\"|awk '{print \$2}'`\" ]
then
echo \"proftpd is running.banner in proftpd.conf is recommended.FTP check result:true.\";
else
echo \"proftpd is running.banner in proftpd.conf is not recommended.FTP check result:false.\";
fi;
else
if [ -f /etc/proftpd/proftpd.conf ];
then
if [ -s \"`cat /etc/proftpd/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed '/<Anonymous.*>/,/<\\/Anonymous>/d'|grep -i \"DisplayConnect\"|awk '{print \$2}'`\" ]
then
echo \"proftpd is running.banner in proftpd.conf is recommended.FTP check result:true.\";
else
echo \"proftpd is running.banner in proftpd.conf is not recommended.FTP check result:false.\";
fi;
else
if  [ -f /usr/local/proftpd/etc/proftpd.conf ]
then
if [ -s \"`cat /usr/local/proftpd/etc/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed '/<Anonymous.*>/,/<\\/Anonymous>/d'|grep -i \"DisplayConnect\"|awk '{print \$2}'`\" ]
then
echo \"proftpd is running.banner in proftpd.conf is recommended.FTP check result:true.\";
else
echo \"proftpd is running.banner in proftpd.conf is not recommended.FTP check result:false.\";
fi;
fi;
fi;
fi;
unset FTPCONF;
}
if [ \$FTPSTATUS -eq 0 ];
then
echo \"FTP is not running.FTP check result:true\"
else
Check_ftp;
fi;
unset FTPSTATUS;
";
push(@array_other_linux_flag, 32);push(@array_redhat_flag, 32);push(@array_debain_flag, 32);push(@array_suse_flag, 32);push(@array_ubuntu_flag, 32);push(@array_centos_flag, 32);$pre_cmd{33} = "SNMPD_STATUS=`ps -ef|grep snmpd|egrep -v \"grep\"|wc -l`;
Check_SNMPD ()
{
if [ -f /etc/snmp/snmpd.conf ];
then SNMPD_CONF=/etc/snmp/snmpd.conf;
else SNMPD_CONF=/etc/snmpd.conf;
fi;
grep -v \"^#\" \$SNMPD_CONF|egrep \"community\";
if [ `grep -v \"^#\" \$SNMPD_CONF|egrep \"rocommunity|rwcommunity\"|egrep \"public|private\"|wc -l` -eq 0 ];
then echo \"SNMPD is running.SNMP check result:true\";
else echo \"SNMPD is running.SNMP check result:false\";
fi;
}
if [ \"\$SNMPD_STATUS\" -ge  1 ];
then Check_SNMPD;
else echo \"SNMPD is not running.SNMP check result:true\";
fi
unset SNMPD_STATUS SNMPD_CONF;
";
push(@array_other_linux_flag, 33);push(@array_redhat_flag, 33);push(@array_debain_flag, 33);push(@array_suse_flag, 33);push(@array_ubuntu_flag, 33);push(@array_centos_flag, 33);$pre_cmd{34} = "up_uidmin=`(grep -v ^# /etc/login.defs |grep \"^UID_MIN\"|awk '(\$1=\"UID_MIN\"){print \$2}')`
up_uidmax=`(grep -v ^# /etc/login.defs |grep \"^UID_MAX\"|awk '(\$1=\"UID_MAX\"){print \$2}')`
egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}'
echo \"result=\"`egrep -v \"oracle|sybase|postgres\" /etc/passwd|awk -F: '(\$3>='\$up_uidmin' && \$3<='\$up_uidmax') {print \$1\":\"\$3}'|wc -l`
unset up_uidmin up_uidmax
";
push(@array_other_linux_flag, 34);push(@array_redhat_flag, 34);push(@array_debain_flag, 34);push(@array_suse_flag, 34);push(@array_ubuntu_flag, 34);push(@array_centos_flag, 34);$pre_cmd{35} = "if [[ -n `ps -A | egrep -i -w \"gnome|kde|mate|cinnamon|lx|xfce|jwm\"` ]];then
echo \"result1=\"`gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled 2>/dev/null`
echo \"result2=\"`gconftool-2 -g /apps/gnome-screensaver/lock_enabled 2>/dev/null`
echo \"result3=\"`gconftool-2 -g /apps/gnome-screensaver/mode 2>/dev/null`
echo \"result4=\"`gconftool-2 -g /apps/gnome-screensaver/idle_delay 2>/dev/null`
else
echo \"result=No desktop installed\"
fi
";
push(@array_other_linux_flag, 35);push(@array_redhat_flag, 35);push(@array_debain_flag, 35);push(@array_suse_flag, 35);push(@array_ubuntu_flag, 35);push(@array_centos_flag, 35);$pre_cmd{36} = "FTPSTATUS=`ps -ef|grep ftpd|grep -v grep|wc -l`;
Check_ftp ()
{
if [ -f /etc/vsftpd.conf ];
then
FTPCONF=\"/etc/vsftpd.conf\";
else
if [ -f /etc/vsftpd/vsftpd.conf ];
then
FTPCONF=\"/etc/vsftpd/vsftpd.conf\";
fi;
fi;
if [ -f \"\$FTPCONF\" ]
then
cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep \"ls_recurse_enable\";
cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep \"local_umask\";
cat \$FTPCONF|grep -v \"^[[:space:]]*#\"|grep \"anon_umask\";
fi;
if [ -f /etc/pure-ftpd/pure-ftpd.conf ];
then
echo \"pureftp_umask=\"`cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*Umask\"`;
else
if [ -f /etc/pure-ftpd.conf ]
then
echo \"pureftp_umask=\"`cat /etc/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*Umask\"`;
fi;
fi;
if [ -f /etc/proftpd.conf ];
then
echo \"proftp_umask=\"`cat /etc/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*Umask\"`;
else
if [ -f /etc/proftpd/proftpd.conf ];
then
echo \"proftp_umask=\"`cat /etc/proftpd/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*Umask\"`;
else
if [ -f /usr/local/proftpd/etc/proftpd.conf ];
then
echo \"proftp_umask=\"`cat /usr/local/proftpd/etc/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*Umask\"`;
fi;
fi;
fi;
if [ -f /etc/ftpaccess ];
then
cat /etc/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*upload\";
else
if [ -f /etc/ftpd/ftpaccess ]
then
cat /etc/ftpd/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"^[[:space:]]*upload\";
fi;
fi;
unset FTPCONF;
}
if [ \$FTPSTATUS -eq 0 ];
then  echo \"FTP is not running.FTP check result:true.\";
else
Check_ftp;
fi
unset FTPSTATUS;
";
push(@array_other_linux_flag, 36);push(@array_redhat_flag, 36);push(@array_debain_flag, 36);push(@array_suse_flag, 36);push(@array_ubuntu_flag, 36);push(@array_centos_flag, 36);$pre_cmd{37} = "ls /etc/rc2.d/* /etc/rc3.d/* /etc/rc4.d/* /etc/rc5.d/* 2>/dev/null|egrep \"lp|rpc|snmpdx|keyserv|nscd|Volmgt|uucp|dmi|sendmail|autoinstall\"|grep \"^S\"
echo \"result=\"` ls /etc/rc2.d/* /etc/rc3.d/* /etc/rc4.d/* /etc/rc5.d/* 2>/dev/null|egrep \"lp|rpc|snmpdx|keyserv|nscd|Volmgt|uucp|dmi|sendmail|autoinstall\"|grep \"^S\"|wc -l`
";
push(@array_other_linux_flag, 37);push(@array_redhat_flag, 37);push(@array_debain_flag, 37);push(@array_suse_flag, 37);push(@array_ubuntu_flag, 37);push(@array_centos_flag, 37);$pre_cmd{38} = "uname -a
if [ -f /etc/SuSE-release ];
then
cat /etc/SuSE-release;
uname -a;
else
if [ -f /etc/redhat-release ];
then
cat /etc/redhat-release;
uname -a;
fi;
fi;
";
push(@array_other_linux_flag, 38);push(@array_redhat_flag, 38);push(@array_debain_flag, 38);push(@array_suse_flag, 38);push(@array_ubuntu_flag, 38);push(@array_centos_flag, 38);$pre_cmd{39} = "unset red_ret suse_ret suse_ret2 suse_ret3
if [ -s /etc/syslog.conf ];
then
cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | egrep \"authpriv\\.\\*.*[[:space:]]*\\/|authpriv\\.info.*[[:space:]]*\\/\";
fi;
if [ -s /etc/rsyslog.conf ];
then
cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | egrep \"authpriv\\.\\*.*[[:space:]]*\\/|authpriv\\.info.*[[:space:]]*\\/\";
fi;
if [ -s /etc/syslog-ng/syslog-ng.conf ];
then
suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"facility(auth)\" | grep \"filter\" | awk '{print \\\$2}'`;
if [ -n \"\$suse_ret\" ];
then
suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination\" | grep \"/var/log/authlog\"`;
if [ -n \"\$suse_ret2\" ];
then
suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log\" | grep \"\$suse_ret\"`;
fi;
fi;
fi;
if [ -n \"\$suse_ret3\" ];
then
echo \"suse:valid\";
else
echo \"ret:no value\";
fi;
unset suse_ret suse_ret2 suse_ret3;
";
push(@array_other_linux_flag, 39);push(@array_redhat_flag, 39);push(@array_debain_flag, 39);push(@array_suse_flag, 39);push(@array_ubuntu_flag, 39);push(@array_centos_flag, 39);$pre_cmd{40} = "if [[ -n `ps -ef|egrep -w \"syslogd|rsyslogd|syslog-ng\"|grep -v grep` ]];then
echo \"result=Log service is running\"
function venus (){
if [ -f \$1 ];then
for Log_File in `cat \$1|grep -v \"^[[:space:]]*#\"|egrep  \"^[^\\\$]\"|grep \"/\"|awk '{print\$2}'|sed 's/^-//g'`
do
if [ -f \$Log_File ];then
ls -l \$Log_File
echo \"result1=\"`ls -l \$Log_File|grep -v \"[r-][w-]-[r-]-----\"|wc -l`
else
echo \"The \$Log_File file not found\"
fi
done
unset Log_File
else
echo \"The \$1 file not found\"
fi
}
Log_Type=`ps -ef|egrep -w \"syslogd|rsyslogd|syslog-ng\"|grep -v grep|awk '{print\$8}'|awk -F\"/\" '{for(i=1;i<=NF;i++)if(\$i~/syslog/)print\$i}'`
echo \"Log_Type=\$Log_Type\"
case \$Log_Type in
syslogd)
Log_Conf=\"/etc/syslog.conf\"
venus \"\$Log_Conf\"
;;
rsyslogd)
Log_Conf=\"/etc/rsyslog.conf\"
venus \"\$Log_Conf\"
;;
syslog-ng)
Log_Conf=\"/etc/syslog-ng/syslog-ng.conf\"
echo \$Log_Conf
if [ -f \$Log_Conf ];then
for Destination in `cat /etc/syslog-ng/syslog-ng.conf|grep -v \"^[[:space:]]*#\"|grep -aPo '(?<=destination\\()[^\\)]+'`
do
for Log in `cat /etc/syslog-ng/syslog-ng.conf|grep -v \"^[[:space:]]*#\"|grep \"^destination\"|grep \"\$Destination\"|awk -F\"\\\"\" '{print\$2}'`
do
if [ -f \$Log ];then
ls -l \$Log
echo \"result1=\"`ls -l \$Log|grep -v \"[r-][w-]-[r-]-----\"|wc -l`
else
echo \"The \$Log file not found\"
fi
done
done
else
echo \"The \$Log_Conf file not found\"
fi
;;
*)
echo \"The Log_Type not found\"
;;
esac
unset Log_Type Log_Conf Destination Log
else
echo \"result=Log service not running\"
ls -l \$(find /var/log/ -type f)
echo \"result1=\"`ls -l \$(find /var/log/ -type f)|grep -v \"[r-][w-]-[r-]-----\"|wc -l`
fi
";
push(@array_other_linux_flag, 40);push(@array_redhat_flag, 40);push(@array_debain_flag, 40);push(@array_suse_flag, 40);push(@array_ubuntu_flag, 40);push(@array_centos_flag, 40);$pre_cmd{41} = "if ([ -f /etc/redhat-release ] && [ -f /etc/pam.d/system-auth ]);
then FILE=/etc/pam.d/system-auth
cat \$FILE |sed '/^#/d'|sed '/^\$/d'|grep password
fi
suse_version=`cat /etc/SuSE-release 2>/dev/null|grep -i \"VERSION\"|awk '{print \$3}'`
if ([ \"x\$suse_version\" = x10 ] || [ \"x\$suse_version\" = x11 ])
then
FILE=/etc/pam.d/common-password
cat \$FILE|grep -v '^#'|grep -v '^\$'|grep password
else
if [ -f /etc/SuSE-release ]
then
FILE=/etc/pam.d/passwd
cat \$FILE|grep -v '^#'|grep -v '^\$'|grep password
fi
fi
unset suse_version FILE;
";
push(@array_other_linux_flag, 41);push(@array_redhat_flag, 41);push(@array_debain_flag, 41);push(@array_suse_flag, 41);push(@array_ubuntu_flag, 41);push(@array_centos_flag, 41);$pre_cmd{42} = "Check_ftp2 (){
if [ -f /etc/vsftpd.conf ];then
FTPCONF=\"/etc/vsftpd.conf\";
FTPUSER=`cat \$FTPCONF|grep -v \"^#\"|grep userlist_file|cut -d= -f2`;
Check_vsftpconf;
else
if [ -f /etc/vsftpd/vsftpd.conf ];then
FTPCONF=\"/etc/vsftpd/vsftpd.conf\";
FTPUSER=`cat \$FTPCONF|grep -v \"^#\"|grep userlist_file|cut -d= -f2`;
Check_vsftpconf;
fi;
fi;
}
Check_vsftpconf (){
userlist_enable=`grep -v \"^#\" \$FTPCONF|grep -i \"userlist_enable=YES\"|wc -l`;
userlist_deny=`grep -v \"^#\" \$FTPCONF|grep -i \"userlist_deny=NO\"|wc -l`;
if [ \$userlist_enable = 1 -a \$userlist_deny = 1 ];then
if [ -n \"\$FTPUSER\" ];then
if [ `grep -v \"^#\" \$FTPUSER|egrep \"^root\$\"|wc -l` = 0 ];then
echo \"FTP is running.FTP user config \$ftpusers_pam is not recommended.FTP user config \"\$FTPUSER\" is recommended.FTP check result:true\";
else
echo \"FTP is running.FTP user config \$ftpusers_pam is not recommended.FTP user config \"\$FTPUSER\" is not recommended.FTP check result:false\";
fi;
else
echo \"FTP is running.FTP user config \$ftpusers_pam is not recommended.FTP user config \"\$FTPUSER\" does not exist.FTP check result:false\";
fi;
else
echo \"FTP is running.FTP user config \$ftpusers_pam is not recommended.userlist_enable and userlist_deny is not recommended.FTP check result:false\";
fi;
}
Check_ftp1 (){
if [ -f /etc/pam.d/vsftpd ];then
ftpusers_pam=`grep \"file\" /etc/pam.d/vsftpd|egrep -v \"^#\"|sed 's/^.*file=//g'|awk '{print \$1}'`
if [ -n \"\$ftpusers_pam\" ];then
if [ `grep -v \"^#\" \$ftpusers_pam|egrep \"^root\$\"|wc -l` -ge 1 ];then
echo \"FTP is running.FTP user config \$ftpusers_pam is recommended.FTP check result:true\";
else
Check_ftp2;
fi
else
Check_ftp2;
fi
else
echo \"/etc/pam.d/vsftpd is not exist,scripts exit now\";
Check_ftp2;
fi
if [ -f /etc/proftpd.conf ];then
if [ `cat /etc/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|egrep -i \"RootLogin[[:space:]]*on|wc -l` -eq 0 ];then
echo \"proftpd is running.FTP check result:true\";
else
echo \"proftpd is running.FTP check result:false\";
fi;
else
if [ -f /etc/proftpd/proftpd.conf ];then
if [ `cat /etc/proftpd/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|egrep -i \"RootLogin[[:space:]]*on|wc -l` -eq 0 ];then
echo \"proftpd is running.FTP check result:true\";
else
echo \"proftpd is running.FTP check result:false\";
fi;
else
if [ -f /usr/local/proftpd/etc/proftpd.conf ];then
if [ `cat /usr/local/proftpd/etc/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|egrep -i \"RootLogin[[:space:]]*on|wc -l` -eq 0 ];then
echo \"proftpd is running.FTP check result:true\";
else
echo \"proftpd is running.FTP check result:false\";
fi;
fi;
fi;
fi;
if [ -f /etc/ftpusers ];then
echo \"wu-ftp_users=\"`cat /etc/ftpusers|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep \"^root\"`;
else
if [ -f /etc/ftpd/ftpusers ];then
echo \"wu-ftp_users=\"`cat /etc/ftpd/ftpusers|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep \"^root\"`;
fi;
fi;
if [ -f /etc/pure-ftpd/pure-ftpd.conf ];then
cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"MinUID\";
else
if [ -f /etc/pure-ftpd.conf ];then
cat /etc/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"MinUID\";
fi;
fi;
}
if [[ -z `ps -ef|grep ftpd|grep -v grep` ]];then
echo \"result=FTP is not running\";
else
echo \"result=FTP is running\";
Check_ftp1;
fi
unset FTPSTATUS FTPCONF FTPUSER ftpusers_pam
";
push(@array_other_linux_flag, 42);push(@array_redhat_flag, 42);push(@array_debain_flag, 42);push(@array_suse_flag, 42);push(@array_ubuntu_flag, 42);push(@array_centos_flag, 42);$pre_cmd{43} = "unset red_ret suse_ret suse_ret2 suse_ret3
if [ -s /etc/syslog.conf ];
then red_ret=`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv\\.\\*[[:space:]]\\/*\"`;
fi
if [ -s /etc/rsyslog.conf ];
then red_ret2=`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"authpriv\\.\\*[[:space:]]\\/*\"`;
fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];
then
suse_ret=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"facility(authpriv)\" | grep \"filter\" | awk '{print \\\$2}'`;
if [ -n \"\$suse_ret\" ];
then suse_ret2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination\" | grep \"/var/log/secure\"`;
if [ -n \"\$suse_ret2\" ];
then suse_ret3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log\" | grep \"\$suse_ret\"`;
fi;
fi;
fi
if [ -n \"\$red_ret\" ];
then
echo \"redhat-suse:valid\";
else
if [ -n \"\$red_ret2\" ];
then
echo \"red-hat6:valid\";
else
if [ -n \"\$suse_ret3\" ];
then
echo \"suse:valid\";
else
echo \"ret:no value\";
fi
fi;
fi;
unset red_ret suse_ret suse_ret2 suse_ret3;
";
push(@array_other_linux_flag, 43);push(@array_redhat_flag, 43);push(@array_debain_flag, 43);push(@array_suse_flag, 43);push(@array_ubuntu_flag, 43);push(@array_centos_flag, 43);$pre_cmd{44} = "FTPSTATUS=`ps -ef|grep -v grep|grep -i ftpd|wc -l`
Check_ftp ()
{
if [ -f /etc/vsftpd.conf ];
then
FTPCONF=\"/etc/vsftpd.conf\";
else
if [ -f /etc/vsftpd/vsftpd.conf ];
then
FTPCONF=\"/etc/vsftpd/vsftpd.conf\";
fi;
fi;
if [ -f \"\$FTPCONF\" ];
then
if ([ `grep -v \"^#\" \$FTPCONF|grep -i \"chroot_list_enable=YES\"|wc -l` -eq 1 ] && [ `grep -v \"^#\" /etc/vsftpd/vsftpd.conf|grep -i \"chroot_local_user=YES\"|wc -l` -eq 0 ]);
then
if [ -s \"`grep -v \"^#\" /etc/vsftpd/vsftpd.conf|grep -i \"chroot_list_file\"|cut -d\\= -f2`\" ]
then
echo \"FTP is running.FTP check result:true\"
else
echo \"FTP is running.FTP check result:false\"
fi
else
echo \"FTP is running.FTP check result:false\"
fi
fi
if [ -f /etc/pure-ftpd/pure-ftpd.conf ];
then
cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"ChrootEveryone\";
else
if [ -f /etc/pure-ftpd.conf ];
then
cat /etc/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"ChrootEveryone\";
fi;
fi;
if [ -f /etc/proftpd.conf ];
then
cat /etc/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|egrep -i \"DefaultRoot\";
else
if [ -f /etc/proftpd/proftpd.conf ];
then
cat /etc/proftpd/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|egrep -i \"DefaultRoot\";
else
if [ -f /usr/local/proftpd/etc/proftpd.conf ];
then
cat /usr/local/proftpd/etc/proftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|egrep -i \"DefaultRoot\";
fi;
fi;
fi;
if [ -f /etc/ftpaccess ];
then
cat /etc/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"restricted-uid\";
else
if [ -f /etc/ftpd/ftpaccess ];
then
cat /etc/ftpd/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"restricted-uid\";
fi;
fi;
unset FTPCONF;
}
if [ \$FTPSTATUS -eq 0 ];
then
echo \"FTP is not running.FTP check result:true\";
else
Check_ftp;
fi
unset FTPSTATUS;
";
push(@array_other_linux_flag, 44);push(@array_redhat_flag, 44);push(@array_debain_flag, 44);push(@array_suse_flag, 44);push(@array_ubuntu_flag, 44);push(@array_centos_flag, 44);$pre_cmd{45} = "if [[ `cat /etc/redhat-release 2>/dev/null|cut -b 22` -eq 7 ]] || [[ `cat /etc/redhat-release 2>/dev/null|cut -b 41` -eq 7 ]];then
systemctl|grep active
else
chkconfig --list
fi
netstat -an|awk '{if( \$2==0 ){print\$0}}'
";
push(@array_other_linux_flag, 45);push(@array_redhat_flag, 45);push(@array_debain_flag, 45);push(@array_suse_flag, 45);push(@array_ubuntu_flag, 45);push(@array_centos_flag, 45);$pre_cmd{46} = "cat /etc/pam.d/su|grep -v \"^[[:space:]]*#\"|grep -v \"^\$\"|grep \"^auth\"
";
push(@array_other_linux_flag, 46);push(@array_redhat_flag, 46);push(@array_debain_flag, 46);push(@array_suse_flag, 46);push(@array_ubuntu_flag, 46);push(@array_centos_flag, 46);$pre_cmd{47} = "if [ `ps -ef|grep ftpd|grep -v \"grep\"|wc -l` -ge 1 ];
then
if [ -f /etc/vsftpd.conf ];
then
cat /etc/vsftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"anonymous_enable\";
else
if [ -f /etc/vsftpd/vsftpd.conf ];
then
cat /etc/vsftpd/vsftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"anonymous_enable\";
fi
fi;
if [ -f /etc/ftpaccess ];
then
if ([ `cat /etc/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep \"^class\\s*[^\\s]\\{1,\\}\\s*.*guest\"|wc -l` -ne 0 ] || [ `cat /etc/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep \"^class\\s*[^\\s]\\{1,\\}\\s*.*anonymous\"|wc -l` -ne 0 ]);
then
echo \"wu-ftp There are anonymous logins\";
else
echo \"wu-ftp There is no anonymous logins\";
fi;
else
if [ -f /etc/ftpd/ftpaccess ];
then
if ([ `cat /etc/ftpd/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep \"^class\\s*[^\\s]\\{1,\\}\\s*.*guest\"|wc -l` -ne 0 ] || [ `cat /etc/ftpd/ftpaccess|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep \"^class\\s*[^\\s]\\{1,\\}\\s*.*anonymous\"|wc -l` -ne 0 ]);
then
echo \"wu-ftp There are anonymous logins\";
else
echo \"wu-ftp There is no anonymous logins\";
fi;
fi;
fi;
if [ -f /etc/proftpd.conf ];
then
Anonymous_1=`cat /etc/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed -n '/<Anonymous.*/,/<\\/Anonymous>/p'|grep -i \"AnonRequirePassword[[:space:]]*on\"|wc -l`;
Anonymous_2=`cat /etc/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed -n '/<Anonymous.*/,/<\\/Anonymous>/p'|egrep -i \"User|Group|UserAlias\"|wc -l`;
if ([ \$Anonymous_1 -ge 1 ] || [ \$Anonymous_2 -lt 3 ])
then
echo \"proftp There is no anonymous logins\";
else
echo \"proftp There are anonymous logins\";
fi;
else
if [ -f /etc/proftpd/proftpd.conf ];
then
Anonymous_1=`cat /etc/proftpd/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed -n '/<Anonymous.*/,/<\\/Anonymous>/p'|grep -i \"AnonRequirePassword[[:space:]]*on\"|wc -l`;
Anonymous_2=`cat /etc/proftpd/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed -n '/<Anonymous.*/,/<\\/Anonymous>/p'|egrep -i \"User|Group|UserAlias\"|wc -l`;
if ([ \$Anonymous_1 -ge 1 ] || [ \$Anonymous_2 -lt 3 ])
then
echo \"proftp There is no anonymous logins\";
else
echo \"proftp There are anonymous logins\";
fi;
else
if [ -f /usr/local/proftpd/etc/proftpd.conf ];
then
Anonymous_1=`cat /usr/local/proftpd/etc/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed -n '/<Anonymous.*/,/<\\/Anonymous>/p'|grep -i \"AnonRequirePassword[[:space:]]*on\"|wc -l`;
Anonymous_2=`cat /usr/local/proftpd/etc/proftpd.conf|sed '/^\\s*#/d'|sed '/^\\s*\$/d'|sed -n '/<Anonymous.*/,/<\\/Anonymous>/p'|egrep -i \"User|Group|UserAlias\"|wc -l`;
if ([ \$Anonymous_1 -ge 1 ] || [ \$Anonymous_2 -lt 3 ])
then
echo \"proftp There is no anonymous logins\";
else
echo \"proftp There are anonymous logins\";
fi;
fi;
fi;
fi;
if [ -f /etc/pure-ftpd/pure-ftpd.conf ];
then
cat /etc/pure-ftpd/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"NoAnonymous\";
else
if [ -f /etc/pure-ftpd.conf ];
then
cat /etc/pure-ftpd.conf|grep -v \"^[[:space:]]*#\"|grep -v \"^[[:space:]]*\$\"|grep -i \"NoAnonymous\";
fi;
fi;
else
echo \"ftp is not running,result=true\";
fi;
";
push(@array_other_linux_flag, 47);push(@array_redhat_flag, 47);push(@array_debain_flag, 47);push(@array_suse_flag, 47);push(@array_ubuntu_flag, 47);push(@array_centos_flag, 47);$pre_cmd{48} = "if [ -e /etc/redhat-release ];then
cat /etc/redhat-release
export LANG=\"en_US.UTF-8\"
Linux_version=`cat /etc/redhat-release|awk -F. '{print\$1}'|awk '{print\$NF}'`
if [ \"\$Linux_version\" -eq 6 ];then
if [[ `chkconfig --list|grep telnet|awk '{print\$2}'` == \"on\" ]];then
for file in /etc/issue /etc/issue.net
do
if [[ -n `cat \$file 2>/dev/null|egrep -i \"Red Hat|CentOS\"` ]];then
echo \"result=The \$file file contain sensitive information.\"
else
echo \"result=The \$file file do not contain sensitive information.\"
fi
done
else
echo \"result=telnet not running\"
fi
elif [ \"\$Linux_version\" -eq 7 ];then
if [[ `chkconfig --list 2>/dev/null|grep telnet|awk '{print\$2}'` == \"on\" ]];then
for file in /etc/issue /etc/issue.net
do
if [[ -n `cat \$file 2>/dev/null|egrep -i \"Red Hat|CentOS\"` ]];then
echo \"result=The \$file file contain sensitive information.\"
else
echo \"result=The \$file file do not contain sensitive information.\"
fi
done
else
echo \"result=telnet not running\"
fi
fi
unset Linux_version
elif [ -e /etc/SuSE-release ];then
cat /etc/SuSE-release
if [[ `chkconfig --list|grep telnet|awk '{print\$2}'` == \"on\" ]];then
for file in /etc/issue /etc/issue.net
do
if [[ -n `cat \$file 2>/dev/null|egrep -i \"SuSE\"` ]];then
echo \"result=The \$file file contain sensitive information.\"
else
echo \"result=The \$file file do not contain sensitive information.\"
fi
done
else
echo \"result=telnet not running\"
fi
fi
";
push(@array_other_linux_flag, 48);push(@array_redhat_flag, 48);push(@array_debain_flag, 48);push(@array_suse_flag, 48);push(@array_ubuntu_flag, 48);push(@array_centos_flag, 48);$pre_cmd{49} = "if [ -f /etc/syslog.conf ]
then
echo \"syslog=\"`cat /etc/syslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron.\\*\"`
fi
if [ -f /etc/rsyslog.conf ]
then
echo \"rsyslog=\"`cat /etc/rsyslog.conf | grep -v \"^[[:space:]]*#\" | grep \"cron.\\*\"`
fi
if [ -s /etc/syslog-ng/syslog-ng.conf ];
then
cron_1=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"filter[[:space:]]*.*[[:space:]]*{[[:space:]]*facility(cron);[[:space:]]*};\" | wc -l`;
if [ \$cron_1 -ge 1 ];
then
cron_2=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"destination[[:space:]]*.*[[:space:]]*{[[:space:]]*file(\\\"/var/log/cron\\\")[[:space:]]*;[[:space:]]*};\"|awk '{print \$2}'`;
if [ -n \$cron_2 ];
then
cron_3=`cat /etc/syslog-ng/syslog-ng.conf | grep -v \"^[[:space:]]*#\" | grep \"log[[:space:]]*{[[:space:]]*source(src);[[:space:]]*filter(.*);[[:space:]]*destination(\$cron_2);[[:space:]]*};\" | wc -l`;
if [ \$cron_3 -ge 1 ]
then
echo \"Cron log has been configured,check result:true\";
else
echo \"No cron log,check result:false\";
fi;
fi;
fi;
fi;
";
push(@array_other_linux_flag, 49);push(@array_redhat_flag, 49);push(@array_debain_flag, 49);push(@array_suse_flag, 49);push(@array_ubuntu_flag, 49);push(@array_centos_flag, 49);$pre_cmd{50} = "lsattr /var/log/messages 2>/dev/null
";
push(@array_other_linux_flag, 50);push(@array_redhat_flag, 50);push(@array_debain_flag, 50);push(@array_suse_flag, 50);push(@array_ubuntu_flag, 50);push(@array_centos_flag, 50);$pre_cmd{51} = "cat /proc/sys/net/ipv4/conf/*/accept_source_route
";
push(@array_other_linux_flag, 51);push(@array_redhat_flag, 51);push(@array_debain_flag, 51);push(@array_suse_flag, 51);push(@array_ubuntu_flag, 51);push(@array_centos_flag, 51);$pre_cmd{52} = "cat /proc/sys/net/ipv4/tcp_syncookies
";
push(@array_other_linux_flag, 52);push(@array_redhat_flag, 52);push(@array_debain_flag, 52);push(@array_suse_flag, 52);push(@array_ubuntu_flag, 52);push(@array_centos_flag, 52);$pre_cmd{53} = "cat /etc/host.conf|grep -v \"^[[:space:]]*#\"|egrep \"order[[:space:]]hosts,bind|multi[[:space:]]on|nospoof[[:space:]]on\"
";
push(@array_other_linux_flag, 53);push(@array_redhat_flag, 53);push(@array_debain_flag, 53);push(@array_suse_flag, 53);push(@array_ubuntu_flag, 53);push(@array_centos_flag, 53);$pre_cmd{54} = "cat /etc/profile|grep -v \"^[[:space:]]*#\"|grep \"HISTFILESIZE\"
cat /etc/profile|grep -v \"^[[:space:]]*#\"|grep \"HISTSIZE\"
";
push(@array_other_linux_flag, 54);push(@array_redhat_flag, 54);push(@array_debain_flag, 54);push(@array_suse_flag, 54);push(@array_ubuntu_flag, 54);push(@array_centos_flag, 54);$pre_cmd{55} = "if [ `echo \$SHELL|egrep \"bash|sh\"|wc -l` -ge 1 ];then
if [ -f /root/.bashrc ];then
cat /root/.bashrc|grep -v \"^[[:space:]]*#\"
else
alias
fi
else
if [ -f /root/.cshrc ];then
cat /root/.cshrc|grep -v \"^[[:space:]]*#\"
else
alias
fi
fi
";
push(@array_other_linux_flag, 55);push(@array_redhat_flag, 55);push(@array_debain_flag, 55);push(@array_suse_flag, 55);push(@array_ubuntu_flag, 55);push(@array_centos_flag, 55);$pre_cmd{4596} = "openssl version
cat /etc/redhat-release 2>/dev/null
";
push(@array_other_linux_flag, 4596);push(@array_redhat_flag, 4596);push(@array_debain_flag, 4596);push(@array_suse_flag, 4596);push(@array_ubuntu_flag, 4596);push(@array_centos_flag, 4596);$pre_cmd{4597} = "env -i  X='() { (a)=>\\' bash -c '/dev/stdout echo vulnerable'  2>/dev/null
";
push(@array_other_linux_flag, 4597);push(@array_redhat_flag, 4597);push(@array_debain_flag, 4597);push(@array_suse_flag, 4597);push(@array_ubuntu_flag, 4597);push(@array_centos_flag, 4597);$pre_cmd{-11} = "hostname
";
push(@array_pre_flag, -11);$pre_cmd{-12} = "lsb_release -a
";
push(@array_pre_flag, -12);$pre_cmd{-13} = "cat /etc/passwd
";
push(@array_pre_flag, -13);$pre_cmd{-14} = "cat /etc/group
";
push(@array_pre_flag, -14);$pre_cmd{-15} = "cat /etc/shadow
";
push(@array_pre_flag, -15);$pre_cmd{-16} = "chkconfig --list
";
push(@array_pre_flag, -16);$pre_cmd{-17} = "netstat -anp
";
push(@array_pre_flag, -17);$pre_cmd{-18} = "ps -ef
";
push(@array_pre_flag, -18);$pre_cmd{-19} = "uname -r
";
push(@array_pre_flag, -19);$pre_cmd{-20} = "w -h
";
push(@array_pre_flag, -20);$pre_cmd{-22} = "w -fh
";
push(@array_pre_flag, -22);$pre_cmd{-21} = "/sbin/ifconfig -a
";
push(@array_pre_flag, -21);$pre_cmd{-24} = "df
";
push(@array_pre_flag, -24);$pre_cmd{-25} = "if [ -f /etc/syslog.conf ];then cat /etc/syslog.conf | sed '/^\\s*#/d'|sed '/^\\s*\$/d';elif [ -f /etc/rsyslog.conf ];then cat /etc/rsyslog.conf | sed '/^\\s*#/d'|sed '/^\\s*\$/d';else cat /etc/syslog-ng/syslog-ng.conf | sed '/^\\s*#/d'|sed '/^\\s*\$/d';fi
";
push(@array_pre_flag, -25);$pre_cmd{-26} = "last -100 | grep -v \"wtmp\"
";
push(@array_pre_flag, -26);$pre_cmd{-27} = "lastb -100
";
push(@array_pre_flag, -27);$pre_cmd{-28} = "ls -l /etc/shadow /etc/gshadow /etc/group /etc/passwd|awk '{print \$1\" \"\$NF}'
";
push(@array_pre_flag, -28);$pre_cmd{-29} = "uname -p
";
push(@array_pre_flag, -29);$pre_cmd{-30} = "faillog -a
";
push(@array_pre_flag, -30);


sub get_os_info
{
	my %os_info = (
 "initSh"=>"","hostname"=>"","osname"=>"","osversion"=>"");
 $os_info{"initSh"} = `unset LANG`;
	$os_info{"hostname"} = `uname -n`;
	$os_info{"osname"} = `uname -s`;
	$os_info{"osversion"} = `lsb_release -a;cat /etc/issue;cat /etc/redhat-release;uname -a`;
	foreach (%os_info){   chomp;}
	return %os_info;
}

sub add_item
{
	 my ($string, $flag, $value)= @_;
	 $string .= "\t\t".'<script>'."\n";
	 $string .= "\t\t\t<id>$flag</id>\n";
	 $string .= "\t\t\t<value><![CDATA[$value]]></value>\n";
	 $string .= "\t\t</script>\n";
	return $string;
}
sub generate_xml
{
	$ARGC = @ARGV;
	if($ARGC lt 1)
	{
		print qq{usag:uuid.pl IP };
		exit;
	}
	my %os_info = get_os_info();
	my $os_name = $os_info{"osname"};
	my $host_name = $os_info{"hostname"};
	my $os_version = $os_info{"osversion"};
	my $date = ` date "+%Y-%m-%d %H:%M:%S"`;
	chomp $date;
	my $coding = `echo \$LANG`;
	my $coding_value = "UTF-8";
	chomp $coding;
	if($coding =~ "GB")
	{
        $coding_value = "GBK"
    }
	my $ipaddr = $ARGV[0];
	my $xml_string = "";
	
	$xml_string .='<?xml version="1.0" encoding="'.$coding_value.'"?>'."\n";
	$xml_string .='<result>'."\n";
	$xml_string .= '<osName><![CDATA['."$os_name".']]></osName>'."\n";
	$xml_string .= '<version><![CDATA['."$os_version".']]></version>'."\n";
	$xml_string .= '<ip><![CDATA['."$ipaddr".']]></ip>'."\n";
	$xml_string .= '<type><![CDATA[/server/Linux]]></type>'."\n";
	$xml_string .= '<startTime><![CDATA['."$date".']]></startTime>'."\n";
	$xml_string .= '<pId><![CDATA[2]]></pId>'."\n";

	$xml_string .=	"\t".'<scripts>'."\n";
	$centos = "CentOS";
	$redhat = "Red Hat";
	$suse = "Suse";
	$debian = "Debian";
	$ubuntu = "Ubuntu";
	if($os_version=~ /$centos/i){
	@array_circle_flag = @array_centos_flag
	}
	elsif($os_version=~ /$redhat/i){
	@array_circle_flag = @array_redhat_flag
	}
	elsif($os_version=~ /$debian/i){
	@array_circle_flag = @array_debian_flag
	}
	elsif($os_version=~ /$ubuntu/i){
	@array_circle_flag = @array_ubuntu_flag
	}
	elsif($os_version=~ /$suse/i){
	@array_circle_flag = @array_suse_flag
	}
	else{	
	@array_circle_flag = @array_other_linux_flag
	}
	foreach $key (@array_circle_flag)
	{
		print $key."\n";
		$value = $pre_cmd{$key};
		my $tmp_result = $value.`$value`;
		chomp $tmp_result;
		$tmp_result =~ s/>/&gt;/g;
		$tmp_result =~ s/[\x00-\x08\x0b-\x0c\x0e-\x1f]//g;
		$xml_string = &add_item( $xml_string, $key, $tmp_result );
	}	
	foreach $key (@array_pre_flag)
		{
			print $key."\n";
			$value = $pre_cmd{$key};
			my $tmp_result = $value.`$value`;
			chomp $tmp_result;
			$tmp_result =~ s/>/&gt;/g;
			$tmp_result =~ s/[\x00-\x08\x0b-\x0c\x0e-\x1f]//g;
			$xml_string = &add_item( $xml_string, $key, $tmp_result );
		}
	$xml_string .= "\t</scripts>\n";
	
	my $enddate = ` date "+%Y-%m-%d %H:%M:%S"`;
	$xml_string .= '<endTime><![CDATA['."$enddate".']]></endTime>'."\n";
	
	$xml_string .= "</result>"."\n";
	$xmlfile = $ipaddr."_"."linux"."_chk.xml";
	print $xmlfile."\n";
	open XML,">$ENV{'PWD'}/".$xmlfile or die "Cannot create ip.xml:$!";
	print XML $xml_string;
    print "write  result to $ENV{'PWD'}/$xmlfile\n";
    print "execute end!\n";
 }
 generate_xml();
