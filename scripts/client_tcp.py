import socket
from threading import Thread

def socket_threading(name):

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('tcpbin.com', 4242))
    s.sendall(f'{name}\n'.encode())
    risposta = s.recv(1024)
    print("Echo ricevuto:", risposta.decode())

    porta_locale = s.getsockname()
    print(f"Porta locale usata: {porta_locale}")
    s.close()

thread_list = []
tutti_i_nomi = ['Thread-A', 'Thread-B', 'Thread-C']

for ogni_nome in tutti_i_nomi:
    t = Thread(target=socket_threading, args=(ogni_nome,))
    thread_list.append(t)

for t in thread_list:
    t.start()

for t in thread_list:
    t.join()
