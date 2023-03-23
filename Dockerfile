FROM osixia/openldap

ENV LDAP_ORGANISATION='Planet Express, Inc.'
ENV LDAP_DOMAIN=planetexpress.com
ENV LDAP_BASE_DN=dc=planetexpress,dc=com
ENV LDAP_ADMIN_PASSWORD=GoodNewsEveryone
ENV LDAP_CONFIG_PASSWORD=config

# Tls
ENV LDAP_TLS=true
ENV LDAP_TLS_CRT_FILENAME=cert.crt
ENV LDAP_TLS_KEY_FILENAME=cert.key
ENV LDAP_TLS_DH_PARAM_FILENAME=dhparam.pem
ENV LDAP_TLS_CA_CRT_FILENAME=ca.crt
ENV LDAP_TLS_ENFORCE=false
ENV LDAP_TLS_CIPHER_SUITE=SECURE256:+SECURE128:-VERS-TLS-ALL:+VERS-TLS1.2:-RSA:-DHE-DSS:-CAMELLIA-128-CBC:-CAMELLIA-256-CBC
ENV LDAP_TLS_VERIFY_CLIENT=never

# Admin user
ENV LDAP_ADMIN_DN='cn=admin,dc=planetexpress,dc=com'

ADD bootstrap /container/service/slapd/assets/config/bootstrap
ADD certs /container/service/slapd/assets/certs

HEALTHCHECK CMD ["ldapsearch", "-H", "ldap://127.0.0.1:389", "-D", "${LDAP_ADMIN_DN}", "-w", "${LDAP_ADMIN_PASSWORD}", "-b", "${LDAP_BASE_DN}"]
