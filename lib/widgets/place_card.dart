import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceCard extends StatelessWidget {
  final Place place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 15, top: 10, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(place.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.7),
              child: const Icon(Icons.favorite_border, color: Colors.black),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.white70),
                      const SizedBox(width: 5),
                      Text(place.location,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 13)),
                      const Spacer(),
                      const Icon(Icons.star,
                          size: 16, color: Colors.yellowAccent),
                      const SizedBox(width: 3),
                      Text(place.rating,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
