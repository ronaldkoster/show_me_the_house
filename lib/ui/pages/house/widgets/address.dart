import 'package:flutter/material.dart';
import 'package:showmethehouse/domain/address.dart' as domain;

class Address extends StatelessWidget {
  final domain.Address _address;

  const Address({Key? key, required domain.Address address})
      : _address = address,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        _address.street,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      Text(
        "${_address.zipcode} ${_address.city}",
        style: Theme.of(context).textTheme.caption,
      ),
    ]);
  }
}
