import 'package:flutter/material.dart';

class NetworkImageWithCircular extends StatelessWidget {
  final String? heroTag;
  final VoidCallback? onTap;
  final String? imageURL;
  const NetworkImageWithCircular(
      {Key? key, this.heroTag, this.onTap, required this.imageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageURL == null
        ? Container()
        : Image.network(
            imageURL!,
            loadingBuilder: loadingBuilder,
            fit: BoxFit.cover,
          );
  }

  Widget loadingBuilder(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}
