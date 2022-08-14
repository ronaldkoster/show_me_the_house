import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../client/client.dart';
import '../../widgets/error_retry.dart';
import '../image_gallery/image_gallery.dart';
import 'bloc/house_bloc.dart';
import 'widgets/address.dart';
import 'widgets/cover_image.dart';
import 'widgets/description.dart';
import 'widgets/location.dart';

class HousePage extends StatelessWidget {
  final String _houseID;
  const HousePage({Key? key, required houseID})
      : _houseID = houseID,
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

            if (state.hasError || state.house == null) {
              return ErrorRetry(
                retryPressedCallback: () {
                  context.read<HouseBloc>().add(
                        GetHouse(_houseID),
                      );
                },
              );
            }

            final house = state.house!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: CoverImage(
                      imageURL: house.coverImageURL,
                    ),
                    onTap: () =>
                        _showImageGalleryDialog(context, house.imageURLs),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Address(address: house.address),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "€ ${house.price}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Description(
                          description: house.description,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Location(
                            coordinates: house.coordinates,
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
