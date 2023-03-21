import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

class AddLineItemButton extends ConsumerWidget {
  const AddLineItemButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Center(
        child: TextButton(
            onPressed:
                ref.read(createQuotationProvider.notifier).goToAddLineItem,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("Add Line Item"), Icon(Icons.add)],
            )));
  }
}
