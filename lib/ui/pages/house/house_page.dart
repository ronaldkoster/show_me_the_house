import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../client/client.dart';
import '../../widgets/error_retry.dart';
import 'bloc/house_bloc.dart';
import 'widgets/address.dart';
import 'widgets/cover_image.dart';
import 'widgets/description.dart';
import 'widgets/image_gallery.dart';
import 'widgets/location.dart';

class HousePage extends StatelessWidget {
  final String _houseID;

  const HousePage({
    Key? key,
    required houseID,
  })  : _houseID = houseID,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<HouseBloc>(
      create: (_) {
        final client = Provider.of<HousingClient>(context);
        final bloc = HouseBloc(client: client);
        bloc.add(GetHouse(_houseID));

        return bloc;
      },
      child: Scaffold(
        body: BlocBuilder<HouseBloc, HouseState>(
          builder: (final context, final state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.hasError || state.houseDetails == null) {
              return ErrorRetry(
                retryPressedCallback: () {
                  context.read<HouseBloc>().add(
                        GetHouse(_houseID),
                      );
                },
              );
            }

            final houseDetails = state.houseDetails!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: CoverImage(
                      imageURL: houseDetails.coverImageURL,
                    ),
                    onTap: () => _showImageGalleryDialog(
                        context, houseDetails.imageURLs),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Address(
                          street: houseDetails.street,
                          zipcode: houseDetails.zipcode,
                          city: houseDetails.city,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "€ ${houseDetails.price}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Description(
                          description: houseDetails.description,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Location(
                            latitude: houseDetails.latitude,
                            longitude: houseDetails.longitude,
                            height: 200,
                            zoom: 16),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _showImageGalleryDialog(context, List<String> imageURLs) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, _, __) {
          return ImageGalleryPage(imageURLs: imageURLs);
        });
  }
}
