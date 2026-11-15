import 'package:flutter/material.dart';

class detailpage extends StatelessWidget {
  final String nama;
  final String gambar;
  final String lokasi;


  const detailpage({ // sebagai construktor untuk memanggil detail page di halaman home page
  super.key,
  required this.nama,
  required this.gambar,
  required this.lokasi,
  });


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nama                                                             // judul halaman mengikuti card mana yang di klik
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,                                    // agar semua konten ada di tengah
          children: [
            ClipRect(                                                   // agar foto terpotong sesuai dengan 
              child: Image.network(
                gambar,                                                 // panggil si gambar
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),

            Text(
              nama,
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 25
              ),
            ),

            Text(
              lokasi,
            ),

            SizedBox(height: 20,),
            SizedBox(
              child: ElevatedButton.icon(                              // buat tombol kembali
                onPressed: () {                                       // saat di tekan
                Navigator.pop(context);                                // arah perginya 
                },
                icon: Icon(Icons.arrow_back),
                label: Text('Kembali'),
              ),
            )
          ],
        ),
      ),
    );


    
  }
}