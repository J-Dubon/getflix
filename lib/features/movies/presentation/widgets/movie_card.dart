import 'package:flutter/material.dart';
import 'package:getflix/core/widgets/cached_network_image_widget.dart';

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

  /// On tap function of the movie
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [

            SizedBox(
              height: (index % 4 + 2) * 100,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImageWidget(
                  imageUrl: imageUrl,
                ),
              ),
            )
      
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