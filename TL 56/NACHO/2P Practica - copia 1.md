---
modifiedDate: 2024-11-15T19:58:09-03:00
createdDate: 2024-11-15T14:01:49-03:00
---
## Capa 2 y 3
- Tanda 1: 6 
- Tanda 2: 10 
## Capa 4 y 5
- Tanda 3: 8

# Pregunta 1 (Trama 18)
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
# Pregunta 2 (Trama 1104)
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
# Pregunta 3 (Trama 738)
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

3.7: El campoo que se utiliza es el "Sequence Number" o numero de secuencia. Este vale 0xe238b697.

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