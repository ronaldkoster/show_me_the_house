import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showmethehouse/client/client.dart';
import 'package:showmethehouse/ui/pages/house/house_page.dart';

class ShowMeTheHouseApp extends StatelessWidget {
  final HousingClient _client;
  const ShowMeTheHouseApp({Key? key, required HousingClient client})
      : _client = client,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<HousingClient>(
        create: (_) {
          return _client;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Show me the house!',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HousePage(
            houseID: "d854e1dd-0285-4c50-b3d0-adf25e73f5e0",
          ),
        ));
  }
}
