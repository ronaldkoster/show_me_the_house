import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  final String _street;
  final String _zipcode;
  final String _city;

  const Address({
    Key? key,
    required String street,
    required String zipcode,
    required city,
  })  : _street = street,
        _zipcode = zipcode,
        _city = city,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        _street,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      Text(
        "$_zipcode $_city",
        style: Theme.of(context).textTheme.caption,
      ),
    ]);
  }
}
