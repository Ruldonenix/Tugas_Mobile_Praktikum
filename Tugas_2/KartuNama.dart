import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KartuNama extends StatelessWidget {
  const KartuNama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/NeroDMC5.jpg'),
              radius: 80,
            ),
            Text(
              'Syahrul',
              style: GoogleFonts.aboreto(
                fontSize: 40,
                color: Colors.white,
                fontWeight: .bold,
                letterSpacing: 4
              ),
            ),
            Text(
              'Mahasigma',
              style: GoogleFonts.aboreto(
                color: Colors.white,
                fontWeight: .bold,
                height: 3,
              ),
            ),
            Icon(Icons.person),
            SizedBox(
              height: 100,
              width: 300,
              child: Divider(color: Colors.white,),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(40),
                side: BorderSide(color: Colors.black, width: 3),
              ),
              child: ListTile(
                textColor: Colors.black,
                leading: Icon(Icons.gamepad, size: 25, color: Colors.black,),
                title: Text('Bidzyx', style: TextStyle(fontSize: 20),),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(40),
                side: BorderSide(color: Colors.black, width: 3),
              ),
              child: ListTile(
                textColor: Colors.black,
                leading: Icon(Icons.email, size: 25, color: Colors.black,),
                title: Text('syahruls90807512@gmail.com', style: TextStyle(fontSize: 20),)
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(40),
                side: BorderSide(color: Colors.black, width: 3),
              ),
              child: ListTile(
                textColor: Colors.black,
                leading: Icon(Icons.facebook, size: 25, color: Colors.black,),
                title: Text('Rull', style: TextStyle(fontSize: 20),)
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(40),
                side: BorderSide(color: Colors.black, width: 3),
              ),
              child: ListTile(
                textColor: Colors.black,
                leading: Icon(Icons.tiktok, size: 25, color: Colors.black,),
                title: Text('@donezyx_', style: TextStyle(fontSize: 20),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}