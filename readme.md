# Hyprdots

Repositorio #1 de configuración de Arch Linux.

Ver demostración de estilos completos en mi canal de YouTube:

[Ir al video de YouTube](https://www.youtube.com/watch?v=xmqRhAnfWSc&t=1s)

O revisa directamente la configuración de interés.

<iframe width="560" height="315" src="https://www.youtube.com/embed/xmqRhAnfWSc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

## Temario

- [Hyprdots](#hyprdots)
  - [Temario](#temario)
  - [Notas](#notas)
  - [Guía](#guía)
    - [Organización de archivos y carpetas](#organización-de-archivos-y-carpetas)
    - [Carpeta config](#carpeta-config)
    - [Carpeta home](#carpeta-home)
    - [Carpeta media](#carpeta-media)
    - [Carpeta scripts](#carpeta-scripts)
    - [Raíz del proyecto](#raíz-del-proyecto)
  - [Información](#información)

---

## Notas

- Repositorio en construcción.  

- Contenido avanzado: requiere conocimientos en Bash y personalización de temas.  

- Se recomienda leer la guía completa antes de ejecutar cualquier script.

---

## Guía

### Organización de archivos y carpetas

| Carpeta      | Contenido                                                                 | Enlace                                     |
| ------------ | ------------------------------------------------------------------------ | ----------------------------------------- |
| `./config`   | Archivos de configuración del sistema (`~/.config`).                     | [Ver configuración](#carpeta-config)      |
| `./home`     | Archivos del directorio personal (`~`).                                   | [Ver archivos de home](#carpeta-home)     |
| `./media`    | Imágenes y GIFs utilizados para documentación y demostraciones.          | [Ver media](#carpeta-media)               |
| `./scripts`  | Scripts o códigos que no forman parte de ninguna configuración específica.| [Ver scripts](#carpeta-scripts)           |
| `./`         | Archivos generales y documentación.                                       | [Ver raíz del proyecto](#raíz-del-proyecto)|

---

### Carpeta config

Contiene todos los archivos de configuración que se aplicarán al sistema dentro de `~/.config`.  

---

### Carpeta home

Contiene archivos que se copiarán al directorio personal (`~`) para personalización y automatización.  

---

### Carpeta media

Contiene **imágenes y GIFs** utilizados en la documentación y demostraciones.  

---

### Carpeta scripts

Archivos:

- `permisos.sh`: Automiza la solicitud de permisos para que `actualizar.sh` funcione correctamente.

- `actualizar.sh`: Ejecuta la configuración del repositorio y aplica los cambios en el sistema.  

**Instrucciones de uso:**

1. Verifica que Arch Linux y Hyprland estén instalados.  

2. Clona el repositorio en `./documentos/` sin cambiar nombres.  

3. Revisa las carpetas `config` y `home` y los scripts `actualizar.sh` y `permisos.sh` para asegurarte de que las rutas estén correctas.  

Luego agrega permisos de ejecución a los scripts:

``` bash
chmod +x actualizar.sh
chmod +x permisos.sh
````

Y Ejecuta los scripts en orden:

``` bash
./permisos.sh
./actualizar.sh
```

Al finalizar, los cambios se aplicarán y podrás visualizar la personalización.

> Ten en cuenta que la configuración actual y los documentos serán reescritos.

---

### Raíz del proyecto

Archivos:

- `readme.md`: Documentación principal del repositorio.

- `style-formatter.css`: Archivo para configurar colores en VS Code y facilitar la selección de colores en archivos de configuración (kitty.conf, etc.).

Ejemplo de uso del archivo `style-formatter.css` en VS Code:

![Opción de colores en VS Code](./media/style-formatter.png)

## Información

**Actualización:** 0.0.6

**Autor:** Fravelz
