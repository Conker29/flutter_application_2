# 🌍 Lugares del Mundo

App Flutter para explorar los sitios turísticos más icónicos del mundo.

---

## ✨ Funcionalidades

- **Listado de destinos** — 10 lugares turísticos con imagen, nombre, país y descripción.
- **Favoritos** — Marca y desmarca lugares con el ícono de corazón; el contador se actualiza en tiempo real.
- **Abrir en Google Maps** — El botón del mapa lanza la ubicación directamente en la app de mapas del dispositivo.
- **Botones de acción** — Accesos rápidos a CALL, ROUTE y SHARE (listos para conectar tu lógica).

---

## 🗂️ Estructura del código

```
lib/main.dart
│
├── MyApp                  # Punto de entrada, configura el tema (teal)
├── TouristApp             # Widget con estado principal
│   ├── _sites             # Lista de 10 sitios turísticos (constante)
│   ├── _isFavorite        # Estado de favorito por sitio
│   ├── _favoriteCount     # Contador de favoritos por sitio
│   └── _toggleFavorite()  # Alterna favorito y actualiza contador
│
├── TouristSite            # Modelo de datos (nombre, país, desc, imagen, mapa)
│
├── TouristSiteCard        # Tarjeta completa por destino
│   ├── ImageSection       # Imagen de cabecera con bordes redondeados
│   ├── TitleSection       # Nombre, país e ícono de ubicación
│   ├── ButtonSection      # Fila de botones CALL / ROUTE / SHARE
│   └── TextSection        # Descripción del lugar
│
└── ButtonWithText         # Botón reutilizable (ícono + etiqueta)
```

---

## 📦 Dependencias

En `pubspec.yaml` debes tener:

```yaml
dependencies:
  flutter:
    sdk: flutter
  url_launcher: ^6.0.0
```

Y en Android (`android/app/src/main/AndroidManifest.xml`) agrega los queries para `url_launcher`:

```xml
<queries>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
</queries>
```

---

## ▶️ Cómo correr el proyecto

```bash
flutter pub get
flutter run
```

---

## ➕ Cómo añadir un nuevo lugar

1. Agrega un nuevo `TouristSite` a la lista `_sites` en `_TouristAppState`:

```dart
TouristSite(
  name: 'Nombre del lugar',
  country: 'País',
  description: 'Descripción breve del sitio.',
  imageUrl: 'https://url-de-tu-imagen.jpg',
  mapUrl: 'https://www.google.com/maps/search/?api=1&query=Nombre+Lugar',
),
```

2. No necesitas tocar nada más — las listas `_isFavorite` y `_favoriteCount` se generan automáticamente con `initState()`.

### 🖼️ Sobre las imágenes

Las imágenes se cargan desde URL con `Image.network`. Para añadir imágenes propias tienes dos opciones:

**Opción A — URL pública:**
Sube la imagen a cualquier hosting (Imgur, Cloudinary, GitHub, etc.) y usa la URL directa en `imageUrl`.

**Opción B — Imagen local (assets):**

1. Crea la carpeta `assets/images/` en la raíz del proyecto.
2. Copia tu imagen ahí, por ejemplo `maravilla.jpg`.
3. Declárala en `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/images/maravilla.jpg
   ```
4. En `ImageSection`, cambia `Image.network(imageUrl, ...)` por:
   ```dart
   Image.asset(imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover)
   ```
5. Pasa la ruta como `imageUrl`: `'assets/images/maravilla.jpg'`.

Evidencias de APK


<img width="503" height="803" alt="image" src="https://github.com/user-attachments/assets/12fa4471-fd6d-4165-83a8-c6ab4b86bdb7" />
<img width="1917" height="567" alt="image" src="https://github.com/user-attachments/assets/3502b483-424e-44f6-a512-7af02acdee69" />

Funcionamiento de uso de google Maps

<img width="1917" height="911" alt="image" src="https://github.com/user-attachments/assets/bb632d23-ba92-4a0b-8c82-9c92dac89ad0" />
<img width="1917" height="966" alt="image" src="https://github.com/user-attachments/assets/a78be536-7073-497d-b8af-a2f2fdb1ae85" />


