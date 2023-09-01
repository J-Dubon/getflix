import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getflix/core/widgets/loader_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {

  /// Widget for cached network image
  const CachedNetworkImageWidget({
    required this.imageUrl,
    this.fit = BoxFit.cover,
    super.key
  });

  final String imageUrl;

  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      cacheKey: imageUrl,
      fadeInDuration: const Duration(milliseconds: 150),
      fadeOutDuration: const Duration(milliseconds: 150),
      fit: fit,
      placeholder: (context, url) => const Center(
        child: LoaderWidget(),
      ),
    );
  }
}