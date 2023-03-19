import 'package:flutter/material.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';

class CustomerInfoPanel extends StatelessWidget {
  const CustomerInfoPanel({required this.quotation, super.key});
  final Quotation quotation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quotation.customer!.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
              "${quotation.customer!.address.country}, ${quotation.customer!.address.city}, ${quotation.customer!.address.street}"),
          Text(
            quotation.customer!.email,
          ),
          Text(
            quotation.customer!.vatNumber.toString(),
          ),
        ],
      ),
    );
  }
}
