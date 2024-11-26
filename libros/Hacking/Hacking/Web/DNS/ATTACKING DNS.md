
--------------------
#dns #subdomain #dig #dnsenum

---------------

## Attacking DNS

| **Command**                                         | **Description**                                                       |
| --------------------------------------------------- | --------------------------------------------------------------------- |
| `dig AXFR @ns1.inlanefreight.htb inlanefreight.htb` | Perform an AXFR zone transfer attempt against a specific name server. |
| `subfinder -d inlanefreight.com -v`                 | Brute-forcing subdomains.                                             |
| `host support.inlanefreight.com`                    | DNS lookup for the specified subdomain.                               |

