
## Pregunta 1 (Trama 18)
```
0000   ff ff ff ff ff ff 00 07 0d af f4 54 08 06 00 01   ...........T....
0010   08 00 06 04 00 01 00 07 0d af f4 54 45 4c d8 01   ...........TEL..
0020   00 00 00 00 00 00 45 4c d9 ba 02 01 04 00 00 00   ......EL........
0030   00 02 01 00 03 02 00 00 05 01 03 01               ............
```
En relación con el Nivel 2 (TCP/IP). Trama 18

1.1 ¿Es una trama de comunicación unicast, multicast o broadcast? ¿Qué valor tiene el campo que verifica la respuesta anterior?
1.2 ¿Es una trama correspondiente a una VLAN de negocios? ¿Qué valor o característica del encabezado verifican su respuesta?
1.3 ¿Qué valor tiene el grupo HEXA que indica el inicio de los datos de la trama? ¿Cuál es la longitud del campo de datos?
1.4 ¿Este campo de datos será del mismo tamaño en otra trama que tenga los mismos hosts origen y destino? ¿Qué longitud deberá tener?
1.5 ¿La trama encapsula el protocolo 802.2? Justifique.
1.6 ¿Cuál es la IP que no se conoce la MAC?
1.7 ¿Qué valor HEXA indica el protocolo de nivel 3 (TCP/IP) encapsulado en la trama?
1.8 ¿Cuál es el protocolo encapsulado en la trama?

RTA.:
1.1)

Es una trama de broadcast, el campo que verifica esto son los primeros 6 bytes de Ethernet II que es la direccion destino con valor todos unos

1.2)

no es una trama de una vlan alguna,

por que el campo type de Ethernet II

es 0806 que es de protocolo ARP que no es 8021Q

1.3)

 El hexa es 0001, el campo datos mide 28 bytes

1.4)

Si, será del mismo tamaño ya que en ARP mide lo mismo

1.5)

No encapsula, por que no se observa capa LLC

1.6)

la IP que no conoce la MAC es 69.76.217.168

1.7)

0806 es el valor de Type

1.8)
ARP
## Pregunta 2 (Trama 1104)
En relación con el Nivel 3 (TCP/IP). Trama 1104
```
0000   02 10 18 8a 32 c4 e4 f8 9c b4 6c 39 08 00 45 00   ....2.....l9..E.
0010   00 5c e8 0a 00 00 04 01 01 f8 c0 a8 00 d6 68 5e   .\............h^
0020   a2 c2 08 00 f7 71 00 01 00 8d 00 00 00 00 00 00   .....q..........
0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0040   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0050   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
0060   00 00 00 00 00 00 00 00 00 00                     ..........
```
2.1 ¿Esta captura representa una PDU única, un fragmento intermedio o el último fragmento?, en cualquier caso ¿Qué valor tiene el grupo HEXA del campo que identifica el paquete?
2.2 ¿Cuál es la dirección de la HOST destino (Nivel IP) a la cual se encamina este paquete?
2.3 ¿Qué valor tiene la dirección del HOST origen(Nivel IP)desde donde proviene el paquete?
2.4 ¿En algún campo del encabezado y con qué valor HEXA se indica que es un paquete que ofrece un servicio confiable?
2.5 ¿Qué valor HEXA del encabezado IP indica que el protocolo brinda un servicio de entrega ordenada?
2.6 ¿Qué valor HEXA del encabezado IP indica que el fragmento podrá ser reensamblado por el HOST destino, en la posición correcta dentro de la PDU en caso de ser necesario?

2.1)

Unica porque el flag 

"More fragments" está en 0, y se que no es el último fragmento de algo fragmentado, dado que el flag 

"Fragment Offset" también es 0. Esto indica inequivocamente que se trata de una PDU unica. El campo que identifica el paquete vale E80A  es el campo "Identification".

2.2) 

104.94.162.194

2.3) 

192.168.0.214

2.4)

El campo "Protocol" de IP. En este caso vale 01, que es ICMP. Este no es un servicio confiable, ya que el protocolo ICMP no lo es. (en el wireshark dice ICMP tambien)

2.5) 

Dado el protocolo el punto anterior, el Protocol de IP. ICMP no brinda un servicio de entrega ordenada.

2.6) 

