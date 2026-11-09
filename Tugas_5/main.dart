import 'package:flutter/material.dart';
import 'package:tugas_5/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhoneShop',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> phones = [

      {
        'name' : 'Nubia REDMAGIC 11 Pro',
        'image' : 'https://images.tokopedia.net/img/cache/700/aphluv/1997/1/1/9a427af14c884628baab64480a355b15~.jpeg.webp',
        'description' : 'Gaming Extreme, Performa Monster',
        'stock' : '20 unit',
        'harga' : '19.999.000'
      },
      {
        'name' : 'IQOO Neo 10',
        'image' : 'https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1748604480744/f263fda7ba33e766aba5247753fa5441.png',
        'description' : 'Performa Gaming Terbaik Di Kelasnya',
        'stock' : '100 unit',
        'harga' : 'Rp 5.999.000 - Rp 7.499.000'
      },
      {
        'name' : 'IQOO 15',
        'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT71xUKH0LLsQn6lFhecYlPgKZ75yFVGHGMKXZHMLRNNw&s=10',
        'description' : 'Flagship dengan Performa Monster ',
        'stock' : '20 unit',
        'harga' : 'Rp 12.999.000 - Rp 15.999.000'
      },
      {
        'name' : 'Samsung S26 Ultra',
        'image' : 'https://shop.maujual.com/cdn/shop/files/Black_81f5c36c-4ead-4d14-8676-e6b8dc42ad11.png?crop=center&height=705&v=1777397433&width=940',
        'description' : 'Flagship Sultan, Kamera Profesional',
        'stock' : '15 unit',
        'harga' : 'Rp 22.499.000 - Rp 24.499.000'
      },
      {
        'name' : 'IQOO Z10',
        'image' : 'https://asia-exshopstatic-vivofs.vivo.com/KuCZNhz3cVxH4yrP/id/1759135588558/548c29cbbba4c8f6b3753378bcaefc47.png_w860-h860.webp',
        'description' : 'Monster Baterai, Anti Lowbat Seharian',
        'stock' : '10 unit',
        'harga' : 'Rp 4.299.000 - Rp 5.499.000'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Align(
          child: Text('List Handphone'),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        leading: Icon(Icons.shopping_bag_sharp),
        actions: [
          Icon(Icons.shopping_bag_sharp)
        ],
        
      ),
      body: ListView.builder(
        itemCount: phones.length,
        itemBuilder: (context, index) {
          final phone = phones[index];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
            color: Colors.blueGrey,
            child: ListTile(
              leading: ClipRect(
                child: Image.network(
                  phone['image']!,
                  width: 60,
                  height: 65,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      child: Icon(Icons.smartphone),
                    );
                  }
                ),
              ),

              title: Text(
                phone['name']!,
                style: TextStyle(fontWeight: .bold, fontSize: 20),
              ),

              subtitle: Text(
                phone['description']!,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right,fontWeight: .bold,), // agar icons ada di kanan
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      name: phone['name']!,
                      image: phone['image']!,
                      description: phone['description']!,
                      stock: phone['stock']!,
                      harga: phone['harga']!,

                    ),
                  )
                );
              },
            ),
          );
        },
      ),
    );
  }
}