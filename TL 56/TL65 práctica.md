
# Trama 
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


# Resuelto
### Capa 2 y 3
- Tanda 1: 6 
- Tanda 2: 10 
### Capa 4 y 5
- Tanda 3: 8
## Pregunta 1 (Trama 18)
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
## Pregunta 2 (Trama 1104)
En relación con el Nivel 3 (TCP/IP). Trama 1104

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

3.1: El protocolo de Capa 4 encapsulado es TCP, el protocolo de Capa 5 encapsulado es HTTP.

3.2: El campo Hexa donde comienza el segmento es 0x0412. Esto es el comienzo del segmento TCP.

3.3: Esto es una comunicacion orientada a la conexion, dado que TCP establece una conexion entre origen y destino. Esta trama pertenece a la etapa de transferencia, dado que la conexión fue realizada anteriormente. Esto lo se tambien porque no estan presentes los flags SYN o FIN.

3.4: Si, el campo que se usa para el control de flujo es el campo "Window". Su valor en Hexa es 0x8000. Este campo significa la cantidad de bytes restantes que puede enviar el otro extremo, sin esperar una confirmacion. En este caso, le quedan al otro extremo 32.768 (dec) Bytes.

3.5: El campo utilizado para multiplexar el servicio al nivel 5 es el "Puerto Destino", este vale 0x0050

3.6: Esta captura es una PDU Unica. Lo se porque está puesto el flag "Dont Fragment" en 1, por lo tanto, no se puede fragmentar.

3.7: El campo que se utiliza es el "Sequence Number" o numero de secuencia. Este vale 0xe238b697.

3.8: El campo que garantiza esto es el campo "Protocol" de IP, el cual vale 0x06, que significa TCP, este protocolo garantiza una entrega confiable.

3.9: Desde el mas alto al mas bajo:
- HTTP, Capa 5
- TCP, Capa 4
- IP, Capa 3
- Ethernet II, Capa 2

3.10: Desde el mas bajo al mas alto:
- Ethernet II: El encabezado de este protocolo empieza con 0x5254 y mide 14 (dec) Bytes.
- IP: El encabezado comienza con 0x4500 y mide 20 (dec) Bytes.
- TCP: El encabezado comienza con 0x0412 y mide 20 (dec) Bytes.
- HTTP: Comienza con 0x4745 y mide 105 (dec) Bytes.