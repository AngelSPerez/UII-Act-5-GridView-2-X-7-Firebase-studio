import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReciveRecipe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8939EF),
        ),
        useMaterial3: true,
      ),
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final List<Map<String, String>> _recipes = [
    {
      'name': 'Boneless',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/boneless.webp',
    },
    {
      'name': 'Pizza',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/pizza.jpg',
    },
    {
      'name': 'Flan',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/Spanish-Desserts.jpeg',
    },
    {
      'name': 'Pasta Alfredo',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/Fettuccine-Alfredo-Recipe-1.jpg',
    },
    {
      'name': 'Pay de Manzana',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/maxresdefault.jpg',
    },
    {
      'name': 'Sandwich',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/23132.jpg',
    },
    {
      'name': 'Torta de Jamón',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/torta-de-jamon.jpg',
    },
    {
      'name': 'Pollo Asado',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/Pollo-asado-Jordi-Cruz.jpg',
    },
    {
      'name': 'Galletas',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/R.jpeg',
    },
    {
      'name': 'Pay de Manzana',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/maxresdefault.jpg',
    },
    {
      'name': 'Pay de Queso',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/OIP.webp',
    },
    {
      'name': 'Alitas',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/refs/heads/main/OIP%20(1).webp',
    },
    {
      'name': 'Hot Cakes',
      'image':
          'https://raw.githubusercontent.com/AngelSPerez/imagenes/81454e69e60c2374c8ba8bee301d266a8cb8e8f0/adadsa.webp',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF8939EF),
          automaticallyImplyLeading: false,
          elevation: 2,
          centerTitle: true,
          title: const Text(
            'ReciveRecipe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            itemCount: _recipes.length,
            itemBuilder: (context, index) {
              final recipe = _recipes[index];
              return _RecipeCard(
                name: recipe['name']!,
                imageUrl: recipe['image']!,
                rating: 4.5,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double rating;

  const _RecipeCard({
    required this.name,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 140,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          _StarRating(rating: rating),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

class _StarRating extends StatelessWidget {
  final double rating;

  const _StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        if (rating >= starValue) {
          return const Icon(Icons.star, color: Colors.amber, size: 20);
        } else if (rating >= starValue - 0.5) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 20);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 20);
        }
      }),
    );
  }
}