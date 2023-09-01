import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.imageUrl,
    required this.title,
    required this.index,
    this.onTap,
    super.key
  });

  /// Image url of the movie
  final String imageUrl;

  /// Title of the movie
  final String title;

  /// Index of the movie
  final int index;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
      
            // Movie Image
            Container(
              height: (index % 6 + 1) * 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
      
            // // Movie Title
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0),
            //   child: Text(
            //     title,
            //     style: const TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}