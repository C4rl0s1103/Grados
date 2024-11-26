
------------
#pivoting #ecppt 

-------

Hay muchos términos diferentes que se utilizan para describir un host comprometido que podemos usar para un segmento de red previamente inalcanzable. Algunos de los más comunes son:`pivot`

- `Pivot Host`
- `Proxy`
- `Foothold`
- `Beach Head system`
- `Jump Host`


---------------


## Comparación del movimiento lateral, el pivote y la tunelización

#### Movimiento lateral

El movimiento lateral puede describirse como una técnica utilizada para ampliar nuestro acceso a un entorno de red adicional. El movimiento lateral también puede ayudarnos a obtener acceso a recursos de dominio específicos que podemos necesitar para elevar nuestros privilegios. El movimiento lateral a menudo permite la escalada de privilegios entre hosts. Además de la explicación que hemos dado a este concepto, también podemos estudiar cómo otras organizaciones respetadas explican el Movimiento Lateral. Echa un vistazo a estas dos explicaciones cuando el tiempo lo permita:`hosts``applications``services`

Un ejemplo práctico de sería:`Lateral Movement`

Durante una evaluación, obtuvimos acceso inicial al entorno de destino y pudimos obtener el control de la cuenta de administrador local. Realizamos un análisis de red y encontramos tres hosts de Windows más en la red. Intentamos usar las mismas credenciales de administrador local y uno de esos dispositivos compartía la misma cuenta de administrador. Usamos las credenciales para movernos lateralmente a ese otro dispositivo, lo que nos permitió comprometer aún más el dominio.


#### Pivotante

Utilizar varios hosts para cruzar límites a los que normalmente no tendría acceso. Se trata más bien de un objetivo específico. El objetivo aquí es permitirnos profundizar en una red comprometiendo hosts o infraestructura específicos.`network`

Un ejemplo práctico de sería:`Pivoting`

Durante un enfrentamiento complicado, el objetivo tenía su red física y lógicamente separada. Esta separación nos dificultó movernos y completar nuestros objetivos. Tuvimos que buscar en la red y comprometer un host que resultó ser la estación de trabajo de ingeniería utilizada para mantener y monitorear los equipos en el entorno operativo, enviar informes y realizar otras tareas administrativas en el entorno empresarial. Ese host resultó ser de doble conexión (tener más de una NIC física conectada a diferentes redes). Sin que tuviera acceso a las redes empresariales y operativas, no habríamos podido pivotar, ya que necesitábamos completar nuestra evaluación.

#### Tunelización

A menudo nos encontramos utilizando varios protocolos para transportar el tráfico dentro y fuera de una red en la que existe la posibilidad de que nuestro tráfico sea detectado. Por ejemplo, usar HTTP para enmascarar nuestro tráfico de comando y control desde un servidor de nuestra propiedad hasta el host de la víctima. La clave aquí es la ofuscación de nuestras acciones para evitar ser detectados durante el mayor tiempo posible. Utilizamos protocolos con medidas de seguridad mejoradas, como HTTPS sobre TLS o SSH sobre otros protocolos de transporte. Este tipo de acciones también permiten tácticas como la exfiltración de datos fuera de una red objetivo o la entrega de más cargas útiles e instrucciones en la red.

Un ejemplo práctico de sería:`Tunneling`

Una de las formas en que usamos la tunelización fue crear nuestro tráfico para que se ocultara en HTTP y HTTPS. Esta es una forma común en la que mantuvimos el comando y control (C2) de los hosts que habíamos comprometido dentro de una red. Enmascaramos nuestras instrucciones dentro de las solicitudes GET y POST que aparecían como tráfico normal y, para el ojo inexperto, parecerían una solicitud web o una respuesta a cualquier sitio web antiguo. Si el paquete se formara correctamente, se reenviaría a nuestro servidor de control. De lo contrario, se redirigiría a otro sitio web, lo que podría despistar al defensor que lo revisa.