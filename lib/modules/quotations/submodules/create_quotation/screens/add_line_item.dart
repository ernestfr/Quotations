import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/components/custom_appbar.dart';
import 'package:quotations/modules/quotations/models/line_item.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

class AddLineItemScreen extends ConsumerWidget {
  AddLineItemScreen({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    _titleController.clear();
    _priceController.clear();
    _quantityController.clear();
    return Scaffold(
        appBar: CustomAppbar(title: "Add Line Item"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    hintText: "Set a title for new line item",
                    label: Text("Title")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    hintText: "Set a price for new line item",
                    label: Text("Price")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    hintText: "Set a quantity for new line item",
                    label: Text("Quantity")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ElevatedButton(
                child: Text("Add Line Item"),
                onPressed: () => ref
                    .read(createQuotationProvider.notifier)
                    .addLineItem(LineItem(
                      _titleController.text,
                      int.parse(_priceController.text),
                      int.parse(_quantityController.text),
                    )),
              ),
            ),
          ]),
        ));
  }
}
