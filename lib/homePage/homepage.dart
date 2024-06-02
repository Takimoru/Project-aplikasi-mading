import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:revuemurale/loginPage/login page.dart';
import 'package:revuemurale/contenPage/contentPage.dart';
import 'package:revuemurale/contenPage/contentPage1.dart';
import 'package:revuemurale/contenPage/contentPage2.dart';
import 'package:revuemurale/contenPage/contentPage3.dart';
import 'package:revuemurale/contenPage/contentPage4.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePageContent(),
    MessagesPage(),
    ProfilePage(),
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
      MaterialPageRoute(builder: (context) => LoginPage()),
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
                Navigator.pop(context);
                onTabTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Messages'),
              onTap: () {
                Navigator.pop(context);
                onTabTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                onTabTapped(2);
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
            icon: Icon(Icons.mail),
            label: 'Messages',
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

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
          GestureDetector(
          onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ContentPage()), // Replace ContentPage with your desired page
    );
    },
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFFFAF7F7), // Background color set to hex FAFAFA
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/images/suichan.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
    'Kabar Hari Ini',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    ),
    GridView.count(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    children: [
    placeWidget(
    context: context,
    imageUrl: 'assets/images/suichaaan.jpg',
    description: 'info olimpiade.',
    contentPageId: 'info_1', // Unique ID for this content page
    ),
    placeWidget(
    context: context,
    imageUrl: 'assets/images/ayang.jpg',
    description: 'info kkn.',
    contentPageId: 'info_2', // Unique ID for this content page
    ),
    placeWidget(
    context: context,
    imageUrl: 'assets/images/hoshi.jpg',
    description: 'info magang.',
      contentPageId: 'info_3', // Unique ID for this content page
    ),
      placeWidget(
        context: context,
        imageUrl: 'assets/images/suiseihocimachi.jpg',
        description: 'Info loker.',
        contentPageId: 'info_4', // Unique ID for this content page
      ),
    ],
    ),
          ],
      ),
    );
  }

  Widget placeWidget({
    required BuildContext context,
    required String imageUrl,
    required String description,
    required String contentPageId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to different content pages based on the contentPageId
          switch (contentPageId) {
            case 'info_1':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage1()),
              );
              break;
            case 'info_2':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage2()),
              );
              break;
            case 'info_3':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage3()),
              );
              break;
            case 'info_4':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContentPage4()),
              );
              break;
            default:
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE0DDDD), // Background color set to hex E0DDDD
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 130,
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 1.0),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Messages Page"),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Page"),
    );
  }
}


