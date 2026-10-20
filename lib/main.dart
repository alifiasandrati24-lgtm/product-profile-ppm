
import 'package:flutter/material.dart';

void main() {
  runApp(const ProductProfileApp());
}

const Color primaryColor = Color(0xFF7C4DFF);
const Color accentColor = Color(0xFFFF6B9D);
const Color backgroundColor = Color(0xFFF7F5FC);

class ProductProfileApp extends StatelessWidget {
  const ProductProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product & Profile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const ProductProfilePage(),
    );
  }
}

class ProductProfilePage extends StatelessWidget {
  const ProductProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PPM Sesi 2 - Alifia Sandra (NIM)',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PromoBanner(),
          SizedBox(height: 20),
          SectionTitle(title: 'Profil Mahasiswa'),
          SizedBox(height: 10),
          ProfileCard(),
          SizedBox(height: 24),
          SectionTitle(title: 'Produk Pilihan'),
          SizedBox(height: 10),
          ProductCard(),
          SizedBox(height: 24),
          Center(
            child: Text(
              'PPM Sesi 2 • Flutter Project',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF29213D),
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, accentColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: 15,
            child: Icon(
              Icons.shopping_bag_rounded,
              size: 135,
              color: Colors.white.withValues(alpha: 0.18),
            ),
          ),
          const Positioned(
            left: 20,
            top: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SPECIAL PROMO',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Belanja Lebih Hemat!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Temukan produk favoritmu.',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            right: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'UP TO 50%',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: const Color(0xFFF0E9FF),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Icon(
                Icons.person_rounded,
                color: primaryColor,
                size: 48,
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alifia Sandra',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'NIM: 20240040169',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Prodi: Teknik Informatika',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Kelas: TI24C',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFFB800), size: 19),
                      Icon(Icons.star, color: Color(0xFFFFB800), size: 19),
                      Icon(Icons.star, color: Color(0xFFFFB800), size: 19),
                      Icon(Icons.star, color: Color(0xFFFFB800), size: 19),
                      Icon(Icons.star, color: Color(0xFFFFB800), size: 19),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  int likeCount = 12;
  int quantity = 1;

  final int price = 125000;

  String formatRupiah(int value) {
    final text = value.toString();
    final result = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      result.write(text[i]);

      final remaining = text.length - i - 1;
      if (remaining > 0 && remaining % 3 == 0) {
        result.write('.');
      }
    }

    return 'Rp$result';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 175,
            width: double.infinity,
            color: const Color(0xFFF0E9FF),
            child: Stack(
              children: [
                const Center(
                  child: Icon(
                    Icons.headphones_rounded,
                    size: 100,
                    color: primaryColor,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'BEST SELLER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton.filledTonal(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        likeCount += isFavorite ? 1 : -1;
                      });
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'AUDIO COLLECTION',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Wireless Headphones',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Headphone Bluetooth dengan suara jernih dan desain modern.',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: accentColor,
                      size: 17,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$likeCount Likes',
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFB800),
                      size: 18,
                    ),
                    const Text(' 4.9'),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Kategori: Elektronik',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Text(
                  formatRupiah(price),
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text(
                      'Jumlah',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    IconButton.outlined(
                      onPressed: quantity > 1
                          ? () {
                              setState(() {
                                quantity--;
                              });
                            }
                          : null,
                      icon: const Icon(Icons.remove),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
                const Divider(height: 25),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Total Harga',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Text(
                      formatRupiah(price * quantity),
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '$quantity Wireless Headphones berhasil '
                            'ditambahkan ke keranjang!',
                          ),
                          backgroundColor: primaryColor,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Tambah ke Keranjang',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
