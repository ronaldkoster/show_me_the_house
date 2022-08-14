import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageGalleryPage extends StatelessWidget {
  final List<String> _imageURLs;
  const ImageGalleryPage({Key? key, required List<String> imageURLs})
      : _imageURLs = imageURLs,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            Expanded(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                ),
                itemCount: _imageURLs.length,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Image.network(_imageURLs[itemIndex]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
