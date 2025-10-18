#!/bin/bash

EMOJI=$(cat <<EOF
😀  feliz
😂  risa
❤️  corazon
🔥  fuego
✨  estrella
😎  Fachero
👍  ok
😁 Caras y expresiones
😀 Cara sonriendo
😃 Cara feliz con ojos grandes
😄 Cara muy sonriente
😁 Cara sonriendo con dientes
😆 Cara riendo mucho
🥹 Cara conmovida o a punto de llorar
😅 Cara sonriendo con sudor
😂 Riendo con lágrimas
🤣 Carcajadas intensas
🥲 Sonrisa triste o nostálgica
☺️ Cara sonriente y tranquila
😊 Sonrisa dulce o amable
😇 Cara con aureola, angelical
🙂 Cara levemente sonriente
🙃 Cara al revés
😉 Guiño de ojo
😌 Cara aliviada o relajada
😍 Cara con ojos de corazón
🥰 Cara enamorada
😘 Beso con corazón
😗 Beso neutral
😙 Beso con ojos cerrados
😚 Beso tierno
😋 Relamiéndose o disfrutando comida
😛 Sacando la lengua
😝 Lengua afuera y ojos cerrados
😜 Sacando lengua y guiñando un ojo
🤪 Cara loca o divertida
🤨 Ceja levantada, sospechando
🧐 Mirando con monóculo
🤓 Cara de nerd
😎 Con gafas de sol, cool
🥸 Disfrazado con gafas y bigote
🤩 Fascinado o deslumbrado
🥳 De fiesta o celebrando
😏 Sonrisa pícara
😒 Cara molesta o aburrida
😞 Decepcionado
😔 Triste o reflexivo
😟 Preocupado
😕 Confundido
🙁 Leve tristeza
☹️ Tristeza profunda
😣 Frustrado
😖 Con dolor o angustia
😫 Agotado
😩 Cansado o harto
🥺 Cara suplicante
😢 Llorando
😭 Llorando mucho
😤 Molesto, resoplando
😠 Enojado
😡 Muy enojado
🤬 Diciendo groserías o furioso
🤯 Cabeza explotando, asombrado
😳 Avergonzado o sorprendido
🥵 Acalorado
🥶 Congelado de frío
😱 Gritando de miedo
😨 Asustado
😰 Ansioso o sudando del susto
😥 Aliviado pero preocupado
😓 Cansado con sudor
🤗 Abrazando o dando cariño
🤔 Pensativo
🫣 Viendo entre los dedos, con miedo o vergüenza
🤭 Tapándose la boca, sorpresa o risa
🤫 Pidiendo silencio
🤥 Diciendo mentiras
😶 Sin expresión
😐 Neutral
😑 Aburrido o serio
😬 Sonrisa incómoda
🫠 Derritiéndose, por calor o vergüenza
🙄 Rodando los ojos
😯 Sorprendido levemente
😦 Impactado o decepcionado
😧 Shock o angustia
😮 Sorprendido con la boca abierta
😲 Muy sorprendido
😴 Durmiendo
🤤 Babeando
😪 Con sueño
😵 Aturdido o mareado
😵‍💫 Mareado con espirales
🫨 Sacudido o temblando
🤐 Boca cerrada con cremallera
🥴 Aturdido o borracho
🤢 Con náuseas
🤮 Vomitó o asco extremo
🤧 Resfriado o estornudando
😷 Con tapabocas
🤒 Enfermo con termómetro
🤕 Con venda en la cabeza
🤑 Con dinero o codicioso
🤠 Sombrero vaquero, alegre
😈 Sonrisa malvada con cuernos
👿 Demonio enojado
👹 Ogro japonés
👺 Duende enojado japonés
💀 Calavera
☠️ Símbolo de peligro o muerte
👻 Fantasma
👽 Extraterrestre
👾 Monstruo de videojuego
🤖 Robot
🎃 Calabaza de Halloween
😺 Gato sonriente
😸 Gato feliz
😹 Gato riendo con lágrimas
😻 Gato enamorado
😼 Gato pícaro
😽 Gato dando beso
🙀 Gato sorprendido
😿 Gato triste
😾 Gato enojado
👋 Mano saludando
🤚 Dorso de mano levantado
🖐️ Mano extendida con cinco dedos
✋ Mano en alto (alto o stop)
🖖 Saludo vulcano
👌 OK o perfecto
🤌 Gesto italiano (qué quieres decir)
🤏 Gesto de pellizcar
✌️ Signo de la paz o victoria
🤞 Dedos cruzados (deseando suerte)
🫰 Chasquido o gesto de dinero
🤟 Te amo (lengua de señas)
🤘 Mano rockera
🤙 Llamada o gesto de hang loose
👈 Apuntando a la izquierda
👉 Apuntando a la derecha
👆 Apuntando hacia arriba
🖕 Dedo medio
👇 Apuntando hacia abajo
☝️ Índice hacia arriba (importante o atención)
👍 Pulgar arriba (bien)
👎 Pulgar abajo (mal)
✊ Puño levantado (fuerza o protesta)
👊 Puño cerrado (golpe amistoso)
🤛 Puño hacia la izquierda
🤜 Puño hacia la derecha
👏 Aplauso
🙌 Manos levantadas en celebración
🫶 Manos en forma de corazón
👐 Manos abiertas
🤲 Manos juntas hacia arriba (recibir o dar)
🤝 Apretón de manos
🙏 Manos juntas (rezar o agradecer)
💅 Pintándose las uñas
🤳 Selfie
💪 Brazo fuerte
🦾 Brazo mecánico
🦿 Pierna mecánica
🦵 Pierna
🦶 Pie
👣 Huellas de pies
👂 Oreja
👃 Nariz
🫀 Corazón anatómico
🫁 Pulmones
🧠 Cerebro
🦷 Diente
🦴 Hueso
👀 Ojos
👁️ Ojo
👅 Lengua
👄 Boca
🫦 Labios
🦰 Cabello rojo
🦱 Cabello rizado
🦳 Cabello canoso
🦲 Calvo
👶 Bebé
🧒 Niño
👦 Chico
👧 Chica
🧑 Persona
👱 Persona rubia
👨 Hombre
👩 Mujer
🧔 Hombre con barba
🧑‍🦰 Persona con cabello rojo
🧑‍🦱 Persona con cabello rizado
🧑‍🦳 Persona con cabello canoso
🧑‍🦲 Persona calva
👨‍🦰 Hombre pelirrojo
👨‍🦱 Hombre con cabello rizado
👨‍🦳 Hombre canoso
👨‍🦲 Hombre calvo
👩‍🦰 Mujer pelirroja
👩‍🦱 Mujer con cabello rizado
👩‍🦳 Mujer canosa
👩‍🦲 Mujer calva
🧓 Persona mayor
👴 Hombre mayor
👵 Mujer mayor
🌵 Cactus  
🌾 Espiga de arroz  
🌿 Hierba  
☘️ Trébol  
🍀 Trébol de cuatro hojas  
🍁 Hoja de arce  
🍂 Hoja cayendo  
🍃 Hoja al viento  
🍄 Hongo  
🌰 Castaña  
🦀 Cangrejo  
🦞 Langosta  
🦐 Camarón  
🦑 Calamar  
🐚 Concha de mar  
🪸 Coral  
🐌 Caracol  
🦋 Mariposa  
🐛 Oruga  
🐜 Hormiga  
🐝 Abeja  
🪲 Escarabajo  
🐞 Mariquita  
🦗 Grillo  
🪳 Cucaracha  
🕷️ Araña  
🕸️ Telaraña  
🦂 Escorpión  
🦟 Mosquito  
🪰 Mosca  
🪱 Gusano  
🦠 Microbio  
💐 Ramo de flores  
🌸 Flor de cerezo  
💮 Flor blanca  
🏵️ Flor decorativa  
🌹 Rosa  
🥀 Flor marchita  
🌺 Hibisco  
🌻 Girasol  
🌼 Flor amarilla  
🌷 Tulipán  
🌱 Brote  
🌲 Pino  
🌳 Árbol frondoso  
🌴 Palmera  
🌹 Rosa  
🌾 Trigo  
🍇 Uvas  
🍈 Melón  
🍉 Sandía  
🍊 Mandarina  
🍋 Limón  
🍌 Banano  
🍍 Piña  
🥭 Mango  
🍎 Manzana roja  
🍏 Manzana verde  
🍐 Pera  
🍑 Durazno  
🍒 Cereza  
🍓 Fresa  
🫐 Arándanos  
🥝 Kiwi  
🍅 Tomate  
🫒 Aceituna  
🥥 Coco  
🥑 Aguacate  
🍆 Berenjena  
🥔 Papa  
🥕 Zanahoria  
🌽 Maíz  
🌶️ Chile picante  
🥒 Pepino  
🥬 Lechuga  
🥦 Brócoli  
🧄 Ajo  
🧅 Cebolla  
🍄 Hongo  
🥜 Maní  
🌰 Castaña  
🍞 Pan  
🥐 Croissant  
🥖 Baguette  
🫓 Pan plano  
🥨 Pretzel  
🥯 Bagel  
🥞 Panqueques  
🧇 Waffle  
🧀 Queso  
🍖 Hueso con carne  
🍗 Muslo de pollo  
🥩 Corte de carne  
🥓 Tocino  
🍔 Hamburguesa  
🍟 Papas fritas  
🍕 Pizza  
🌭 Hot dog  
🥪 Sándwich  
🌮 Taco  
🌯 Burrito  
🫔 Tamal  
🥙 Kebab  
🧆 Falafel  
🥚 Huevo  
🍳 Sartén con huevo  
🥘 Paella  
🍲 Sopa  
🫕 Fondue  
🥣 Tazón con cereal  
🥗 Ensalada  
🍿 Palomitas  
🧈 Mantequilla  
🧂 Salero  
🥫 Comida enlatada  
🍱 Bento  
🍘 Galleta de arroz  
🍙 Bola de arroz  
🍚 Arroz cocido  
🍛 Curry  
🍜 Ramen  
🍝 Espagueti  
🍠 Batata  
🍢 Pinchos  
🍣 Sushi  
🍤 Tempura  
🍥 Pastelito japonés  
🥮 Pastel de luna  
🍡 Dango  
🥟 Dumplings  
🥠 Galleta de la fortuna  
🥡 Caja china  
🦪 Ostra  
🍦 Helado  
🍧 Hielo raspado  
🍨 Postre helado  
🍩 Dona  
🍪 Galleta  
🎂 Pastel  
🍰 Rebanada de pastel  
🧁 Cupcake  
🥧 Pay o tarta  
🍫 Chocolate  
🍬 Caramelo  
🍭 Paleta  
🍮 Flan  
🍯 Miel  
🍼 Biberón  
🥛 Vaso de leche  
☕ Café  
🫖 Tetera  
🍵 Té verde  
🍶 Sake  
🍾 Botella de champaña  
🍷 Copa de vino  
🍸 Cóctel  
🍹 Bebida tropical  
🍺 Cerveza  
🍻 Choque de cervezas  
🥂 Brindis  
🥃 Licor  
🫗 Vertiendo líquido  
🥤 Refresco  
🧋 Té de burbujas  
🧃 Jugo  
🧉 Mate  
🧊 Hielo  
🥢 Palillos  
🍽️ Plato con cubiertos  
🍴 Tenedor y cuchillo  
🥄 Cuchara  
🔪 Cuchillo de cocina  
🫙 Frasco  
🏺 Ánfora  
⌚ Reloj  
📱 Teléfono móvil  
📲 Teléfono con flecha  
💻 Computadora portátil  
🖥️ Computadora de escritorio  
🖨️ Impresora  
⌨️ Teclado  
🖱️ Ratón de computadora  
🖲️ Trackball  
💽 Disco compacto  
💾 Disquete  
💿 CD  
📀 DVD  
🧮 Ábaco  
🎥 Cámara de video  
🎞️ Tira de película  
📽️ Proyector de cine  
📺 Televisor  
📷 Cámara fotográfica  
📸 Cámara con flash  
📹 Videocámara  
📼 Cinta de video  
🔍 Lupa hacia la izquierda  
🔎 Lupa hacia la derecha  
💡 Bombilla  
🔦 Linterna  
🏮 Linterna roja  
🪔 Lámpara de aceite  
🕯️ Vela  
🧯 Extintor  
🛢️ Barril de petróleo  
💰 Bolsa de dinero  
💴 Billete japonés  
💵 Billete de dólar  
💶 Billete de euro  
💷 Billete de libra  
💸 Dinero volando  
💳 Tarjeta de crédito  
🪙 Moneda  
💹 Gráfico con tendencia  
💱 Cambio de divisas  
💲 Símbolo de dólar  
🧾 Recibo  
📜 Pergamino  
📃 Hoja de papel  
📄 Documento  
📑 Separadores  
📊 Gráfico de barras  
📈 Gráfico ascendiente  
📉 Gráfico descendiente  
🗒️ Bloc de notas  
🗓️ Calendario  
📆 Calendario  
📅 Página de calendario  
🗳️ Urna con voto  
🪪 Credencial  
📇 Tarjeta de índice  
🗃️ Caja de archivo  
🗄️ Archivador  
📋 Portapapeles  
📁 Carpeta  
📂 Carpeta abierta  
🗞️ Periódico enrollado  
📰 Periódico  
📓 Cuaderno  
📔 Cuaderno decorado  
📒 Agenda  
📕 Libro cerrado  
📗 Libro verde  
📘 Libro azul  
📙 Libro naranja  
📚 Libros apilados  
📖 Libro abierto  
🔖 Marcador  
🧷 Imperdible  
🧹 Escoba  
🧺 Cesta  
🧻 Papel higiénico  
🪣 Balde  
🧼 Jabón  
🧽 Esponja  
🪞 Espejo  
🪟 Ventana  
🪠 Desatascador  
🚽 Inodoro  
🚿 Ducha  
🛁 Bañera  
🪤 Trampa para ratones  
🪒 Afeitadora  
🧴 Loción  
🧷 Alfiler  
🧲 Imán  
🧪 Tubo de ensayo  
🧫 Placa de Petri  
🧬 ADN  
🩺 Estetoscopio  
💉 Jeringa  
💊 Pastilla  
🩹 Curita  
🩼 Muleta  
🦠 Microbio  
🧰 Caja de herramientas  
🧲 Imán  
🔧 Llave inglesa  
🔨 Martillo  
⚒️ Martillo y pico  
🛠️ Martillo y llave  
🪓 Hacha  
🔩 Tuerca y tornillo  
⚙️ Engranaje  
🪤 Trampa  
🧱 Ladrillo  
⛓️ Cadenas  
🧲 Imán  
⚖️ Balanza  
🪜 Escalera  
🧯 Extintor  
🪣 Cubeta  
🪠 Desatascador  
🧹 Escoba  
🧺 Cesto  
🧻 Rollo de papel  
🪟 Ventana  
🪞 Espejo  
🛏️ Cama  
🛋️ Sofá  
🪑 Silla  
🚪 Puerta  
🪟 Ventana  
🪞 Espejo  
🛒 Carrito de compras  
🎁 Regalo  
🎈 Globo  
🎉 Confeti  
🎊 Explosión de confeti  
🎀 Lazo  
🎎 Muñecas japonesas  
🎏 Bandera de peces  
🎐 Campanillas de viento  
🪅 Piñata  
🪩 Bola de discoteca  
🎇 Bengala  
🎆 Fuegos artificiales  
🧨 Petardo  
✨ Brillo  
🎄 Árbol de Navidad  
🎃 Calabaza de Halloween  
🎋 Árbol de Tanabata  
🎍 Decoración de Año Nuevo  
🎑 Festival de la luna  
🎎 Muñecas japonesas  
🎏 Banderines  
🎐 Campanilla  
🎀 Lazo decorativo  
🎁 Regalo envuelto  
⚽ Balón de fútbol  
🏀 Balón de baloncesto  
🏈 Balón de fútbol americano  
⚾ Pelota de béisbol  
🥎 Pelota de softbol  
🎾 Pelota de tenis  
🏐 Pelota de voleibol  
🏉 Balón de rugby  
🥏 Disco volador  
🎱 Bola de billar  
🪀 Yoyo  
🏓 Tenis de mesa  
🏸 Bádminton  
🥅 Portería  
🏒 Hockey sobre hielo  
🏑 Hockey sobre césped  
🥍 Lacrosse  
🏏 Cricket  
⛳ Bandera de golf  
🏹 Arco y flecha  
🎣 Caña de pescar  
🤿 Snorkel  
🥊 Guantes de boxeo  
🥋 Ropa de artes marciales  
🎽 Camiseta de corredor  
🛹 Patineta  
🛼 Patines  
🛶 Canoa  
🚣 Persona remando  
🏊 Persona nadando  
🤽 Persona jugando waterpolo  
🏄 Persona surfeando  
🪂 Paracaídas  
🚴 Persona en bicicleta  
🚵 Persona en bicicleta de montaña  
🏇 Jinete  
⛷️ Esquiador  
🏂 Snowboarder  
🏌️ Persona jugando golf  
🤺 Esgrimista  
🤸 Gimnasta  
🤼 Luchadores  
🤾 Jugador de balón  
⛸️ Patines de hielo  
🥌 Curling  
🎿 Esquís  
🎯 Diana  
🎳 Bolos  
🎮 Control de videojuego  
🎰 Máquina tragamonedas  
🎲 Dado  
🧩 Rompecabezas  
🪁 Cometa  
🎴 Carta japonesa  
🃏 Comodín  
🀄 Pieza de Mahjong  
🎭 Máscaras de teatro  
🎨 Paleta de pintura  
🎬 Claqueta de cine  
🎤 Micrófono  
🎧 Auriculares  
🎼 Pentagrama  
🎹 Teclado musical  
🥁 Tambor  
🎷 Saxofón  
🎺 Trompeta  
🎸 Guitarra  
🪕 Banjo  
🎻 Violín  
🪈 Flauta  
🎤 Cantante  
🏟️ Estadio  
🎡 Rueda de la fortuna  
🎢 Montaña rusa  
🎠 Carrusel  
🎪 Carpa de circo  
🚂 Tren  
🚃 Vagón  
🚄 Tren bala  
🚅 Tren rápido  
🚆 Tren de pasajeros  
🚇 Metro  
🚈 Tren ligero  
🚊 Tranvía  
🚉 Estación de tren  
🚌 Autobús  
🚍 Autobús frontal  
🚎 Trolebús  
🚐 Minibús  
🚑 Ambulancia  
🚒 Camión de bomberos  
🚓 Patrulla policial  
🚔 Patrulla de frente  
🚕 Taxi  
🚖 Taxi frontal  
🚗 Coche  
🚘 Coche frontal  
🚙 SUV  
🛻 Camioneta  
🚚 Camión de carga  
🚛 Tráiler  
🚜 Tractor  
🏎️ Auto de carreras  
🏍️ Motocicleta  
🛵 Scooter  
🦽 Silla de ruedas manual  
🦼 Silla de ruedas motorizada  
🛺 Mototaxi  
🚲 Bicicleta  
🛴 Patinete  
🛞 Llanta  
🛢️ Barril  
⛽ Gasolinera  
🚧 Señal de construcción  
🚦 Semáforo vertical  
🚥 Semáforo horizontal  
🚏 Parada de bus  
🗺️ Mapa  
🧭 Brújula  
🧳 Maleta  
🛫 Avión despegando  
🛬 Avión aterrizando  
🛩️ Avión pequeño  
✈️ Avión  
🚁 Helicóptero  
🛸 Platillo volador  
🚀 Cohete  
🛶 Bote  
🚤 Lancha  
🛥️ Yate  
🛳️ Barco de pasajeros  
⛴️ Ferry  
🚢 Barco  
⚓ Ancla  
🪝 Gancho  
⛵ Velero  
🏖️ Playa con sombrilla  
🏝️ Isla desierta  
🏜️ Desierto  
🏞️ Parque nacional  
🏕️ Campamento  
🗻 Monte Fuji  
🏔️ Montaña nevada  
🌋 Volcán  
🗾 Mapa de Japón  
🏠 Casa  
🏡 Casa con jardín  
🏢 Edificio de oficinas  
🏣 Oficina postal japonesa  
🏤 Oficina postal  
🏥 Hospital  
🏦 Banco  
🏨 Hotel  
🏩 Hotel de amor  
🏪 Tienda 24 horas  
🏫 Escuela  
🏬 Centro comercial  
🏭 Fábrica  
🏯 Castillo japonés  
🏰 Castillo europeo  
💒 Iglesia  
🕌 Mezquita  
🛕 Templo hindú  
🕍 Sinagoga  
⛩️ Santuario sintoísta  
🕋 Kaaba  
⛪ Iglesia cristiana  
🛤️ Vía férrea  
🛣️ Carretera  
🗼 Torre de Tokio  
🗽 Estatua de la Libertad  
⛲ Fuente  
⛺ Carpa  
🌁 Niebla  
🌃 Ciudad nocturna  
🏙️ Ciudad  
🌆 Atardecer urbano  
🌇 Puesta de sol  
🌉 Puente de noche  
🌌 Vía Láctea  
🎑 Festival de la luna  
🌠 Estrella fugaz  
🎆 Fuegos artificiales  
🌈 Arcoíris  
🏖️ Playa  
🏜️ Desierto  
🏕️ Campamento  
🏞️ Parque natural  
⌚ Reloj  
📱 Teléfono móvil  
📲 Teléfono móvil con flecha  
💻 Computador portátil  
⌨️ Teclado  
🖥️ Computador de escritorio  
🖨️ Impresora  
🖱️ Ratón de computadora  
🖲️ Trackball  
💽 Disco  
💾 Disquete  
💿 CD  
📀 DVD  
📼 Cinta de video  
📷 Cámara  
📸 Cámara con flash  
📹 Videocámara  
🎥 Cámara de cine  
📞 Teléfono fijo  
☎️ Teléfono clásico  
📟 Buscapersonas  
📠 Fax  
📺 Televisor  
📻 Radio  
🎙️ Micrófono de estudio  
🎚️ Control deslizante de audio  
🎛️ Panel de control  
⏱️ Cronómetro  
⏲️ Temporizador  
⏰ Despertador  
🕰️ Reloj antiguo  
⌛ Reloj de arena lleno  
⏳ Reloj de arena vacío  
📡 Antena satelital  
🔋 Batería  
🪫 Batería baja  
🔌 Enchufe  
💡 Bombilla  
🔦 Linterna  
🕯️ Vela  
🧯 Extintor  
🧭 Brújula  
⚖️ Balanza  
⚗️ Matraz de laboratorio  
🧪 Tubo de ensayo  
🧫 Placa de Petri  
🧬 ADN  
🔬 Microscopio  
🔭 Telescopio  
💎 Diamante  
💰 Saco de dinero  
💴 Billete japonés  
💵 Billete estadounidense  
💶 Billete europeo  
💷 Billete británico  
💸 Dinero volando  
💳 Tarjeta de crédito  
🪙 Moneda  
💹 Gráfico con yen  
💱 Cambio de divisas  
💲 Símbolo de dólar  
📈 Gráfico en aumento  
📉 Gráfico en descenso  
📊 Gráfico de barras  
📋 Portapapeles  
📆 Calendario  
📅 Calendario con fecha  
📇 Tarjeta de índice  
📁 Carpeta  
📂 Carpeta abierta  
🗂️ Archivadores  
🗃️ Caja de archivos  
🗄️ Archivador  
📦 Caja de envío  
📫 Buzón cerrado  
📪 Buzón vacío  
📬 Buzón abierto  
📭 Buzón con bandera abajo  
📮 Buzón público  
✉️ Sobre  
📨 Correo entrante  
📩 Correo saliente  
📤 Bandeja de salida  
📥 Bandeja de entrada  
📜 Pergamino  
📃 Documento  
📄 Página  
📑 Marcadores  
🖊️ Bolígrafo  
🖋️ Pluma  
✒️ Pluma estilográfica  
🖌️ Pincel  
🖍️ Crayón  
📝 Nota  
💼 Maletín  
📎 Clip  
📏 Regla recta  
📐 Escuadra  
✂️ Tijeras  
🗑️ Basurero  
🔒 Candado cerrado  
🔓 Candado abierto  
🔏 Candado con pluma  
🔐 Candado con llave  
🗝️ Llave antigua  
🔑 Llave  
🪙 Moneda  
🪞 Espejo  
🪟 Ventana  
🪑 Silla  
🛋️ Sofá y lámpara  
🛏️ Cama  
🛁 Bañera  
🚿 Ducha  
🚽 Inodoro  
🪠 Destapador  
🪤 Trampa para ratones  
🧴 Botella de loción  
🧷 Seguro  
🧹 Escoba  
🧺 Cesta  
🧻 Papel higiénico  
🪣 Balde  
🧼 Jabón  
🧽 Esponja  
🪥 Cepillo de dientes  
🪒 Afeitadora  
🧯 Extintor  
🚪 Puerta  
🚬 Cigarrillo (prohibido fumar)  
🚭 Prohibido fumar  
🚮 Tacho de basura  
🚰 Agua potable  
🚱 Agua no potable  
🚹 Baño de hombres  
🚺 Baño de mujeres  
🚻 Baño público  
🚼 Bebé  
🚾 Servicios sanitarios  
🛗 Ascensor  
🛎️ Timbre de hotel  
🧳 Maleta  
♻️ Reciclaje  
⚜️ Flor de lis  
🔱 Tridente  
📛 Insignia de nombre  
🔰 Símbolo japonés de principiante  
⭕ Círculo rojo  
✅ Marca de verificación  
☑️ Casilla marcada  
✔️ Marca de chequeo  
❌ X roja  
❎ Botón X  
➕ Signo de más  
➖ Signo de menos  
➗ Signo de división  
➰ Bucle  
➿ Doble bucle  
❓ Signo de interrogación  
❔ Signo de interrogación blanco  
❗ Signo de exclamación  
❕ Signo de exclamación blanco  
‼️ Doble exclamación  
⁉️ Exclamación e interrogación  
🔺 Triángulo rojo hacia arriba  
🔻 Triángulo rojo hacia abajo  
🔸 Rombo pequeño naranja  
🔹 Rombo pequeño azul  
🔶 Rombo grande naranja  
🔷 Rombo grande azul  
🔳 Cuadro blanco  
🔲 Cuadro negro  
⬛ Cuadro grande negro  
⬜ Cuadro grande blanco  
🟥 Cuadro rojo  
🟧 Cuadro naranja  
🟨 Cuadro amarillo  
🟩 Cuadro verde  
🟦 Cuadro azul  
🟪 Cuadro morado  
🟫 Cuadro marrón  
🏳️ Bandera blanca  
🏴 Bandera negra  
🏁 Bandera a cuadros  
🚩 Bandera triangular  
🏳️‍🌈 Bandera del orgullo  
🏳️‍⚧️ Bandera transgénero  
🇦🇷 Bandera de Argentina  
🇧🇷 Bandera de Brasil  
🇨🇱 Bandera de Chile  
🇨🇴 Bandera de Colombia  
🇲🇽 Bandera de México  
🇪🇸 Bandera de España  
🇺🇸 Bandera de Estados Unidos  
🇫🇷 Bandera de Francia  
🇩🇪 Bandera de Alemania  
🇮🇹 Bandera de Italia  
🇯🇵 Bandera de Japón  
🇨🇳 Bandera de China  
🇬🇧 Bandera del Reino Unido  
🇰🇷 Bandera de Corea del Sur  
🇨🇦 Bandera de Canadá  
🇮🇳 Bandera de India  
🇷🇺 Bandera de Rusia  
🇺🇳 Bandera de las Naciones Unidas  
🧰 Caja de herramientas  
🔧 Llave inglesa  
🔨 Martillo  
⚒️ Martillo y pico  
🛠️ Martillo y llave inglesa  
🪓 Hacha  
🔩 Tornillo y tuerca  
⚙️ Engrane  
🪛 Destornillador  
🧱 Ladrillo  
⛓️ Cadena  
🪝 Gancho  
🪜 Escalera  
⚗️ Matraz  
🧪 Tubo de ensayo  
🧫 Placa de Petri  
🧬 ADN  
🧯 Extintor  
🧲 Imán  
🪄 Varita mágica  
🪅 Piñata  
🪩 Bola de discoteca  
🪆 Muñeca rusa  
🪡 Aguja e hilo  
🧵 Hilo  
🧶 Estambre  
🪢 Nudo  
🧥 Abrigo  
👚 Blusa  
👕 Camiseta  
👖 Pantalones  
🩳 Pantalones cortos  
👔 Corbata  
👗 Vestido  
👙 Bikini  
🩱 Traje de baño  
🧢 Gorra  
👒 Sombrero de mujer  
🎩 Sombrero de copa  
🎓 Birrete  
🧢 Gorro  
🪖 Casco militar  
⛑️ Casco con cruz  
👞 Zapato  
👟 Tenis  
🥾 Bota  
🥿 Zapato plano  
👠 Tacón  
👡 Sandalia  
🩴 Chancla  
👢 Bota alta  
🧤 Guantes  
🧣 Bufanda  
🧦 Medias  
🩲 Ropa interior  
🩳 Shorts  
👙 Ropa de baño  
💍 Anillo  
💎 Joya  
⌚ Reloj  
🕶️ Gafas de sol  
🕵️ Persona con sombrero  
🪪 Credencial  
🪙 Moneda  
📿 Rosario  
💄 Pintalabios  
💋 Beso  
💅 Uñas pintadas  
💈 Poste de barbería  
🪞 Espejo  
🧴 Crema o loción  
🧷 Imperdible  
🪮 Peineta  
🧼 Jabón  
🧽 Esponja  
🪥 Cepillo de dientes  
🧻 Papel higiénico  
🪒 Afeitadora  
🧺 Cesta de ropa  
🪣 Cubeta  
🧹 Escoba  
🧯 Extintor  
🧳 Maleta  
🎒 Mochila  
🛍️ Bolsa de compras  
🎁 Regalo  
🎀 Lazo  
🎈 Globo  
🎉 Confeti  
🎊 Serpentinas  
🎆 Fuegos artificiales  
🎇 Bengala  
🧨 Petardo  
✨ Brillo  
💫 Mareo  
🌟 Estrella brillante  
⭐ Estrella  
🌠 Estrella fugaz  
🌙 Luna  
🌞 Sol con cara  
☀️ Sol  
⚡ Rayo  
🔥 Fuego  
💧 Gota de agua  
🌊 Ola  
🌈 Arcoíris  
❄️ Copo de nieve  
☃️ Muñeco de nieve  
🌪️ Tornado  
🌫️ Niebla  
☁️ Nube  
🌤️ Sol entre nubes  
⛈️ Tormenta  
🌧️ Lluvia  
🌦️ Sol y lluvia  
🌩️ Relámpago  
🌨️ Nieve  
🌍 Globo terráqueo Europa-África  
🌎 Globo terráqueo América  
🌏 Globo terráqueo Asia  
🌐 Globo con meridianos  
🌑 Luna nueva  
🌒 Luna creciente  
🌓 Cuarto creciente  
🌔 Gibosa creciente  
🌕 Luna llena  
🌖 Gibosa menguante  
🌗 Cuarto menguante  
🌘 Luna menguante  
🌙 Luna creciente fina  
🌚 Luna nueva con cara  
🌝 Luna llena con cara  
🌛 Luna creciente con cara  
🌜 Luna menguante con cara  
🌡️ Termómetro  
💥 Explosión  
💣 Bomba  
💤 Zzz (dormir)  
💬 Globo de diálogo  
🗨️ Globo de diálogo lateral  
🗯️ Globo de enojo  
💭 Globo de pensamiento  
💢 Símbolo de enojo  
💤 Símbolo de sueño  
🕳️ Agujero  
🩸 Sangre o gota roja  
💉 Jeringa  
💊 Pastilla  
🩹 Curita  
🩼 Muleta  
🩺 Estetoscopio  
🩻 Radiografía  
⚕️ Símbolo médico  
⚰️ Ataúd  
⚱️ Urna funeraria  
🪦 Lápida  
🔯 Estrella de seis puntas  
✡️ Estrella de David  
☸️ Rueda del dharma  
☯️ Yin y yang  
☮️ Símbolo de paz  
🕉️ Om  
🔯 Pentagrama  
♈ Aries  
♉ Tauro  
♊ Géminis  
♋ Cáncer  
♌ Leo  
♍ Virgo  
♎ Libra  
♏ Escorpio  
♐ Sagitario  
♑ Capricornio  
♒ Acuario  
♓ Piscis  
⛎ Ofiuco  
🔀 Aleatorio  
🔁 Repetir  
🔂 Repetir una vez  
▶️ Reproducir  
⏸️ Pausa  
⏹️ Detener  
⏺️ Grabar  
⏩ Avance rápido  
⏪ Retroceso rápido  
⏮️ Anterior  
⏭️ Siguiente  
🔼 Triángulo hacia arriba  
🔽 Triángulo hacia abajo  
⏫ Doble hacia arriba  
⏬ Doble hacia abajo  
🔊 Volumen alto  
🔉 Volumen medio  
🔈 Volumen bajo  
🔇 Silencio  
📣 Megáfono  
📢 Altavoz  
🔔 Campana  
🔕 Campana silenciada  
🎵 Nota musical  
🎶 Notas musicales  
🎼 Partitura  
📯 Cuerno postal  
🎷 Saxofón  
🎺 Trompeta  
🎸 Guitarra  
🎻 Violín  
🎹 Piano  
🥁 Tambor  
🪈 Flauta  
🕹️ Joystick  
🎮 Control de videojuego  
🎰 Tragamonedas  
🎲 Dado  
🧩 Rompecabezas  
🧸 Osito de peluche  
🎎 Muñecos japoneses  
🎏 Bandera de carpa  
🎐 Campanilla de viento  
🎋 Bambú de Tanabata  
🎍 Decoración de Año Nuevo  
🎑 Festival de la luna  
🎀 Lazo  
🏮 Linterna japonesa  
🪔 Lámpara de aceite  
🔮 Bola de cristal  
🕯️ Vela  
🪄 Varita mágica  
💠 Flor decorativa  
🔶 Rombo naranja  
🔷 Rombo azul  
🔸 Pequeño rombo naranja  
🔹 Pequeño rombo azul  
🔺 Triángulo rojo arriba  
🔻 Triángulo rojo abajo  
🔸 Círculo pequeño naranja  
🔹 Círculo pequeño azul  
🏧 Cajero automático  
🚮 Basura  
🚰 Agua potable  
♿ Accesibilidad  
🚹 Hombres  
🚺 Mujeres  
🚻 Baños  
🚼 Bebé  
🚾 WC  
🛂 Control de pasaportes  
🛃 Aduana  
🛄 Reclamo de equipaje  
🛅 Guarda equipaje  
⚠️ Precaución  
🚸 Niños cruzando  
⛔ No pasar  
🚫 Prohibido  
🚳 No bicicletas  
🚭 No fumar  
🚯 No botar basura  
🚱 No agua potable  
🚷 Prohibido el paso  
📵 No teléfonos  
🔞 Solo mayores de 18  
☢️ Radiactivo  
☣️ Biopeligro  
⬆️ Flecha arriba  
⬇️ Flecha abajo  
⬅️ Flecha izquierda  
➡️ Flecha derecha  
↗️ Flecha diagonal arriba  
↘️ Flecha diagonal abajo  
↖️ Flecha diagonal izquierda  
↙️ Flecha diagonal abajo izquierda  
🔁 Repetir  
🔂 Repetir una vez  
🔄 Recargar  
🔃 Giro  
🔙 Flecha atrás  
🔚 Fin  
🔛 Encendido  
🔜 Pronto  
🔝 Arriba  
🆗 OK  
🆕 Nuevo  
🆙 Subir  
🆒 Cool  
🆓 Gratis  
🆖 No bueno  
🆗 OK  
🆘 SOS  
🆚 Versus  
💯 Cien puntos  
🔠 Mayúsculas  
🔡 Minúsculas  
🔢 Números  
🔣 Símbolos  
🔤 Letras  
ℹ️ Información  
🔤 Letras latinas  
🔢 Números  
🔣 Símbolos  
🔠 Mayúsculas  
🔡 Minúsculas  
🈚 Sin cargo  
🈯 Reservado  
🈳 Disponible  
🈵 Lleno  
🈴 Aprobado  
🈲 Prohibido  
🈶 Disponible  
🈷️ Mensual  
🈸 Solicitud  
🈹 Descuento  
🈺 Abierto  
🈻 Cerrado  
㊗️ Felicitaciones  
㊙️ Secreto  
🈂️ Servicio  
🈁 Aquí  
🉐 Oferta especial  
🉑 Aceptable  
💮 Sello  
✅ Aprobado  
🪪 Identificación  
🏧 Cajero automático  
🎫 Entrada  
🎟️ Boletos  
🎗️ Cinta de apoyo  
🔖 Marcador  
🏷️ Etiqueta  
🔗 Enlace  
🧾 Recibo  
📜 Pergamino  
📄 Documento  
📃 Hoja  
📑 Marcadores  
📚 Libros  
📖 Libro abierto  
📘 Libro azul  
📙 Libro naranja  
📗 Libro verde  
📕 Libro rojo  
📓 Cuaderno  
📒 Libreta  
📔 Diario  
📚 Pila de libros  
🇦🇫 Afganistán  
🇦🇱 Albania  
🇩🇿 Argelia  
🇦🇸 Samoa Americana  
🇦🇩 Andorra  
🇦🇴 Angola  
🇦🇮 Anguila  
🇦🇶 Antártida  
🇦🇬 Antigua y Barbuda  
🇦🇷 Argentina  
🇦🇲 Armenia  
🇦🇼 Aruba  
🇦🇺 Australia  
🇦🇹 Austria  
🇦🇿 Azerbaiyán  
🇧🇸 Bahamas  
🇧🇭 Baréin  
🇧🇩 Bangladés  
🇧🇧 Barbados  
🇧🇾 Bielorrusia  
🇧🇪 Bélgica  
🇧🇿 Belice  
🇧🇯 Benín  
🇧🇲 Bermudas  
🇧🇹 Bután  
🇧🇴 Bolivia  
🇧🇦 Bosnia y Herzegovina  
🇧🇼 Botsuana  
🇧🇷 Brasil  
🇮🇴 Territorio Británico del Océano Índico  
🇻🇬 Islas Vírgenes Británicas  
🇧🇳 Brunéi  
🇧🇬 Bulgaria  
🇧🇫 Burkina Faso  
🇧🇮 Burundi  
🇰🇭 Camboya  
🇨🇲 Camerún  
🇨🇦 Canadá  
🇨🇻 Cabo Verde  
🇧🇶 Bonaire, San Eustaquio y Saba  
🇰🇾 Islas Caimán  
🇨🇫 República Centroafricana  
🇹🇩 Chad  
🇨🇱 Chile  
🇨🇳 China  
🇨🇽 Isla Christmas  
🇨🇨 Islas Cocos  
🇨🇴 Colombia  
🇰🇲 Comoras  
🇨🇬 Congo  
🇨🇩 República Democrática del Congo  
🇨🇰 Islas Cook  
🇨🇷 Costa Rica  
🇨🇮 Costa de Marfil  
🇭🇷 Croacia  
🇨🇺 Cuba  
🇨🇼 Curazao  
🇨🇾 Chipre  
🇨🇿 República Checa  
🇩🇰 Dinamarca  
🇩🇯 Yibuti  
🇩🇲 Dominica  
🇩🇴 República Dominicana  
🇪🇨 Ecuador  
🇪🇬 Egipto  
🇸🇻 El Salvador  
🇬🇶 Guinea Ecuatorial  
🇪🇷 Eritrea  
🇪🇪 Estonia  
🇪🇹 Etiopía  
🇫🇰 Islas Malvinas  
🇫🇴 Islas Feroe  
🇫🇯 Fiyi  
🇫🇮 Finlandia  
🇫🇷 Francia  
🇬🇫 Guayana Francesa  
🇵🇫 Polinesia Francesa  
🇹🇫 Territorios Australes Franceses  
🇬🇦 Gabón  
🇬🇲 Gambia  
🇬🇪 Georgia  
🇩🇪 Alemania  
🇬🇭 Ghana  
🇬🇮 Gibraltar  
🇬🇷 Grecia  
🇬🇱 Groenlandia  
🇬🇩 Granada  
🇬🇵 Guadalupe  
🇬🇺 Guam  
🇬🇹 Guatemala  
🇬🇬 Guernsey  
🇬🇳 Guinea  
🇬🇼 Guinea-Bisáu  
🇬🇾 Guyana  
🇭🇹 Haití  
🇭🇳 Honduras  
🇭🇰 Hong Kong  
🇭🇺 Hungría  
🇮🇸 Islandia  
🇮🇳 India  
🇮🇩 Indonesia  
🇮🇷 Irán  
🇮🇶 Irak  
🇮🇪 Irlanda  
🇮🇲 Isla de Man  
🇮🇱 Israel  
🇮🇹 Italia  
🇯🇲 Jamaica  
🇯🇵 Japón  
🎌 Banderas cruzadas (símbolo)  
🇯🇪 Jersey  
🇯🇴 Jordania  
🇰🇿 Kazajistán  
🇰🇪 Kenia  
🇰🇮 Kiribati  
🇽🇰 Kosovo  
🇰🇼 Kuwait  
🇰🇬 Kirguistán  
🇱🇦 Laos  
🇱🇻 Letonia  
🇱🇧 Líbano  
🇱🇸 Lesoto  
🇱🇷 Liberia  
🇱🇾 Libia  
🇱🇮 Liechtenstein  
🇱🇹 Lituania  
🇱🇺 Luxemburgo  
🇲🇴 Macao  
🇲🇬 Madagascar  
🇲🇼 Malaui  
🇲🇾 Malasia  
🇲🇻 Maldivas  
🇲🇱 Malí  
🇲🇹 Malta  
🇲🇭 Islas Marshall  
🇲🇶 Martinica  
🇲🇷 Mauritania  
🇲🇺 Mauricio  
🇾🇹 Mayotte  
🇲🇽 México  
🇫🇲 Micronesia  
🇲🇩 Moldavia  
🇲🇨 Mónaco  
🇲🇳 Mongolia  
🇲🇪 Montenegro  
🇲🇸 Montserrat  
🇲🇦 Marruecos  
🇲🇿 Mozambique  
🇲🇲 Myanmar (Birmania)  
🇳🇦 Namibia  
🇳🇷 Nauru  
🇳🇵 Nepal  
🇳🇱 Países Bajos  
🇳🇨 Nueva Caledonia  
🇳🇿 Nueva Zelanda  
🇳🇮 Nicaragua  
🇳🇪 Níger  
🇳🇬 Nigeria  
🇳🇺 Niue  
🇳🇫 Isla Norfolk  
🇲🇰 Macedonia del Norte  
🇲🇵 Islas Marianas del Norte  
🇰🇵 Corea del Norte  
🇳🇴 Noruega  
🇴🇲 Omán  
🇵🇰 Pakistán  
🇵🇼 Palaos  
🇵🇸 Palestina  
🇵🇦 Panamá  
🇵🇬 Papúa Nueva Guinea  
🇵🇾 Paraguay  
🇵🇪 Perú  
🇵🇭 Filipinas  
🇵🇳 Islas Pitcairn  
🇵🇱 Polonia  
🇵🇹 Portugal  
🇵🇷 Puerto Rico  
🇶🇦 Catar  
🇷🇪 Reunión  
🇷🇴 Rumania  
🇷🇺 Rusia  
🇷🇼 Ruanda  
🇼🇸 Samoa  
🇸🇲 San Marino  
🇸🇹 Santo Tomé y Príncipe  
🇸🇦 Arabia Saudita  
🇸🇳 Senegal  
🇷🇸 Serbia  
🇸🇨 Seychelles  
🇸🇱 Sierra Leona  
🇸🇬 Singapur  
🇸🇽 Sint Maarten  
🇸🇰 Eslovaquia  
🇸🇮 Eslovenia  
🇸🇧 Islas Salomón  
🇸🇴 Somalia  
🇿🇦 Sudáfrica  
🇬🇸 Islas Georgia del Sur y Sandwich del Sur  
🇰🇷 Corea del Sur  
🇸🇸 Sudán del Sur  
🇪🇸 España  
🇱🇰 Sri Lanka  
🇸🇩 Sudán  
🇸🇷 Surinam  
🇸🇯 Svalbard y Jan Mayen  
🇸🇿 Esuatini  
🇸🇪 Suecia  
🇨🇭 Suiza  
🇸🇾 Siria  
🇹🇼 Taiwán  
🇹🇯 Tayikistán  
🇹🇿 Tanzania  
🇹🇭 Tailandia  
🇹🇱 Timor Oriental  
🇹🇬 Togo  
🇹🇰 Tokelau  
🇹🇴 Tonga  
🇹🇹 Trinidad y Tobago  
🇹🇳 Túnez  
🇹🇷 Turquía  
🇹🇲 Turkmenistán  
🇹🇨 Islas Turcas y Caicos  
🇹🇻 Tuvalu  
🇺🇬 Uganda  
🇺🇦 Ucrania  
🇦🇪 Emiratos Árabes Unidos  
🇬🇧 Reino Unido  
🇺🇸 Estados Unidos  
🇻🇮 Islas Vírgenes de EE. UU.  
🇺🇾 Uruguay  
🇺🇿 Uzbekistán  
🇻🇺 Vanuatu  
🇻🇦 Ciudad del Vaticano  
🇻🇪 Venezuela  
🇻🇳 Vietnam  
🇼🇫 Wallis y Futuna  
🇪🇭 Sáhara Occidental  
🇾🇪 Yemen  
🇿🇲 Zambia  
🇿🇼 Zimbabue  
🇺🇳 Naciones Unidas  
🏴 Bandera negra  
🏳️ Bandera blanca  
🏁 Bandera de meta  
🚩 Bandera triangular  
🏳️‍🌈 Bandera arcoíris
🏳️‍⚧️ Bandera transgénero
EOF
)

chosen=$(echo "$EMOJI" | rofi -dmenu -i -p "Emoji" | awk '{print $1}')

if [ -n "$chosen" ]; then
    echo -n "$chosen" | wl-copy
    wtype "$chosen"
fi

# Autor: Fravelz
