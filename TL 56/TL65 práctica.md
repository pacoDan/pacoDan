
# Trama 222

03.pcapng
trama 222
```
0000   90 f8 91 67 b5 db 20 6a 8a 3d 26 b4 08 00 45 00   ...g.. j.=&...E.
0010   00 28 cc 14 40 00 80 06 cd 64 c0 a8 00 15 34 6d   .(..@....d....4m
0020   6c 2c fe f2 01 bb e6 70 e1 7b 3f 37 06 be 50 10   l,.....p.{?7..P.
0030   04 00 3b ee 00 00                                 ..;...
```

- 0000 16 primeros bytes offset 0-15 : `90 f8 91 67 b5 db 20 6a 8a 3d 26 b4 08 00 45 00`
- 0001 16 siguientes bytes offset 16-31: `00 28 cc 14 40 00 80 06 cd 64 c0 a8 00 15 34 6d`
- 0002 16 siguientes bytes offset 32-47: `6c 2c fe f2 01 bb e6 70 e1 7b 3f 37 06 be 50 10`
- 0003 16 siguientes bytes offset 48-63: `04 00 3b ee 00 00                             `  

El 45 00 en la primera línea indica el encabezado IPv4 y el 06 en la segunda línea indica el protocolo TCP. El resto de los datos del paquete probablemente sean el encabezado y la carga útil TCP.
1. **`45`**:
    - El primer dígito (`4`) indica que se trata de un paquete IPv4.
    - El segundo dígito (`5`) indica la longitud del encabezado en términos de palabras de 32 bits. En este caso, `5` significa que el encabezado tiene 5 palabras de 32 bits, lo que equivale a 20 bytes. Esto es el tamaño mínimo de un encabezado IPv4 sin opciones.
2. **`00`**:
    - Este byte se refiere a la versión y el tamaño del encabezado, pero el segundo byte (`00`) es parte del campo de "Tipo de Servicio" (ToS) en el encabezado IPv4.
- **`0800`**: Este valor se encuentra más adelante en el paquete y es el campo de tipo de protocolo en el encabezado Ethernet. Específicamente, `0800` indica que el protocolo de la capa superior es IPv4. En otras palabras, este valor se utiliza en el encabezado Ethernet para indicar que el contenido del paquete es un paquete IPv4. Indica que el protocolo de la capa superior es IPv4 en el contexto del encabezado Ethernet.
## Pregunta 1 (Trama 222)
En relación con el Nivel 2 (TCP/IP). Trama 222 del 03.pcapng
`0000   90 f8 91 67 b5 db 20 6a 8a 3d 26 b4 08 00 45 00   ...g.. j.=&...E.`
`0010   00 28 cc 14 40 00 80 06 cd 64 c0 a8 00 15 34 6d   .(..@....d....4m`
`0020   6c 2c fe f2 01 bb e6 70 e1 7b 3f 37 06 be 50 10   l,.....p.{?7..P.`
`0030   04 00 3b ee 00 00                                 ..;...`
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
Es una trama unicast por  que MAC destino es 20 6a 8a 3d 26 b4 por que no es una broadcast todos con valor de bits igual 1, y tampoco multicast por que el primer byte tiene numero par 
1.2)
En la trama no tiene un campo de VLAN, para eso debe existir en el encabezado Ethernet  un campo de etiqueta VLAN 8021Q, que indica el ID de la VLAN y su prioridad
1.3)  ==medio medio==
El valor HEXA es 45 00   00 28 cc 14 40 00 80 06 cd 64 c0 a8 00 15 34 6d   6c 2c
Comienza con 45 (que es el encabezado) por que esta justo despues del encabezado Ethernet y el encabezado IPv4
y la longitud 20 por que el encabezado
1.4)  ==ver de TL 5==
1.5) 
El campo EtherType vale 0800 indica que el protocolo encapsulado es IPv4, es decir usa el  protocolo IP directamente y no esta usando el 802.2
1.6) ==VER CUANDO IP NO CONOCE SU MAC==
Se refiere a que el dispositivo que tiene esa dirección IP y que no ha respondido una solicitud ARP para proporcionar su dirección MAC
Entonces se esta refiriendo a la dirección de destino  (en hexadecimal) ya que tenemos su IP pero no su MAC, la MAC esta en la dirección origen
1.7)
el valor  0800 indica que el protocolo de capa superior es IPv4
1.8)==ok==
es TCP, además de que lo dice el wireshark, en el encabezado TCP esta el campo 06 que indica que el protocolo de nivel 4 es TCP. (justo despues del TTL que vale 80 en hexa)

## Pregunta 2 (Trama 222)
En relación con el Nivel 3 (TCP/IP). Trama 222

2.1 ¿Esta captura representa una PDU única, un fragmento intermedio o el último fragmento?, en cualquier caso ¿Qué valor tiene el grupo HEXA del campo que identifica el paquete?
2.2 ¿Cuál es la dirección de la HOST destino (Nivel IP) a la cual se encamina este paquete?
2.3 ¿Qué valor tiene la dirección del HOST origen(Nivel IP)desde donde proviene el paquete?
2.4 ¿En algún campo del encabezado y con qué valor HEXA se indica que es un paquete que ofrece un servicio confiable?
2.5 ¿Qué valor HEXA del encabezado IP indica que el protocolo brinda un servicio de entrega ordenada?
2.6 ¿Qué valor HEXA del encabezado IP indica que el fragmento podrá ser reensamblado por el HOST destino, en la posición correcta dentro de la PDU en caso de ser necesario?

RTA.:
2.1)
El campo Identification vale:  CC14
que significa que 
2.2)
ip destino es (en hexa es) 34 6d 6c 2c
y en formato ipv4 es: 52.109.108.44
2.3) OK

