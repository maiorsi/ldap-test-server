FROM osixia/openldap

ENV LDAP_ORGANISATION='Planet Express, Inc.'
ENV LDAP_DOMAIN=planetexpress.com
ENV LDAP_BASE_DN=dc=planetexpress,dc=com
ENV LDAP_ADMIN_PASSWORD=GoodNewsEveryone
ENV LDAP_CONFIG_PASSWORD=config

# Admin user
ENV LDAP_ADMIN_DN='cn=admin,dc=planetexpress,dc=com'

ADD bootstrap /container/service/slapd/assets/config/bootstrap