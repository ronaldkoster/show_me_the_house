import 'package:flutter/widgets.dart';
import 'package:showmethehouse/domain/address.dart' as domain;

import 'address.dart';

class Title extends StatelessWidget {
  final domain.Address _address;
  final int _price;

  const Title({Key? key, required domain.Address address, required int price})
      : _address = address,
        _price = price,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Address(address: _address),
        Text("€ $_price"),
      ],
    );
  }
}
