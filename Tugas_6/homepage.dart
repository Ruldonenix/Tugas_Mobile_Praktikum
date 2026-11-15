import 'package:flutter/material.dart';
import 'package:tugas_6/detail_page.dart';

class Homepage extends StatelessWidget {

  final List<Map<String ,String>> travelData;

  const Homepage({super.key, required this.travelData}); // cara lain selain import

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Wisata'),
          


          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize .label, //ukuran nya mengikuti label
            tabs: [
              Tab( // tab 1
                icon: Icon(Icons.view_agenda_sharp),
                text: 'List View',
              ), 

              Tab( // Tab 2
                icon: Icon(Icons.grid_view_sharp),
                text: 'Grid View',
              )
            ]
          ),
        ),




        body: TabBarView(
          children: [ //panggil fungsi yang sudah di buat
            buildListView(),
            buildGridView(),
          ]
        ),
      )
    );
    
  }

  Widget buildListView(){
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: travelData.length, // memanggil data TravelData
      itemBuilder:(context, index) {
        final item = travelData[index];                                       // membuat variable final untuk menggantikan traveldata
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),

          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: ClipRect(
              child: Image.network(
                item['gambar']!,
                width: 80,
                fit: BoxFit.cover, // agar gambar menyamai dengan ukuran card
                
              ),
            ),

            title: Text(
              item['nama']!
              
            ),
            subtitle: Text(
              item['lokasi']!
            ),

            trailing: Icon(Icons.chevron_right),

            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => detailpage(    // panggil array nya
                    nama: item['nama']!, 
                    gambar: item['gambar']!, 
                    lokasi: item['lokasi']!,
                  ),
                  
                ),
              );
            },
          ),



        );
      },
    );
  }

  Widget buildGridView(){
    return GridView.builder(
      padding: EdgeInsets.all(16),
      itemCount: travelData.length,

      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // mau berapa tampilan grid di tampilkan
        mainAxisSpacing: 16, //jarak atas bawah
        crossAxisSpacing: 16, //jarak kiri kanan
        childAspectRatio: 1, // ratio dari kolom kolom
      ), 

      itemBuilder: (context, index) {
        final item = travelData[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

          ),

          clipBehavior: Clip.antiAlias,                                 // agar gambar tidak keluar

          child :InkWell(                                       //gridView tidak punya ontap bawaan jadi child bungkus pakai InkWell
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailpage(
                    nama: item['nama']!, 
                    gambar: item['gambar']!, 
                    lokasi: item['lokasi']!
                  ),
                )  
              );
            },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item['gambar']!,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black87,
                      Colors.transparent
                    ]
                  )
                ),
              ),

              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['nama']!,
                    style: TextStyle(color: Colors.white),
                    ),
                    Text(item['lokasi']!,
                    style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ),




            ],
          ),

          ),
        );
      },
    );
  }
}