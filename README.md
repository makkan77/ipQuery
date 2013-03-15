ipQuery
=======

ipQuery.sh
Notification of updated of external IP
For my DSL line I get a dynamic IP address. On the inside it's quite easy to
find out what the external IP is, but on the outside damn near impossible to
find out what the IP might have changed to.
To get around that problem I wrote a little script that checks the
external IP and sends me an e-mail if there has been any changes.

Dependencies: curl, html2text and ssmtp



