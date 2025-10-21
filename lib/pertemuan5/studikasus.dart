import 'package:flutter/material.dart';

void main() {
  runApp(const InstagramProfileApp());
}

class InstagramProfileApp extends StatelessWidget {
  const InstagramProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "p4risssss__",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.alternate_email_outlined, size: 25),
          SizedBox(width: 20),
          Icon(Icons.add_box_outlined, size: 25),
          SizedBox(width: 20),
          Icon(Icons.menu, size: 25),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian profil atas
              Row(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/564x/55/05/55/550555d1c4a1e5bba51499f8a705c73e.jpg",
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ProfileCount(title: "Postingan", count: "3"),
                        ProfileCount(title: "Pengikut", count: "1.073"),
                        ProfileCount(title: "Mengikuti", count: "470"),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),
              const Text(
                "•eccedentesiast",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10),

              // Tombol Edit Profil dan Bagikan Profil
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: const Text("Edit profil"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: const Text("Bagikan profil"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.person_add_alt_1_outlined, size: 20),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // Story highlight
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    StoryCircle(
                      url:
                      "https://awsimages.detik.net.id/community/media/visual/2022/03/25/manga-one-piece_34.webp?w=1200",
                      label: "Baru",
                    ),
                    SizedBox(width: 15),
                    StoryCircle(
                      url:
                      "https://awsimages.detik.net.id/community/media/visual/2022/03/25/manga-one-piece_34.webp?w=1200",
                      label: "HitamPutih",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Divider(color: Colors.grey),

              // Tab menu (grid, reels, tagged)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.grid_on, color: Colors.white),
                  Icon(Icons.video_collection_outlined, color: Colors.grey),
                  Icon(Icons.loop_outlined, color: Colors.grey),
                  Icon(Icons.person_pin_outlined, color: Colors.grey),
                ],
              ),

              const SizedBox(height: 5),

              // Grid foto
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ImagePost(
                      "https://www.decibelmagazine.com/wp-content/uploads/2018/08/tenyardfight.jpg"),
                  ImagePost(
                      "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/81/2024/10/18/artikel-mchc-1890324267.jpg"),
                  ImagePost(
                      "https://d3e6ckxkrs5ntg.cloudfront.net/artists/images/899025/original/resize:901x600/crop:x90y2w709h530/aspect:1.0/hash:1466656591/1360432072_IMG_7779.jpg?1466656591"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video), label: ""),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/564x/55/05/55/550555d1c4a1e5bba51499f8a705c73e.jpg"),
              ),
              label: ""),
        ],
      ),
    );
  }
}

class ProfileCount extends StatelessWidget {
  final String title;
  final String count;
  const ProfileCount({required this.title, required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class StoryCircle extends StatelessWidget {
  final String url;
  final String label;
  const StoryCircle({required this.url, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: CircleAvatar(radius: 35, backgroundImage: NetworkImage(url)),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class ImagePost extends StatelessWidget {
  final String url;
  const ImagePost(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(url, fit: BoxFit.cover);
  }
}
