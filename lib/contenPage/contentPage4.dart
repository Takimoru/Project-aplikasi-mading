import 'package:flutter/material.dart';
import 'package:revuemurale/homepage/homepage.dart';
import 'package:revuemurale/loginPage/login%20page.dart';
import 'package:revuemurale/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ContentPage4 extends StatefulWidget {
  @override
  _ContentPage4State createState() => _ContentPage4State();
}

class _ContentPage4State extends State<ContentPage4> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ContentDetailPage(
      imageAsset: 'assets/images/um4.jpg', // replace with your actual asset path
      title: 'DISKUSI MENJAGA DEMOKRASI DENGAN AJI BALIKPAPAN BAHAS PERAN PERS MAHASISWA',
      description: 'UM – Universitas Mulia menjadi tuan rumah Aliansi Jurnalis Independen (AJI) Kota Balikpapan yang menggelar diskusi tentang Menjaga Demokrasi dengan Penyebaran Informasi Bermutu. Diskusi berlangsung di Ballroom Cheng Ho, Jalan Letjen Zaini Azhar Maulani, Selasa (28/5).\n\n'
            'Direktur Eksekutif Yayasan Airlangga Dr. Agung Sakti Pribadi, dalam sambutannya membuka acara mengatakan bahwa kegiatan ini membuka wawasan kepada mahasiswa dan masyarakat umum serta mendorong publik untuk menyebarkan informasi dan konten di media sosial secara bijak.\n\n'
            'Dr. Agung menyambut positif gagasan kegiatan diskusi dengan para mahasiswa. Ia berharap berawal dari diskusi tersebut Unit Kegiatan Mahasiswa seperti Lembaga Pers Mahasiswa (LPM) mulai aktif kembali.\n\n'
            'Dr. Agung berharap para jurnalis dapat menjadi mentor atau pendidik bagi para mahasiswa. Diharapkan mahasiswa dapat belajar langsung menghasilkan produk jurnalistik yang berkualitas.\n\n'
            'Diskusi diikuti ratusan mahasiswa dari perguruan tinggi di Kota Balikpapan, di antaranya Universitas Mulia, Universitas Balikpapan, dan Politeknik Negeri Balikpapan. Sebagai narasumber jurnalis Antara Novi Abdi, pegiat media sosial Hanna Pertiwi, dan Direktur LBH Samarinda Fathul Huda.',
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
