import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_7/cart_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModel(),
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Asesoris Laptop',
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final products = [
    Product('FANTECH ATOM MORI SERIES Keyboard Mechanical'),
    Product('FANTECH RAIGOR WG12R Silent Hitam'),
    Product('Xiaomi Redmi 20000mAh 18W Fast Charging'),
    Product('Stand Laptop Alumunium Stand Holder'),
    Product('SanDisk CZ50 Cruzer Blade 16GB/32GB/64GB/128GB'),
    Product('Original Lenovo Thinkplus GM2 Pro'),
    Product('Cooling Fan CozHere 2/6 FAN'),
    Product('FANTECH Shooter III WGP13S'),
    Product('Rexus KX3'),
    Product('Desk Mat Gaming XL'),
    Product('Rexus Daxa Sedna SL1'),
    Product('Ajazz AK820 Dual Tone 75% Mechanical Keyboard'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TECHNOCID'),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 20),
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return Badge(
                  label: Text('${cart.totalItems}'),
                  isLabelVisible: cart.totalItems > 0,
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => CartPage())
                      );
                    }, 
                    icon: Icon(Icons.shopping_cart),
                  ),
                );
              },
            ), 
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          final product = products[index];
          return ListTile(
            title: Text(product.nama),
            shape: BoxBorder.fromLTRB(bottom: BorderSide()),
            trailing: IconButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(product);
              },
              icon: Icon(Icons.shopping_cart_checkout),
            ),
          );
        }
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHECKOUT'),
        backgroundColor: Colors.blue,
      ),

      body: Consumer<CartModel>(                                                                       
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {                                                                    
            return Text('Keranjang Kosong');
          }

          return ListView.builder(                                                                    
            itemCount: cart.items.length,                                                             
            itemBuilder: (context, index) =>ListTile(                               
              title: Text(cart.items[index].nama),  
              shape: BoxBorder.fromLTRB(bottom: BorderSide()),
              trailing: IconButton(
                onPressed: (){
                  Provider.of<CartModel>(context ,listen: false).delete(cart.items[index]);
                }, 
                icon: Icon(Icons.delete) 
              ),                         
            )

          );
        },
      ),
    );
  }
}