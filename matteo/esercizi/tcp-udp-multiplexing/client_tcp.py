import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('tcpbin.com', 4242))

s.sendall(b'Matteo Rossi\n')

risposta = s.recv(1024)
print("Echo ricevuto:", risposta.decode())

ip_locale, porta_locale = s.getsockname()
print(f"Porta locale usata: {porta_locale}")
s.close()
