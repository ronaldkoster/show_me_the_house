import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoverImage extends StatelessWidget {
  final String _imageURL;

  const CoverImage({Key? key, required String imageURL})
      : _imageURL = imageURL,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _imageURL == ""
        ? Container(
            height: 200,
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported_outlined,
              color: Colors.grey,
              size: 128,
            ))
        : Image.network(
            _imageURL,
          );
  }
}
