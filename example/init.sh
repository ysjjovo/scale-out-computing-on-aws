set -x
cdk bootstrap aws://260527533511/ap-east-1 -c base_os=amazonlinux2 -c account_id=260527533511 -c bucket=soca-hk -c ldap_user=linnn -c ldap_password=QWJjIzEyMzQ= -c ssh_keypair=lin -c cluster_name=lin -c cluster_id=soca-lin -c region=ap-east-1 -c client_ip=0.0.0.0/0 -c create_es_service_role=False -c vpc_cidr=10.0.0.0/16

echo -e "[sssd]
domains = default
config_file_version = 2
services = nss, pam
[domain/default]
ad_domain = dev.local
krb5_realm = DEV.LOCAL
realmd_tags = manages-system joined-with-samba 
cache_credentials = True
id_provider = ad
krb5_store_password_if_offline = True
default_shell = /bin/bash
ldap_id_mapping = True
use_fully_qualified_names = False
fallback_homedir = /data/home/%u
access_provider = ad
[nss]
homedir_substring = /data/home
[pam]
[autofs]
[ssh]
[secrets]" > /etc/sssd/sssd.conf