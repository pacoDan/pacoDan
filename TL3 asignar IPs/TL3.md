### una red /24 un router esta conectado a un /30 desde su serial
asignar  IP a una interfaz a un Router, desde config (escribiendo esto en router Local1)
192.168.2.1 es la ip del host Admin-PT (un host) y como la red es /24 puse la mascara 255.255.255.0
el host de esta red tiene IP 192.168.2.200 mascara /24 y default gateway 192.168.2.1
```
interface fastEthernet 0/0
ip address 192.168.1.1 255.255.255.0
no shutdown
exit
```
en serial 0/1/0 (en otra red o subred, y escribiendo esto en el router)
192.168.1.133 es la ip en serial en la red /30, por eso tiene mascara 255.255.255.252
```
interface serial 0/1/0
ip address 192.168.1.133 255.255.255.252
no shutdown 
clock rate 20000000
exit
```
 el clock rate debe tenerlo almenos un router


para ver la config  en modo enabled se hace `show ip route`

