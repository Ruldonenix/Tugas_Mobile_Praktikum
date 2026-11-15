import 'package:flutter/material.dart';
import 'package:tugas_6/homepage.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> travelData = [ // buat array pakai list
  {
    'nama' : 'Senso-ji',
    'gambar' : 'https://images.unsplash.com/photo-1706813253696-10ee6332edd3?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Jepang',
  },
  {
    'nama' : 'Meiji-jingu',
    'gambar' : 'https://images.unsplash.com/photo-1703443371292-0d9081cc4787?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Jepang',
  },
  {
    'nama' : 'Akihabara',
    'gambar' : 'https://images.unsplash.com/photo-1676902944837-37695b5378c4?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Jepang',
  },
  {
    'nama' : 'Gunma',
    'gambar' : 'https://images.unsplash.com/photo-1764057146019-6d16a9b0a44a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Jepang',
  },
  {
    'nama' : 'Raja Ampat',
    'gambar' : 'https://images.unsplash.com/photo-1703769605297-cc74106244d9?q=80&w=1484&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Indonesia',
  },
  {
    'nama' : 'Karang Potong',
    'gambar' : 'https://assets.promediateknologi.id/crop/0x0:0x0/1200x0/webp/photo/2022/08/19/3680671043.jpg',
    'lokasi' : 'Indonesia',
  },
  {
    'nama' : 'Pantai Parangtritis',
    'gambar' : 'https://plus.unsplash.com/premium_photo-1728117267325-534ccbd21a5f?q=80&w=1468&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Indonesia',
  },
  {
    'nama' : 'Candi Borobudur',
    'gambar' : 'https://images.unsplash.com/photo-1689904575573-ac10f7edc6f9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    'lokasi' : 'Indonesia',
  }
  
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Wisata',
      debugShowCheckedModeBanner: false,
      home: Homepage(travelData: travelData),
      theme: ThemeData( // tema AppBar
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        )
      ),
    );
  }
}