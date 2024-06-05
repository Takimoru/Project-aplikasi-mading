import 'package:flutter/material.dart';
import 'package:revuemurale/homepage/homepage.dart';
import 'package:revuemurale/loginPage/login page.dart';
import 'package:revuemurale/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ContentDetailPage(
      imageAsset: 'assets/images/um6.jpg', // replace with your actual asset path
      title: 'KIAT DAN STRATEGI MENULIS ALA PROF. ERSIS WARMANSYAH ABBAS',
      description: 'UM – Kuliah umum tentang Kiat dan Strategi Menulis sangat menarik dibawakan oleh Prof. Ersis Warmansyah Abbas, Guru Besar Universitas Lambung Mangkurat. Dengan strateginya ini pula, Prof. Ersis mampu menghasilkan 54 judul buku tentang menulis dalam lima tahun terakhir. Kiat dan strateginya ini kemudian dibagikan kepada para mahasiswa dan dosen Universitas Mulia, bertempat di Ballroom Cheng Ho, Rabu (29/5). Prof. Ersis mendorong para mahasiswa dan dosen bagaimana produktif menulis.\n\n'
          'Direktur Eksekutif Yayasan Airlangga Dr. Agung Sakti Pribadi dalam sambutannya mengatakan sebelumnya mengira Prof. Ersis berambut panjang seperti yang ada pada foto. “Tapi ternyata itu masa lalu,” tuturnya.\n\n'
          'Menurutnya, menjadi seorang penulis hidupnya menyenangkan. “Nanti mahasiswa bisa bertanya banyak setelah mendapatkan ilmunya, bisa juga dapat cerita dari beliau bagaimana sih cara menulis yang bagus,” terangnya.',
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
