import 'package:flutter/material.dart';
import 'Laptop.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<Laptop> daftarLaptop = [];

  @override
  void initState() {
    super.initState();
    daftarLaptop.add(Laptop(
      merk: "ASUS",
      tipe: "ROG Zephyrus G14",
      harga: 28500000,
      spek: "Ryzen 9, RAM 16GB, RTX 4060",
      imageUrl: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?q=80&w=500&auto=format&fit=crop",
    ));

    daftarLaptop.add(Laptop(
      merk: "Apple",
      tipe: "MacBook Pro M3",
      harga: 25900000,
      spek: "M3 Chip, RAM 8GB, SSD 512GB",
      imageUrl: "https://cdn.mos.cms.futurecdn.net/mEZx92EDJhkpjyDN92PcRk.jpg",
    ));

    daftarLaptop.add(Laptop(
      merk: "Lenovo",
      tipe: "Legion Slim 5",
      harga: 21000000,
      spek: "Core i7, RAM 16GB, RTX 4050",
      imageUrl: "https://images.unsplash.com/photo-1603302576837-37561b2e2302?q=80&w=500&auto=format&fit=crop",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("P4risssss Store"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: daftarLaptop.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final laptop = daftarLaptop[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      laptop.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.laptop, size: 50),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          laptop.merk,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          laptop.tipe,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          laptop.spek,
                          style: const TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Rp ${laptop.harga.toStringAsFixed(0)}",
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}