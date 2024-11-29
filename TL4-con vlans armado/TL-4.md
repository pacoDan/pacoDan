#### 1)  Configuración de IKE. 
“Internet Key Exchange” es un protocolo que define el método de intercambio de claves sobre IP en una primera fase de negociación segura. Está formado por una cabecera de autenticación (AH) o una cabecera de autenticación más cifrado (Encapsulating Security Payload o ESP).
```
conf t
crypto isakmp policy 10
encr AES
authentication pre-share
group 5 (Diffie-Hellman grupo 5 – clave de 1536 bits)
lifetime 900 (tiempo de vida en segundos)
exit
```
Notas técnicas:
```ads
•  crypto isakmp policy 10: este comando crea la política ISAKMP número 10. Puede crear varias políticas,  por  ejemplo  7,  8,  9  con  una  configuración  diferente. Los  routers  que  participan  en  la negociación de la Fase 1 buscan la coincidencia de políticas ISAKMP con la lista de políticas una por una. Si alguna política coincide, la negociación de IPSec pasa a la Fase 2.
•  encr AES: se utilizará el algoritmo AES para la fase 1.
•  authentication pre-share: el método de autenticación es una clave pre-compartida.
•  group 5: el grupo Diffie-Hellman que se utilizará es el 5 (grupo de 1536 bits).
Los grupos Diffie-Hellman (DH) determinan la fuerza de la clave usada en el proceso de intercambio de claves. Los miembros de grupos más altos (DF 14, 15, 19 y 20)son más seguros, pero se necesita más tiempo para computar la clave. Ambos puntos en un intercambio de VPN deben usar el mismo grupo DH, que es negociado durante la Fase 1 del proceso de negociación de IPSec. Es ahí donde los dos puntos forman un canal seguro y autenticado que pueden usar para comunicarse.
•  lifetime 900: tiempo de vida en segundos.
```

##### Definición de una clave simétrica con el otro extremo del túnel:
```
crypto isakmp key cisco address 10.2.0.2
```
(La contraseña de la fase 1 es “cisco” y la dirección IP remota es 10.2.0.2)

#### 2)  Configuración de IPSec modo túnel
```
crypto ipsec transform-set 50 ah-sha-hmac esp-3des
```

(Para listar las otras opciones de autenticación y encriptación utilice el comando crypto ipsec transform-set 50 ?)


---
despues de conectarlas
para armar el árbol de expansión, en el router DISTRIBUCION
```
spanning-tree vlan 1,10,20 root primary
```



**en Router1**, se configuran todas las ip de las vlan1, 10 y 20
para que funcione las sub interfaces, no se configuro ninguna ip a la subinterfaz 0/0
```
interface fastEthernet 0/0
no shutdown
exit
```

##### encapsular la vlan con 8021Q, en este caso e la vlan1 pero así con las demás vlans en la interfaz Fa0/0  -> En Router1... para asociarlo con la vlan 1
###### configuración de la primera sub-interfaz, desde (config)
```
interface fastEthernet0/0.1
encapsulation dot1Q 1
ip address 10.50.0.1 255.255.0.0
exit
```

en `ip address` recibe *default gateway* y *mascara de subred*
###### configuración de la segunda sub-interfaz, la de vlan 10, desde (config)
```
interface fastEthernet0/0.10
encapsulation dot1Q 10
ip address 10.10.0.1 255.255.0.0
exit
```
###### configuración de la tercera sub-interfaz, la de vlan 20, desde (config)
```
interface fastEthernet0/0.20
encapsulation dot1Q 20
ip address 10.20.0.1 255.255.0.0
exit
```

ahora con show ip route se ven las interfaces configuradas


-> hasta ahora aca todas las maquinas con distintas vlans se pingean

ahora configuro las interfaces serial, desde (config)

en Router 1
```
interface serial 0/0/1
ip address 10.1.0.1 255.255.255.0
no shutdown
exit
```

después probar hacer show ip route 

en Router1, para configurar el default rouer con el default gateway
una ruta estatica
```
ip route 0.0.0.0 0.0.0.0 10.1.0.2 
```
```
ip route 0.0.0.0 0.0.0.0 10.1.0.1
exit
```



el objetivo de sumarizar redes es achicar la tabla de ruteo


en Router2 para ver la configuracion si tiene eigrp 1

se hace  en enable
```
show run
```


en Router1
al hacer show ip route (en modo enable) ver el eigrp,
ahora en modo config
```
router eigrp 1
network 10.0.0.0
exit
```




----
para ver como esta armado el túnel
primero  en Router2

hacer  ```show run```
luego de copiar su contenido, se parece a esto y copiarlo/comparar
```
Router2#show run

Building configuration...

Current configuration : 1331 bytes

!

version 12.4

no service timestamps log datetime msec

no service timestamps debug datetime msec

no service password-encryption

!

hostname Router2

!

!

!

!

!

!

!

!

no ip cef

no ipv6 cef

!

!

!

!

crypto isakmp policy 10

encr aes

authentication pre-share

group 5

lifetime 900

!

crypto isakmp key cisco address 10.1.0.1

!

!

!

crypto ipsec transform-set 50 ah-sha-hmac esp-3des

!

crypto map mymap 10 ipsec-isakmp

set peer 10.1.0.1

set security-association lifetime seconds 1800

set transform-set 50

match address 101

!

!

!

!

ip ssh version 1

!

!

spanning-tree mode pvst

!

!

!

!

!

!

interface FastEthernet0/0

ip address 10.4.0.1 255.255.255.0

duplex auto

speed auto

!

interface FastEthernet0/1

ip address 10.3.0.1 255.255.255.0

duplex auto

speed auto

!

interface Serial0/0/0

ip address 10.2.0.2 255.255.255.0

crypto map mymap

!

interface Serial0/0/1

no ip address

clock rate 2000000

shutdown

!

interface Serial0/1/0

no ip address

clock rate 2000000

shutdown

!

interface Serial0/1/1

no ip address

clock rate 2000000

shutdown

!

interface Vlan1

no ip address

shutdown

!

router eigrp 1

network 10.0.0.0

auto-summary

!

ip classless

!

ip flow-export version 9

!

!

access-list 101 permit ip 10.4.0.0 0.0.0.255 10.10.0.0 0.0.255.255

!

no cdp run

!

!

!

!

!

!

line con 0

!

line aux 0

!

line vty 0 4

login

!

!

!

end
```




 en  Router 1, modo (conf t)
```
conf t
crypto isakmp policy 10
encr AES
authentication pre-share
group 5 
lifetime 900
exit
crypto isakmp key cisco address 10.2.0.2
crypto ipsec transform-set 50 ah-sha-hmac esp-3des
crypto map mymap 10 ipsec-isakmp
set peer 10.2.0.2
set transform-set 50
match address 101
exit
interface Serial0/0/1
crypto map mymap
exit
access-list 101 permit ip  10.10.0.0 0.0.255.255 10.4.0.0 0.0.0.255
```


en el Router1 para una lista de control de accesos (modo config)
la lista de control de accesos la 102 que tiene que permitir el trafico de la red 10.20 a la red 10.3, tiene que ser una interfaz de entrada, por que entra el trafico al router
```
access-list 102 permit ip 10.20.0.0 0.0.255.255 10.3.0.0 0.0.2.255
interface fastEthernet 0/0.20
ip access-group 102 in
exit
```
de esta forma lo que no esta permitido, va estar denegado, no va a tener otro trafico


 quedaría mas o menos parecido asi:
 ![[TL 4 Pasted image 20241122132245.png]]
