import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lugares del mundo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const TouristApp(),
    );
  }
}

class TouristApp extends StatefulWidget {
  const TouristApp({super.key});

  @override
  State<TouristApp> createState() => _TouristAppState();
}

class _TouristAppState extends State<TouristApp> {
  final List<TouristSite> _sites = const [
    TouristSite(
      name: 'Machu Picchu',
      country: 'Perú',
      description:
        'Ruinas incas ubicadas en la cima de una montaña, famosas por su historia y vistas impresionantes.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/e/eb/Machu_Picchu%2C_Peru.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Machu+Picchu+Peru',
    ),
    TouristSite(
      name: 'Torre Eiffel',
      country: 'Francia',
      description:
        'El ícono de París, una torre de hierro conocida por su arquitectura y vistas panorámicas.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Eiffel+Tower+Paris',
    ),
    TouristSite(
      name: 'Gran Muralla',
      country: 'China',
      description:
        'Una extensa fortificación histórica que se extiende miles de kilómetros a través de montañas y valles.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/1/10/Great_Wall_2010.JPG',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Great+Wall+China',
    ),
    TouristSite(
      name: 'Taj Mahal',
      country: 'India',
      description:
        'Mausoleo de mármol blanco construido como símbolo de amor eterno y una de las maravillas del mundo.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/d/da/Taj-Mahal.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Taj+Mahal+India',
    ),
    TouristSite(
      name: 'Gran Cañón',
      country: 'Estados Unidos',
      description:
        'Un cañón gigantesco esculpido por el río Colorado, famoso por sus colores y profundidades.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/a/a0/Grand_Canyon_view_from_Pima_Point_2010.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Grand+Canyon+Arizona',
    ),
    TouristSite(
      name: 'Petra',
      country: 'Jordania',
      description:
        'Ciudad antigua excavada en roca rosa, conocida como la ciudad perdida y patrimonio de la humanidad.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/6/60/Al_Khazneh.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Petra+Jordan',
    ),
    TouristSite(
      name: 'Ópera de Sídney',
      country: 'Australia',
      description:
        'Edificio emblemático junto a la bahía, reconocido por su techo en forma de vela y su arquitectura única.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/4/40/Sydney_Opera_House_Sails.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Sydney+Opera+House+Australia',
    ),
    TouristSite(
      name: 'Cristo Redentor',
      country: 'Brasil',
      description:
        'Una estatua monumental sobre Río de Janeiro, símbolo de bienvenida y fe con vistas espectaculares.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/4/49/Cristo_Redentor_-_Rio_de_Janeiro.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Cristo+Redentor+Rio+de+Janeiro',
    ),
    TouristSite(
      name: 'Coliseo',
      country: 'Italia',
      description:
        'Anfiteatro romano clásico donde se realizaban luchas de gladiadores y espectáculos públicos.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/d/de/Colosseo_2020.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Colosseum+Rome',
    ),
    TouristSite(
      name: 'Chichén Itzá',
      country: 'México',
      description:
        'Ruinas mayas con templos y pirámides, un sitio arqueológico emblemático de la cultura mesoamericana.',
      imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/7/7d/Chichen_Itza_3.jpg',
      mapUrl:
        'https://www.google.com/maps/search/?api=1&query=Chichen+Itza+Mexico',
    ),
  ];

  final List<bool> _isFavorite = [];
  final List<int> _favoriteCount = [];

  @override
  void initState() {
    super.initState();
    _isFavorite.addAll(List<bool>.filled(_sites.length, false));
    _favoriteCount.addAll(List<int>.generate(_sites.length, (index) => 41 + index));
  }

  void _toggleFavorite(int index) {
    setState(() {
      if (_isFavorite[index]) {
        _isFavorite[index] = false;
        _favoriteCount[index]--;
      } else {
        _isFavorite[index] = true;
        _favoriteCount[index]++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lugares del mundo')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _sites.length,
        itemBuilder: (context, index) {
          final site = _sites[index];
          return TouristSiteCard(
            site: site,
            favoriteCount: _favoriteCount[index],
            isFavorite: _isFavorite[index],
            onFavoritePressed: () => _toggleFavorite(index),
          );
        },
      ),
    );
  }
}

class TouristSite {
  const TouristSite({
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
    required this.mapUrl,
  });

  final String name;
  final String country;
  final String description;
  final String imageUrl;
  final String mapUrl;
}

class TouristSiteCard extends StatelessWidget {
  const TouristSiteCard({
    super.key,
    required this.site,
    required this.favoriteCount,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  final TouristSite site;
  final int favoriteCount;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSection(imageUrl: site.imageUrl),
          TitleSection(name: site.name, location: site.country),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.map, color: Colors.blue[700]),
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    final uri = Uri.parse(site.mapUrl);
                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      messenger.showSnackBar(const SnackBar(content: Text('No se pudo abrir el mapa')));
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey[600],
                  ),
                  onPressed: onFavoritePressed,
                ),
                Text(
                  '$favoriteCount favoritos',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          const ButtonSection(),
          TextSection(description: site.description),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 200,
          color: Colors.grey[300],
          alignment: Alignment.center,
          child: const Icon(Icons.landscape, size: 60, color: Colors.grey),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Icon(Icons.place, color: Colors.teal[700]),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
            onPressed: () {},
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
            onPressed: () {},
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
      child: Text(
        description,
        softWrap: true,
        style: const TextStyle(fontSize: 14, height: 1.4),
      ),
    );
  }
}