El hexa es 0, que es el Fragment Offset que indica que permite reemsamblar en la posicion correcta, permite ubicar al fragmento en la posicion correcta.
## Pregunta 3 (Trama 738)
```
0000   52 54 00 12 35 02 08 00 27 63 cf 53 08 00 45 00   RT..5...'c.S..E.
0010   00 91 00 89 40 00 80 06 da 85 0a 00 02 0f b0 20   ....@.......... 
0020   63 29 04 12 00 50 e2 38 b6 97 00 19 64 02 50 18   c)...P.8....d.P.
0030   80 00 89 3d 00 00 47 45 54 20 2f 7a 65 72 6f 2e   ...=..GET /zero.
0040   68 74 6d 6c 20 48 54 54 50 2f 31 2e 31 0d 0a 55   html HTTP/1.1..U
0050   73 65 72 2d 41 67 65 6e 74 3a 20 51 75 73 74 6f   ser-Agent: Qusto
0060   64 69 6f 41 67 65 6e 74 2f 32 2e 30 0d 0a 48 6f   dioAgent/2.0..Ho
0070   73 74 3a 20 73 74 61 74 69 63 2d 6d 6f 62 69 6c   st: static-mobil
0080   65 2e 71 75 73 74 6f 64 69 6f 2e 63 6f 6d 0d 0a   e.qustodio.com..
0090   41 63 63 65 70 74 3a 20 2a 2f 2a 0d 0a 0d 0a      Accept: */*....
```
En relación con los Niveles 4 y 5 (TCP/IP). Trama 738

3.1 ¿Qué protocolos de nivel 4 y 5 (TCP/IP) se encapsularon en el paquete?
3.2 Indique el valor del grupo HEXA que indica el comienzo del segmento.
3.3 ¿La captura indica una comunicación orientada a la conexión? ¿A qué etapa pertenece la captura (establecimiento, transferencia o cierre)?
3.4 ¿La PDU de capa 4 tiene algún campo en su encabezado que se usa para el control de flujo?, ¿indique valor HEXA y el significado que corresponda al campo utilizado para regular el flujo?
3.5 ¿Qué valor HEXA tiene el campo del encabezado en el sistema origen para multiplexar el servicio dado al nivel 5?
3.6 ¿Esta captura representa una PDU única, un fragmento intermedio o el último fragmento?
3.7 En este caso ¿Qué campo se utiliza para identificar este fragmento?
3.8 ¿Qué valor HEXA tiene el campo que garantiza la provisión de una entrega confiable con el destino?
3.9 Indique la secuencia de encapsulamiento desde el más alto nivel al inferior, dando el nombre de cada protocolo.
3.10 ¿Qué valor HEXA da inicio al encabezado y cuál es la longitud particular de cada uno en su nivel, de todos los protocolos encapsulados?

RTA.:
3.1) 

TCP nivel 4 y HTTP nivel 5

3.2) 

El hexa es 0412. Que es el comienzo del segmento TCP.

3.3) 

TCP ya es orientado a la conexion. Esta trama pertenece a la etapa de transferencia, dado que la conexión fue realizada anteriormente. Esto lo se tambien porque no estan presentes los flags SYN o FIN (en el wireshark estan con valor 0 y  "Not Set").

3.4) 

El campo  es "Window". que se usa para control de flujo. Su valor en hexa es 8000. Este campo significa la cantidad de bytes restantes que puede enviar el otro extremo.En este caso, le quedan al otro extremo 32768 Bytes este valor lo pase de 8000 en hexadecimal a decimal (calculada por wireshark).

3.5)

En hexa es 0050. Es el campo utilizado para multiplexar el servicio al nivel 5 es el "Puerto Destino".

3.6)

Esta captura es una PDU Unica. En el wireshark está puesto el flag "Dont Fragment" en 1, por lo tanto, no se puede fragmentar.

3.7)

El campo es el "Sequence Number" o numero de secuencia. Este vale en hexa E238B697.

3.8)

Es el campo "Protocol" de IP, el cual vale 06, que significa TCP que este protocolo garantiza una entrega confiable.

3.9)

Desde el mas alto al mas bajo:

- HTTP, NIVEL 5

- TCP, NIVEL 4

- IP, NIVEL 3

- Ethernet II, NIVEL 2

3.10)

Desde el mas bajo al mas alto:

- Ethernet II: El encabezado de este protocolo empieza con hexa 0800 y mide 14 Bytes (en decimal) el Ethernet II.

- IP: El encabezado comienza con hexa 4500 y longitud es 20 Bytes.

- TCP: El encabezado comienza con hexa 0412 y longitud es 20 Bytes en decimal.

- HTTP: Comienza con hexa 474554 y longitud es 105 Bytes en decimal.