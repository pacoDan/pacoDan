# TL4-con vlans armado

despues de conectarlas
##### encapsular la vlan con 8021Q, en este caso e la vlan1 pero así con las demás vlans en la interfaz Fa0/0  -> En Router1... para asociarlo con la vlan 1
en `ip address` recibe *default gateway* y *mascara de subred*

en Router1 hacer esto:
###### ==configuración de la segunda sub-interfaz, la de vlan 10, desde (config)==
```
interface fastEthernet0/0.10
encapsulation dot1Q 10
ip address 10.10.0.254 255.255.255.0
exit
```
###### ==configuración de la tercera sub-interfaz, la de vlan 20, desde (config)==
```
interface fastEthernet0/0.20
encapsulation dot1Q 20
ip address 10.20.0.254 255.255.255.0
exit
```
###### configuración de la primera sub-interfaz, desde (config)
```
interface fastEthernet0/0.1
encapsulation dot1Q 1
ip address 10.10.0.254 255.255.255.0
exit
```

==*en Router1*, se configuran todas las ip de las vlan1, 10 y 20==
==para que funcione las sub interfaces, no se configuro ninguna ip a la subinterfaz 0/0==
```
interface fastEthernet 0/0
no shutdown
exit
```

despues al hacer `do sh run` config debe aparecer esto:
![[Pasted image 20241128122906.png]]

==ahora se deben configurar las seriales==
==para empezar se debe poner ip estas seriales, como es una interfaz serial , ppp es un protocolo que sirve para enlaces seriales, es un protocolo de capa 2== 

```
int s0/0/1
ip add 10.1.0.1 255.255.255.0
encapsulation ppp
no shutdown
exit
```
==en ISP como ya tenia ip asignada, faltaba encapsular por ppp==
```
int s0/0/1
encapsulation ppp
exit
```
ahora el protocolo de enrutamiento EIGRP

==en Router 1 (modo config), para poder compartir los paquetitos de *eigrp* a los otros ruoters del mismo sistema autónomo y cada uno va armando la tabla de ruteo==
```
router eigrp 1
network 10.1.0.0
network 10.10.0.0
network 10.20.0.0
network 10.50.0.0
exit
```
`do show run` para ver la tabla de ruteo
==debería de verse asi: con== `do show ip route`
![[Pasted image 20241128134231.png]]
ahora
ahora teniendo el notepad a mano llenar con el siguiente contenido:
con `do show run`  (en Router 2  para Router 1 en modo config)
```
crypto isakmp policy 10
encr aes
authentication pre-share
group 5
lifetime 900
```
debe parecerse a esto ambos routers (Router 1 en la izquierda y Router 2 de la derecha)
![[Pasted image 20241128142418.png]]
puse .2 por que este Router1 debe apuntar al Router2 (este código en Router1)
```
crypto isakmp key cisco address 10.2.0.2
```
notar que en el peer le cambie a 10.2.0.2 por que es la dirección del otro router (Router2)
En Router1 (en modo config):
```
crypto ipsec transform-set 50 ah-sha-hmac esp-3des
crypto map mymap 10 ipsec-isakmp
set peer 10.2.0.2
set security-association lifetime seconds 1800
set transform-set 50
match address 101
```
el 50 es el nombre del *transform-set*
el 101 es el ACL, el access list
	ACL Standard: son de 1  a 99  -> hay origen 
	ACL Extendida: es de 100 a 199 -> hay origen y destino
10.4.0.0 es la IP del Server0
.255 es por el /24
por default aparece esto (en Router2) , como si la PC1 seria de /16 y no /24
*access-list 101 permit ip 10.4.0.0 0.0.0.255 10.10.0.0 0.0.255.255*
en Router2 poner esto
```
no access-list 101
access-list 101 permit ip 10.4.0.0 0.0.0.255 10.10.0.0 0.0.0.255

```

y en Router1
```
no access-list 101
access-list 101 permit ip 10.10.0.0 0.0.0.255 10.4.0.0 0.0.0.255
crypto map mymap
```
luego asignar el mapa criptográfico a la WAN sino no sirve para nada ()
en Router1:
```
int s0/0/1
crypto map mymap
exit
```

luego ver siempre que quede en forma de espejo todo configurado:
![[Pasted image 20241128163433.png]]

para armar el árbol de expansión, en el router DISTRIBUCION
```
spanning-tree vlan 1,10,20 root primary
```

ahora con show ip route se ven las interfaces configuradas

revision de tracert de **PC2** a **Server-0**
![[Pasted image 20241128164242.png]]

ahora de PC1 a Server (**DEBERIA DE HABER UN SALTO MENOS, DE Router1 a Router2 DIRECTAMENTE**)

![[Pasted image 20241128151043.png]]
Ahora de PC1 al otro servidor , hay un salto mas por que en la access list entra a las 10.4.X.X y no va pasar por el túnel
==en el Router1:==
```
access-list 101 permit ip 10.10.0.0 0.0.0.255 10.3.0.0 0.0.0.255
```
==en el Router2:==
```
access-list 101 permit ip 10.3.0.0 0.0.0.255 10.10.0.0 0.0.0.255
```

![[Pasted image 20241128170445.png]]
y darla vuelta también 
![[Pasted image 20241128170640.png]]
quedaría asi:
![[Pasted image 20241128172227.png]]



![[Pasted image 20241128153814.png]]

