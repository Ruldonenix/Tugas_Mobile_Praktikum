import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  String _gender = 'Pria';
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  double? _hasilBMI;
  String _keterangan = "Masukkan Data Anda!!!";

  void _hapusBMI(){
    setState(() {
      _bbController.clear();
      _tbController.clear();

      _hasilBMI = null;
      _keterangan = "Masukan Data!!!";
    });

  }
  void _hitungBMI(){
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if(bb > 0 && tbCm > 0){
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);

        _hasilBMI = hasil;
        if(hasil < 18.5){
          _keterangan = "Inimah Kurang Gizi Yah Mas";
        }else if(hasil < 25){
          _keterangan = "Ini nih";
        }else if(hasil < 30){
          _keterangan = "Keberatan Yah Mas";
        }else {
          _keterangan = "Itu Orang Apa Pig God?";
        }
      }else {
        _hasilBMI = null;
        _keterangan = "Data Tidak Valid!";
      }
    });
  }

  @override
  void dispose(){
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Kalkulator BMI',
          style: TextStyle(
            fontWeight: .bold,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: Icon(Icons.accessibility),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [


              Card(
                child: Column(
                children: [
                  Text(
                'Pilih Gender',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              RadioListTile<String>(
                title : Text('Pria'),
                value : 'Pria',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),

              RadioListTile<String>(
                title : Text('Wanita'),
                value: 'Wanita',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),

      
                ],
              ),
            ),
              

              SizedBox(height: 15,),

              Card(
                child: Column(
                  children: [
                    Text(
                      'Masukkan Berat Badan Dan Tinggi Badan',
                      style: GoogleFonts.aboreto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                  ],
                ),
              ),

              SizedBox(height: 15,),

              TextField(
                controller: _bbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  icon: Icon(Icons.monitor_weight, size: 30,),
                  labelText: 'Berat Badan',
                  labelStyle: TextStyle(letterSpacing: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),

              SizedBox(height: 15,),
              TextField(
                controller: _tbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  icon: Icon(Icons.height, size: 30,),
                  labelText: 'Tinggi Badan',
                  labelStyle: TextStyle(letterSpacing: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),

              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: _hitungBMI,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  'Hitung BMI',
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white
                    ),
                )
              ),

              SizedBox(height: 15,),
              ElevatedButton(
                onPressed:  _hapusBMI,
                style: ElevatedButton.styleFrom(
                  padding : EdgeInsets.symmetric(vertical : 20),
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  'Hapus DATA BMI',
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white
                    ),
                  )
                ),

              SizedBox(height: 15,),
              Text(
                'Hasil : ',
                textAlign: .center,
              ),

              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? 'Nilai Kosong',
                      style: TextStyle(fontSize: 50, fontWeight: .bold),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      _keterangan,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}