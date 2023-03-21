import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

class QuotationTitleField extends ConsumerWidget {
  const QuotationTitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        controller: ref.watch(createQuotationProvider).quotationTitleController,
        decoration: InputDecoration(
            label: Text("Quotation Title"),
            hintText: "Set a title for your quotation",
            border: OutlineInputBorder()),
      ),
    );
  }
}
