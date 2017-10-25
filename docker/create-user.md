# Create a User

```sql
-- Benutzer erzeugen
CREATE USER peschm IDENTIFIED BY "password";

-- Passwort ändern
ALTER USER peschm IDENTIFIED BY "HalloWelt123";

-- Connect Berechtigung setzen
GRANT CONNECT TO peschm;

-- Alle Berechtigungen setzen
GRANT ALL PRIVILEGES TO peschm;
```
