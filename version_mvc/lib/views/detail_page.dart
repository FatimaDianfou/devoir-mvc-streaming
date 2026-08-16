import 'package:flutter/material.dart';

import '../models/diffusion.dart';
import '../models/emission.dart';

class DetailPage extends StatelessWidget {
  final Emission emission;
  final List<Diffusion> diffusions;

  const DetailPage({
    super.key,
    required this.emission,
    required this.diffusions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: Colors.amber,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(emission.nom),
              background: Hero(
                tag: emission.id,
                child: Image.asset(
                  emission.cheminImage,
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
                    emission.nom,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    emission.chaine,
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
                      title: Text(d.libelle),
                      trailing: Text(
                        d.heureFormatee,
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
