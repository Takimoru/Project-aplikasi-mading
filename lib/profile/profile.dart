import 'package:flutter/material.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ProfileRow(
              profilePhoto: 'assets/images/nico.jpg',
              name: 'Nicolaos Tzakis',
              description:
              'Saya adalah seorang mahasiswa S1 Informatika yang sedang menempuh pendidikan di Universitas Mulia',
            ),
            SizedBox(height: 20),
            ProfileRow(
              profilePhoto: 'assets/images/reyvaldi.jpg',
              name: 'Reyvaldi Nur Rahmatullah',
              description:
              'Saya adalah seorang mahasiswa S1 Informatika yang sedang menempuh pendidikan di Universita Mulia',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String profilePhoto;
  final String name;
  final String description;

  const ProfileRow({
    required this.profilePhoto,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: CircleAvatar(
            backgroundImage: AssetImage(profilePhoto),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
