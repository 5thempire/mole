# Mole

Docker container that runs a ssh server, with the purpose to provide a tunnel between the remote and local hosts.

## Setup

1. Add your public key to the *authorized_keys* file.
2. Run on the destination host

```bash
$docker-compose build
$docker-compose up
```
3. Run on the local host

```bash
$ssh -D 9200 -f -C -q -N alpine@<remote_host> -p 9000
```

**-D:** SOCKS tunnel on the specified port number (a number between 1025-65536)

**-f:** Forks the process to the background

**-C:** Compresses the data 

**-q:** Quiet mode

**-N:** No command will be sent once the tunnel is up

4. On the browser configure your **Network Preferences** configure a *Manual Proxy Connection*, *SOCKS Host* with **localhost** and port **9200** (as was configured in step 3).