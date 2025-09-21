import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Untuk debugPaintSizeEnabled

void main() {
  debugPaintSizeEnabled = true; // Aktifkan debug layout (opsional, bisa matikan nanti)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget II Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Widget II Examples')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Contoh Container (Halaman 9-14: Lake Toba App)
              const LakeTobaContainerExample(),

              // Contoh GridView (Halaman 17-19)
              const SizedBox(height: 20, child: Text('GridView Example', style: TextStyle(fontWeight: FontWeight.bold))),
              const GridViewExample(),

              // Contoh ListView (Halaman 20-22)
              const SizedBox(height: 20, child: Text('ListView Example', style: TextStyle(fontWeight: FontWeight.bold))),
              const ListViewExample(),

              // Contoh Stack (Halaman 23-24)
              const SizedBox(height: 20, child: Text('Stack Example', style: TextStyle(fontWeight: FontWeight.bold))),
              const StackExample(),

              // Contoh Card (Halaman 25-28)
              const SizedBox(height: 20, child: Text('Card Example', style: TextStyle(fontWeight: FontWeight.bold))),
              const CardExample(),

              // Contoh ListTile (Halaman 29-31)
              const SizedBox(height: 20, child: Text('ListTile Example', style: TextStyle(fontWeight: FontWeight.bold))),
              const ListTileExample(),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Contoh Container: Lake Toba (Halaman 9-14) ---
class LakeTobaContainerExample extends StatelessWidget {
  const LakeTobaContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ImageSection(image: 'assets/images/toba1.jpeg'),
          TitleSection(name: 'Lake Toba', location: 'Samosir, North Sumatra'),
          ButtonSection(),
          TextSection(
            description: 'Lake Toba (Indonesian: Danau Toba, Toba Batak: Tao Toba) is a large '
                'natural lake in North Sumatra, Indonesia, occupying the caldera of '
                'the Toba supervolcano. The lake is located in the middle of '
                'the northern part of the island of Sumatra, with a surface elevation '
                'of about 900 metres (2,953 ft), the lake stretches '
                'from 2.88°N 98.52°E to 2.35°N 99.1°E. '
                'The lake is about 100 kilometres (62 miles) long, 30 kilometres (19 mi) wide, '
                'and up to 505 metres (1,657 ft) deep. It is the largest lake in Indonesia '
                'and the largest volcanic lake in the world. '
                'Toba Caldera is one of twenty geoparks in Indonesia, '
                'and was recognised in July 2020 as one of the UNESCO Global Geoparks.',
          ),
        ],
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
      padding: const EdgeInsets.all(32),
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited ? const Icon(Icons.star) : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$_favoriteCount'))),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({super.key, required this.color, required this.icon, required this.label});

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

// --- Contoh GridView (Halaman 17-19) ---
class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Batasi tinggi agar tidak overflow di demo
      child: GridView.extent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        primary: false,
        padding: const EdgeInsets.all(16),
        children: List.generate(12, (index) => Container(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Image.asset('assets/images/flutter.png'),
        )),
      ),
    );
  }
}

// --- Contoh ListView (Halaman 20-22) ---
class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Batasi tinggi
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: const <Widget>[
          ListTile(title: Text('115 - Manajemen Bisnis', style: TextStyle(fontSize: 20, color: Colors.yellow))),
          ListTile(title: Text('125 - Akuntansi Bisnis', style: TextStyle(fontSize: 20, color: Colors.yellow))),
          ListTile(title: Text('205 - Ilmu Hukum', style: TextStyle(fontSize: 20, color: Colors.red))),
          ListTile(title: Text('315 - Arsitektur', style: TextStyle(fontSize: 20, color: Colors.blue))),
          ListTile(title: Text('325 - Teknik Sipil', style: TextStyle(fontSize: 20, color: Colors.blue))),
          ListTile(title: Text('345 - Teknik Persencanaan Wilayah dan Kota', style: TextStyle(fontSize: 20, color: Colors.blue))),
          ListTile(title: Text('405 - Kedokteran', style: TextStyle(fontSize: 20, color: Colors.green))),
          ListTile(title: Text('515 - Teknik Mesin', style: TextStyle(fontSize: 20, color: Colors.blue))),
          ListTile(title: Text('525 - Teknik Elektro', style: TextStyle(fontSize: 20, color: Colors.blue))),
          ListTile(title: Text('535 - Teknik Informatika', style: TextStyle(fontSize: 20, color: Colors.purple))),
          ListTile(title: Text('545 - Teknik Industri', style: TextStyle(fontSize: 20, color: Colors.blue))),
          ListTile(title: Text('615 - Desain Interior', style: TextStyle(fontSize: 20, color: Colors.brown))),
          ListTile(title: Text('625 - Desain Komunikasi Visual', style: TextStyle(fontSize: 20, color: Colors.brown))),
          ListTile(title: Text('705 - Psikologi', style: TextStyle(fontSize: 20, color: Colors.cyan))),
          ListTile(title: Text('825 - Sistem Informasi', style: TextStyle(fontSize: 20, color: Colors.purple))),
          ListTile(title: Text('835 - Sistem Komputer', style: TextStyle(fontSize: 20, color: Colors.purple))),
          ListTile(title: Text('915 - Ilmu Komunikasi', style: TextStyle(fontSize: 20, color: Colors.orange))),
        ],
      ),
    );
  }
}

