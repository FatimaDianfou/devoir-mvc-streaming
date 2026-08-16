import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'dart:math';

void main() {
  runApp(const MonApplication());
}

// Point d'entree de l'app, rien de special ici, juste le MaterialApp
// avec la page d'accueil qui pointe vers MapremierePage
class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emissions en streaming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        useMaterial3: true,
      ),
      home: const MapremierePage(),
    );
  }
}

// Liste des emissions disponibles. Je les mets ici en dur pour l'instant,
// dans la vraie vie ca viendrait d'une base de donnees ou d'une API
const List<Map<String, String>> emissions = [
  {
    'tag': 'stream-news',
    'image': 'assets/images/news.png',
    'nom': 'Le Journal du Soir',
    'chaine': 'Radio Plus',
  },
  {
    'tag': 'stream-sport',
    'image': 'assets/images/sport.png',
    'nom': 'Tribune Sportive',
    'chaine': 'RTS Sport',
  },
  {
    'tag': 'stream-musique',
    'image': 'assets/images/musique.png',
    'nom': 'Hit Parade',
    'chaine': 'Fun Radio',
  },
  {
    'tag': 'stream-cinema',
    'image': 'assets/images/cinema.png',
    'nom': 'Cinephile',
    'chaine': 'Cine Plus',
  },
  {
    'tag': 'stream-jeunesse',
    'image': 'assets/images/jeunesse.png',
    'nom': 'Recre Kids',
    'chaine': 'Radio Ados',
  },
  {
    'tag': 'stream-doc',
    'image': 'assets/images/documentaire.png',
    'nom': 'Grand Angle',
    'chaine': 'Decouverte FM',
  },
];

class MapremierePage extends StatefulWidget {
  const MapremierePage({super.key});

  @override
  State<MapremierePage> createState() => _MapremierePageState();
}

class _MapremierePageState extends State<MapremierePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Vos emissions en streaming'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: partieGrilleImage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Grille reactive qui affiche toutes les emissions sous forme de cartes
class partieGrilleImage extends StatelessWidget {
  const partieGrilleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: 160,
      minSpacing: 12,
      children: emissions.map((e) {
        return IdentificationStreaming(
          tagStream: e['tag']!,
          imageStream: e['image']!,
          NomStream: e['nom']!,
          ChaineRadio: e['chaine']!,
        );
      }).toList(),
    );
  }
}

// Une carte pour une emission : image, nom, chaine, et on navigue vers
// la page de detail quand on appuie dessus
class IdentificationStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String NomStream;
  final String ChaineRadio;

  const IdentificationStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.NomStream,
    required this.ChaineRadio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumStreaming(
                  tagStream: tagStream,
                  imageStream: imageStream,
                  NomStream: NomStream,
                  ChaineRadio: ChaineRadio,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: tagStream,
                child: Image.asset(
                  imageStream,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      NomStream,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      ChaineRadio,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Page de detail d'une emission, avec l'image en grand (transition hero)
// et une liste de diffusions generees au hasard
class AlbumStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String NomStream;
  final String ChaineRadio;

  const AlbumStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.NomStream,
    required this.ChaineRadio,
  });

  // genere quelques diffusions avec une date au hasard dans les 7
  // prochains jours, juste pour remplir la page
  List<Map<String, String>> genererDiffusions() {
    final random = Random();
    final jours = ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche'];
    final diffusions = <Map<String, String>>[];
    for (int i = 0; i < 5; i++) {
      final jour = jours[random.nextInt(jours.length)];
      final heure = 6 + random.nextInt(16);
      final minute = random.nextInt(60);
      final minuteStr = minute.toString().padLeft(2, '0');
      diffusions.add({
        'label': 'Diffusion du $jour',
        'date': '${heure}h$minuteStr',
      });
    }
    return diffusions;
  }

  @override
  Widget build(BuildContext context) {
    final diffusions = genererDiffusions();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.amber,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(NomStream),
              background: Hero(
                tag: tagStream,
                child: Image.asset(
                  imageStream,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NomStream,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ChaineRadio,
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Prochaines diffusions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Divider(),
                  ...diffusions.map((d) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: IconButton(
                        icon: const Icon(Icons.volume_up, color: Colors.amber),
                        onPressed: () {},
                      ),
                      title: Text(d['label']!),
                      trailing: Text(
                        d['date']!,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
