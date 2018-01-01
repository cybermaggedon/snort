
FROM fedora:27
ARG INTERFACE=eth0

COPY snort.rpm /
RUN dnf update -y && \
  dnf install -y procps-ng hostname && \
  dnf install -y net-tools && \
  dnf install -y snort.rpm && \
  rm -f /snort.rpm && dnf clean all && \
  mkdir /usr/local/lib/snort_dynamicrules

WORKDIR /etc/snort/rules
RUN touch local.rules app-detect.rules attack-responses.rules \
    backdoor.rules bad-traffic.rules blacklist.rules \
    botnet-cnc.rules \
    browser-chrome.rules \
    browser-firefox.rules \
    browser-ie.rules \
    browser-other.rules \
    browser-plugins.rules \
    browser-webkit.rules \
    chat.rules \
    content-replace.rules \
    ddos.rules \
    dns.rules \
    dos.rules \
    experimental.rules \
    exploit-kit.rules \
    exploit.rules \
    file-executable.rules \
    file-flash.rules \
    file-identify.rules \
    file-image.rules \
    file-multimedia.rules \
    file-office.rules \
    file-other.rules \
    file-pdf.rules \
    finger.rules \
    ftp.rules \
    icmp-info.rules \
    icmp.rules \
    imap.rules \
    indicator-compromise.rules \
    indicator-obfuscation.rules \
    indicator-shellcode.rules \
    info.rules \
    malware-backdoor.rules \
    malware-cnc.rules \
    malware-other.rules \
    malware-tools.rules \
    misc.rules \
    multimedia.rules \
    mysql.rules \
    netbios.rules \
    nntp.rules \
    oracle.rules \
    os-linux.rules \
    os-other.rules \
    os-solaris.rules \
    os-windows.rules \
    other-ids.rules \
    p2p.rules \
    phishing-spam.rules \
    policy-multimedia.rules \
    policy-other.rules \
    policy.rules \
    policy-social.rules \
    policy-spam.rules \
    pop2.rules \
    pop3.rules \
    protocol-finger.rules \
    protocol-ftp.rules \
    protocol-icmp.rules \
    protocol-imap.rules \
    protocol-pop.rules \
    protocol-services.rules \
    protocol-voip.rules \
    pua-adware.rules \
    pua-other.rules \
    pua-p2p.rules \
    pua-toolbars.rules \
    rpc.rules \
    rservices.rules \
    scada.rules \
    scan.rules \
    server-apache.rules \
    server-iis.rules \
    server-mail.rules \
    server-mssql.rules \
    server-mysql.rules \
    server-oracle.rules \
    server-other.rules \
    server-webapp.rules \
    shellcode.rules \
    smtp.rules \
    snmp.rules \
    specific-threats.rules \
    spyware-put.rules \
    sql.rules \
    telnet.rules \
    tftp.rules \
    virus.rules \
    voip.rules \
    web-activex.rules \
    web-attacks.rules \
    web-cgi.rules \
    web-client.rules \
    web-coldfusion.rules \
    web-frontpage.rules \
    web-iis.rules \
    web-misc.rules \
    web-php.rules \
    white_list.rules \
    black_list.rules \
    x11.rules

# Fix bug in config file.
RUN sed -i 's-\.\./rules-/etc/snort/rules-' /etc/snort/snort.conf

WORKDIR /etc/snort/rules

CMD snort -i ${INTERFACE} -A unsock -N -l /var/log/snort/ -c /etc/snort/snort.conf
    
