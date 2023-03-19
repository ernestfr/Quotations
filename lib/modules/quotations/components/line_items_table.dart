import 'package:flutter/material.dart';
import 'package:quotations/modules/quotations/models/line_item.dart';

class LineItemsTable extends StatelessWidget {
  LineItemsTable({
    required this.lineItems,
    super.key,
  });

  final List<LineItem> lineItems;

  @override
  Widget build(BuildContext context) {
    return lineItems.isEmpty
        ? Center(
            child: Text("This quotation has no line items."),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Table(children: [
                TableRow(children: [
                  TableCell(
                    child: Text(
                      "Title",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "Price",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "Quantity",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  TableCell(
                    child: Text(
                      "Total",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ]),
                for (var i = 0; i < lineItems.length; i++)
                  TableRow(children: [
                    TableCell(
                      child: Text(
                        lineItems[i].title,
                      ),
                    ),
                    TableCell(
                      child: Text(
                        lineItems[i].price.toString(),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        lineItems[i].quantity.toString(),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        lineItems[i].totalPrice.toString(),
                      ),
                    ),
                  ]),
              ]),
            ],
          );
  }
}
