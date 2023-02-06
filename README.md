[ldapserver]: https://github.com/wshihadeh/ldap_server
[openldap]: https://github.com/osixia/docker-openldap
[dockerldap]: https://github.com/rroemhild/docker-test-openldap
[futuramawikia]: http://futurama.wikia.com

# LDAP Test Server

A containerised OpenLDAP server pre-populated with data for testing purposes.

It adds `objectSid` and `objectGUID` attributes for an `adPerson` object class in order to test these.

This project is based on the following projects:
* [ldap_server][ldapserver]
* [docker-test-ldap][dockerldap]
* [docker-openldap][openldap]

The server is initialized with the example domain `planetexpress.com` with data from the [Futurama Wiki][futuramawikia].

## Usage

```sh
# Start up via Docker compose
make build up

# Stop, clean purge and restart
make down clean purge build up
```

## Testing

```
# List all Users
ldapsearch -H ldap://localhost:389 -x -b "ou=people,dc=planetexpress,dc=com" -D "cn=admin,dc=planetexpress,dc=com" -w GoodNewsEveryone "(objectClass=inetOrgPerson)"

# Request StartTLS
ldapsearch -H ldap://localhost:389 -Z -x -b "ou=people,dc=planetexpress,dc=com" -D "cn=admin,dc=planetexpress,dc=com" -w GoodNewsEveryone "(objectClass=inetOrgPerson)"

# Enforce StartTLS
ldapsearch -H ldap://localhost:389 -ZZ -x -b "ou=people,dc=planetexpress,dc=com" -D "cn=admin,dc=planetexpress,dc=com" -w GoodNewsEveryone "(objectClass=inetOrgPerson)"

# Enforce StartTLS with self-signed cert
LDAPTLS_REQCERT=never ldapsearch -H ldap://localhost:389 -ZZ -x -b "ou=people,dc=planetexpress,dc=com" -D "cn=admin,dc=planetexpress,dc=com" -w GoodNewsEveryone "(objectClass=inetOrgPerson)"
```

## Exposed ports

* 389 (ldap)
* 8080 (ldap admin in docker compose)

## LDAP structure

### dc=planetexpress,dc=com

| Admin            | Secret           |
| ---------------- | ---------------- |
| cn=admin,dc=planetexpress,dc=com | GoodNewsEveryone |

### ou=people,dc=planetexpress,dc=com

#### cn=Hubert J. Farnsworth,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Hubert J. Farnsworth |
| sn               | Farnsworth |
| description      | Human |
| displayName      | Professor Farnsworth |
| employeeType     | Owner |
| employeeType     | Founder |
| givenName        | Hubert |
| jpegPhoto        | JPEG-Photo (630x507 Pixel, 26780 Bytes) |
| mail             | professor@planetexpress.com |
| mail             | hubert@planetexpress.com |
| ou               | Office Management |
| title            | Professor |
| uid              | professor |
| userPassword     | professor |


### cn=Philip J. Fry,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Philip J. Fry |
| sn               | Fry |
| description      | Human |
| displayName      | Fry |
| employeeType     | Delivery boy |
| givenName        | Philip |
| jpegPhoto        | JPEG-Photo (429x350 Pixel, 22132 Bytes) |
| mail             | fry@planetexpress.com |
| ou               | Delivering Crew |
| uid              | fry |
| userPassword     | fry |


### cn=John A. Zoidberg,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | John A. Zoidberg |
| sn               | Zoidberg |
| description      | Decapodian |
| displayName      | Zoidberg |
| employeeType     | Doctor |
| givenName        | John |
| jpegPhoto        | JPEG-Photo (343x280 Pixel, 26438 Bytes) |
| mail             | zoidberg@planetexpress.com |
| ou               | Staff |
| title            | Ph. D. |
| uid              | zoidberg |
| userPassword     | zoidberg |

### cn=Hermes Conrad,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Hermes Conrad |
| sn               | Conrad |
| description      | Human |
| employeeType     | Bureaucrat |
| employeeType     | Accountant |
| givenName        | Hermes |
| mail             | hermes@planetexpress.com |
| ou               | Office Management |
| uid              | hermes |
| userPassword     | hermes |

### cn=Turanga Leela,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Turanga Leela |
| sn               | Turanga |
| description      | Mutant |
| employeeType     | Captain |
| employeeType     | Pilot |
| givenName        | Leela |
| jpegPhoto        | JPEG-Photo (429x350 Pixel, 26526 Bytes) |
| mail             | leela@planetexpress.com |
| ou               | Delivering Crew |
| uid              | leela |
| userPassword     | leela |

### cn=Bender Bending Rodríguez,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Bender Bending Rodríguez |
| sn               | Rodríguez |
| description      | Robot |
| employeeType     | Ship's Robot |
| givenName        | Bender |
| jpegPhoto        | JPEG-Photo (436x570 Pixel, 26819 Bytes) |
| mail             | bender@planetexpress.com |
| ou               | Delivering Crew |
| uid              | bender |
| userPassword     | bender |

### cn=Amy Wong+sn=Kroker,ou=people,dc=planetexpress,dc=com

Amy has a multi-valued DN

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | inetOrgPerson |
| cn               | Amy Wong |
| sn               | Kroker |
| description      | Human |
| givenName        | Amy |
| mail             | amy@planetexpress.com |
| objectSid        | AQQAAAAAAAUVAAAAwdFKz9WmazDFb3Y8 |
| objectGUID       | 9eLQGLjeDE6kgxMT1ghj+g== |
| ou               | Intern |
| uid              | amy |
| userPassword     | amy |

### cn=admin_staff,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | Group |
| cn               | admin_staff |
| member           | cn=Hubert J. Farnsworth,ou=people,dc=planetexpress,dc=com |
| member           | cn=Hermes Conrad,ou=people,dc=planetexpress,dc=com |

### cn=ship_crew,ou=people,dc=planetexpress,dc=com

| Attribute        | Value            |
| ---------------- | ---------------- |
| objectClass      | Group |
| cn               | ship_crew |
| member           | cn=Turanga Leela,ou=people,dc=planetexpress,dc=com |
| member           | cn=Philip J. Fry,ou=people,dc=planetexpress,dc=com |
| member           | cn=Bender Bending Rodríguez,ou=people,dc=planetexpress,dc=com |