2.4) ==Como me doy cuenta si es un servicio confiable ??==
TCP es confiable (a diferencia de por ejemplo UDP)
que aparece en el wireshark, pero igual aparece el campo Protocol que es 06
2.5)  ==VER COMO TCP hace una entrega ordenada==
HEXa es 06
2.6)
es valor HEXA es CC14 que indica el campo Identification del encabezado  IPv4 que sea usado para identificar fragmentos del un mismo paquete y ayudara a hacer el reensamblaje en el destino.

## Pregunta 3 (Trama 222)
En relación con los Niveles 4 y 5 (TCP/IP). Trama 222

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
Nivel 4: TCP (Protocolo 06 en el encabezado IPv4)
Nivel 5: No hay un protocolo específico de nivel 5 en esta trama, ya que el nivel 5 se refiere a protocolos de sesión como TLS/SSL, que no están presentes en esta captura.
3.2)
El comienzo del segmento TCP se indica con el valor 50 en el campo de Longitud de encabezado y flags del encabezado TCP. Esto indica que el encabezado TCP tiene una longitud de 20 bytes (5 * 4).
3.3)
hay un ACK un numero de secuencia, lo cual es mas probable que sea de transferencia que establecimiento y cierre, además TCP ya es orientada a la conexión.
3.4)
hay el campo Window con valor 0400 en HEXA, la cual el tamaño de ventana  de recepción se usa para  establecer la cantidad de datos  que el receptor esta dispuesto a aceptar
3.5) 
~~Esta captura representa una PDU única, ya que no hay indicios de fragmentación en el encabezado IPv4.~~
El valor HEXA que se utiliza para multiplexar el servicio en el sistema origen es el Puerto de origen, que tiene el valor FEF2 en el encabezado TCP. Este puerto se utiliza para identificar el servicio específico en el nivel 5.
3.6) ==ver por que seria PDU UNICA==
3.7)
El campo que se utiliza para identificar este fragmento es el Identificación en el encabezado IPv4, que tiene el valor cc 14.
3.8)
El valor que garantiza la provisión de una entrega confiable es el ACK (mostrado en el wireshark) en el encabezado TCP, que tiene el valor 3f 37 06 be. Este campo se utiliza para confirmar la recepción de datos.
3.9)
La secuencia de encapsulamiento es la siguiente:
Aplicación (Nivel 5)
Transporte (TCP - Nivel 4)
Internet (IPv4 - Nivel 3)
Enlace de datos (Ethernet - Nivel 2)
3.10)
Ethernet:
	Valor de inicio: 08 00 (Tipo IPv4)
	Longitud: 14 bytes
IPv4:
	Valor de inicio: 45 (Versión y longitud de encabezado)
	Longitud: 20 bytes
TCP:
	Valor de inicio: fe f2 (Puerto de origen)
	Longitud: 20 bytes
La longitud total de la trama es de 54 bytes, que incluye todos los encabezados y los datos.


----
# Trama 18
### Capa 2 y 3
- Tanda 1: 6 
- Tanda 2: 10 
### Capa 4 y 5
- Tanda 3: 8
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

1.1: Es una trama de Broadcast. El campo que verifica esto son los primeros 6 bytes de Ethernet II, que es la direccion destino, cuyo valor es: 0xff:ff:ff:ff:ff:ff

1.2: No es correspondiente a una VLAN. El campo que verifica esto es el Type de Ethernet II (Capa 2), el cual vale 0x0806 que significa ARP, no indica 802.1Q.

1.3: El grupo Hexa que indica el inicio de los datos es 0x0001. El campo de datos mide 28 bytes.

1.4: Si, medirá lo mismo para cualquier host destino y origen, dado que la trama ARP mide siempre lo mismo.

1.5: La trama no encapsula el protocolo 802.2, esto se puede ver dado que no existe la capa LLC.

1.6: La IP que no se conoce la mac es 69.76.217.186

1.7: El campo que indica esto es el Type de Ethernet, en este caso vale 0x0806 

1.8: El protocolo encapsulado (lo se por el campo Type) es ARP.

RTA otro:
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

2.1: Esta captura es una PDU unica. Esto lo sé porque el flag "More fragments" está en 0, y se que no es el último fragmento de algo fragmentado, dado que el flag "Fragment Offset" también es 0. Esto indica inequivocamente que se trata de una PDU unica. El campo que identifica el paquete vale 0xe80a, es el campo "Identification".

2.2: La direccion destino IP es 104.94.162.194

2.3: La direccion origen IP es 192.168.0.214

2.4: El campo que indica si es un servicio confiable o no es el "Protocol" de IP. En este caso vale 0x01, que es ICMP. Este no es un servicio confiable, ya que el protocolo ICMP no lo es.

2.5: Mismo campo que el punto anterior, el Protocol de IP. ICMP tampoco brinda un servicio de entrega ordenada.

2.6: El campo que permite reensamblar en la posicion correcta es el "Fragment Offset" que en este caso vale 0. Esto permite ubicar al fragmento en la posicion correcta, indicando cual es el desplazamiento que se debe tomar sobre el PDU original para reensamblarlo.
## Pregunta 3 (Trama 738)
En relación con los Niveles 4 y 5 (TCP/IP). Trama 738

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

- Ethernet II: El encabezado de este protocolo empieza con hexa 5254 y mide 14 Bytes en decimal .

- IP: El encabezado comienza con hexa 4500 y mide 20 Bytes en decimal.

- TCP: El encabezado comienza con hexa 0412 y mide 20 Bytes en decimal.

- HTTP: Comienza con hexa 4745 y mide 105 Bytes en decimal.