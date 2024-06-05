import 'package:flutter/material.dart';
import 'package:revuemurale/homepage/homepage.dart';
import 'package:revuemurale/loginPage/login%20page.dart';
import 'package:revuemurale/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:revuemurale/loginPage/login page.dart'; // Ensure this import is correct

class ContentPage2 extends StatefulWidget {
  @override
  _ContentPage2State createState() => _ContentPage2State();
}

class _ContentPage2State extends State<ContentPage2> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ContentDetailPage(
      imageAsset: 'assets/images/um1.jpg', // replace with your actual asset path
      title: 'KATA DOSEN UNIVERSITAS MULIA, POLA PIKIR MENENTUKAN KEBERHASILAN WIRAUSAHA',
      description: 'UM – Dosen Universitas Mulia melaksanakan Bimbingan Teknis Kewirausahaan Usaha Mikro Kecil Menengah (UMKM), Dinas Koperasi Usaha Kecil Menengah dan Perdagangan Kota Bontang, bertempat di Hotel Grand Tiga Mustika Balikpapan, Kamis (30/5). Dosen itu adalah Istia Budi, S.T., M.M dan Gabriela Sibarani, S.Kom., M.Ds.\n\n'
        'Dalam pengantarnya, Istia Budi yang juga sebagai Trainer pada Layanan UMKM Naik Kelas (LUNAS) ini mengatakan bahwa dalam bimbingan teknis ini dirinya membahas materi tentang membangun kewirausahaan.\n\n'
        '“Diantaranya adalah memahami kewirausahaan, melakukan perencanaan bisnis, latihan-latihan serta umpan balik dari seluruh peserta,” ujar Istia Budi.\n\n'
        'Menurutnya, seorang wirausahawan sukses memiliki karakter kreatif, mampu menangkap peluang, berani mengambil resiko, dan dapat memanfaatkan potensi di sekitarnya.\n\n'
        'Bukan hanya itu, ia menambahkan, menjadi wirausahawan juga harus menyukai tantangan, memiliki daya tahan yang tinggi, memiliki visi jauh ke depan serta mampu memberikan yang terbaik dan adaptif terhadap perkembangan teknologi dan zaman.\n\n'
        '“Pola pikir kita menentukan keberhasilan nasib kita,” ujarnya. Pasalnya, menurutnya, bermula dari pikiran, maka perkataan seseorang itu muncul. Kemudian turun menjadi perbuatan, kebiasaan, karakter, lalu kemudian nasib.\n\n'
        'Oleh karena itu, di dalam mengembangkan Entrepreneurship, Istia Budi mengajak seluruh peserta untuk mengawalinya dengan pikiran yang sehat, percaya diri, dan sikap optimis.\n\n'
        'Seorang entrepreneur, menurutnya, harus bermimpi tentang meraih kesuksesan bisnis. Ini membantu mengarahkan fokus membangun bisnis yang kuat dan berkelanjutan.'
    ),
    ProfilePages(), // Ensure this widget is properly defined
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Ensure this widget is properly defined
    );
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'RevueMurale',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _navigateToHomePage();
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ContentDetailPage extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  ContentDetailPage({required this.imageAsset, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageAsset),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
