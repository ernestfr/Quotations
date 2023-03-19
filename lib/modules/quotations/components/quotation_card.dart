import 'package:flutter/material.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';

class QuotationCard extends StatelessWidget {
  const QuotationCard({
    required this.quotation,
    required this.onPressed,
    super.key,
  });
  final VoidCallback onPressed;
  final Quotation quotation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 0,
      color: Colors.grey[100],
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quotation.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    quotation.totalPrice.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Divider(),
              Text(
                quotation.customer?.name ?? "-",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(quotation.customer?.email ?? "-"),
              Text(quotation.customer?.vatNumber.toString() ?? "-"),
            ],
          ),
        ),
      ),
    );
  }
}
