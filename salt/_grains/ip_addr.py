import socket

def ip_addr():
    return {
        'ip_addr': socket.gethostbyname(socket.getfqdn())
    }
