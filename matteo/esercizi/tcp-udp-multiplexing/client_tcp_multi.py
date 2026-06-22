import threading
import socket

def f_Matteo():
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.connect(('tcpbin.com', 4242))

	s.sendall(b'Matteo\n')

	risposta = s.recv(1024)
	print("Echo ricevuto:", risposta.decode())

	ip_locale, porta_locale = s.getsockname()
	print(f"Porta locale usata: {porta_locale}")
	s.close()

def f_Marco():
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.connect(('tcpbin.com', 4242))

	s.sendall(b'Marco\n')

	risposta = s.recv(1024)
	print("Echo ricevuto:", risposta.decode())

	ip_locale, porta_locale = s.getsockname()
	print(f"Porta locale usata: {porta_locale}")
	s.close()

def f_Luca():
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.connect(('tcpbin.com', 4242))

	s.sendall(b'Luca\n')

	risposta = s.recv(1024)
	print("Echo ricevuto:", risposta.decode())

	ip_locale, porta_locale =  s.getsockname()
	print(f"Porta locale usata {porta_locale}")
	s.close

thread1 = threading.Thread(target=f_Matteo)
thread2 = threading.Thread(target=f_Marco)
thread3 = threading.Thread(target=f_Luca)

thread1.start()
thread2.start()
thread3.start()

thread1.join()
thread2.join()
thread3.join()

