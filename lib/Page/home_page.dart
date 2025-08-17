import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/place.dart';
import 'PlaceDetailsPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  int bottomNavIndex = 0;

  final List<String> tabs = ["Most Viewed", "Nearby", "Latest"];

  final List<Place> places = [
    Place(
      image: "assets/mount fuji.png",
      title: "Mount Fuji, Tokyo",
      location: "Tokyo, Japan",
      rating: "4.8",
      price: 250,
      duration: "6 hours",
      temperature: "12℃",
      description:
      "Mount Fuji is the tallest mountain in Japan and a popular destination for tourists and hikers. It offers breathtaking views and is considered a sacred symbol of Japan.",
    ),
    Place(
      image: "assets/andes mountain.png",
      title: "Andes Mountain",
      location: "South America",
      rating: "4.6",
      price: 230,
      duration: "8 hours",
      temperature: "16℃",
      description:
      "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavItem(Icons.home, 0),
          _buildBottomNavItem(Icons.access_time, 1),
          _buildBottomNavItem(Icons.chat_bubble_outline, 2),
          _buildBottomNavItem(Icons.person_outline, 3),
        ],
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hi, David ',
                            style: GoogleFonts.montserrat(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("👋", style: TextStyle(fontSize: 24)),
                        ],
                      ),
                      Text(
                        'Explore the world',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: const Color(0xff888888),
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=3",
                    ),
                  ),
                ],
              ),
            ),

            /// Search Bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search places",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(Icons.tune, color: Colors.black87),
                ],
              ),
            ),

            /// Popular Places Title
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular places',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff888888),
                    ),
                  ),
                ],
              ),
            ),

            /// Tabs
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color:
                        isSelected ? Colors.black : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black54,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            /// Places cards
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaceDetailsPage(place: place),
                        ),
                      );
                    },
                    child: Container(
                      width: 250,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(place.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 12,
                            top: 12,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              child: const Icon(Icons.favorite_border,
                                  color: Colors.black),
                            ),
                          ),
                          Positioned(
                            left: 12,
                            bottom: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: Colors.white, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        place.location,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.star,
                                          color: Colors.yellow, size: 16),
                                      Text(
                                        place.rating,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Bottom Navigation Item مع النقطة الحمرا
  BottomNavigationBarItem _buildBottomNavItem(IconData icon, int index) {
    final isSelected = bottomNavIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(icon, color: isSelected ? Colors.black : Colors.grey),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      label: "",
    );
  }
}