// --- Contoh Stack (Halaman 23-24) ---
class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Image.asset('assets/images/flutter.png', height: 250, width: 250),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 100, left: 50),
            child: Image.asset('assets/images/flutter.png', height: 250, width: 250),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 140),
            child: const Text(
              "Contoh Stack untuk menimpa satu gambar dengan gambar lain dan text",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Contoh Card (Halaman 25-28) ---
class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.grey,
              elevation: 5,
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(10)),
                  Image.asset('assets/images/flutter.png', scale: 10),
                  ListTile(
                    title: const Text('Flutter 01', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                    subtitle: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Curabitur mattis efficitur nulla, sed fringilla orci lobortis a. '
                          'Nunc rhoncus vel lorem eu aliquam. Fusce vestibulum odio nec '
                          'consequat vehicula. Duis nec venenatis odio, vel dapibus est. '
                          'Phasellus at enim fringilla, ullamcorper ipsum quis, ornare sapien. '
                          'Vivamus non nunc eu tellus molestie porta. Proin a elementum quam. '
                          'Nunc malesuada metus sit amet ante porttitor scelerisque. '
                          'Nulla gravida et metus mattis tincidunt. Pellentesque sodales tincidunt tortor, '
                          'in pharetra mauris tempus in.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tambahkan card kedua jika mau, mirip di PDF
          Container(
            padding: const EdgeInsets.all(5),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.grey,
              elevation: 5,
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(10)),
                  Image.asset('assets/images/flutter.png', scale: 10),
                  ListTile(
                    title: const Text('Flutter 02', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                    subtitle: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Curabitur mattis efficitur nulla, sed fringilla orci lobortis a. '
                          'Nunc rhoncus vel lorem eu aliquam. Fusce vestibulum odio nec '
                          'consequat vehicula. Duis nec venenatis odio, vel dapibus est. '
                          'Phasellus at enim fringilla, ullamcorper ipsum quis, ornare sapien. '
                          'Vivamus non nunc eu tellus molestie porta. Proin a elementum quam. '
                          'Nunc malesuada metus sit amet ante porttitor scelerisque. '
                          'Nulla gravida et metus mattis tincidunt. Pellentesque sodales tincidunt tortor, '
                          'in pharetra mauris tempus in.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Contoh ListTile (Halaman 29-31) ---
class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 10)),
          const Card(child: ListTile(title: Text('ListTile Satu Baris'))),
          Card(
            child: const ListTile(
              title: Text('ListTile Dua Baris'),
              subtitle: Text('Yang diatas Title, yang ini subtitle'),
            ),
          ),
          Card(
            child: const ListTile(
              title: Text('List Title 3 Baris yang mencakup Icon'),
              subtitle: Text('Berkat panjangnya subtitle pada ListTile secara tidak langsung dapat disebut lebih dari 3 line'),
              isThreeLine: true,
            ),
          ),
          Card(
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text('List Tile dengan Icon disamping'),
              subtitle: Text('Sebelah kiri ini logo home'),
            ),
          ),
          Card(
            child: const ListTile(
              leading: Icon(Icons.navigation),
              title: Text('List tile dengan Icon dan Menu'),
              subtitle: Text('Sebelah kiri ini logo Icon dan sebelah kanan menu burger'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}

