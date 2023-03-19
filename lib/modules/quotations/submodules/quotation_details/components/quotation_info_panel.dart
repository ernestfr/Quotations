import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/modules/quotations/components/line_items_table.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';

class QuotationInfoPanel extends ConsumerWidget {
  const QuotationInfoPanel({required this.quotation, super.key});
  final Quotation quotation;
  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quotation.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          LineItemsTable(lineItems: quotation.lineItems),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              quotation.totalPrice.toString(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
