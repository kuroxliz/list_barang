import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 35,
                color: Colors.red,
                fontWeight: FontWeight.bold,
                height: 4.0,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Barang()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class Barang extends StatefulWidget {
  @override
  _BarangState createState() => _BarangState();
}

class _BarangState extends State<Barang> {
  List<Map<String, dynamic>> belanja = [
    {'nama': 'ikan', 'harga': 'Harga : Rp 10,000'},
    {'nama': 'apel', 'harga': 'Harga : Rp 5,000'},
    {'nama': 'sepatu', 'harga': 'Harga : Rp 150,000'},
    {'nama': 'ayam', 'harga': 'Harga : Rp 20,000'},
    {'nama': 'udang', 'harga': 'Harga : Rp 30,000'},
    {'nama': 'jeruk', 'harga': 'Harga : Rp 8,000'},
    {'nama': 'kertas', 'harga': 'Harga : Rp 3,000'},
    {'nama': 'baju', 'harga': 'Harga : Rp 50,000'},
    {'nama': 'nasi', 'harga': 'Harga : Rp 7,000'},
    {'nama': 'wortel', 'harga': 'Harga : Rp 4,000'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
          title: Text('Data Produk'),
          bottom: AppBar(
            title: Text('Filter'),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              )
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: belanja.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                title: Text(
                  belanja[index]['nama'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Atur teks menjadi bold di sini
                  ),
                ),
                subtitle: Text(
                  belanja[index]['harga'],
                  style: TextStyle(fontSize: 12.0),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}