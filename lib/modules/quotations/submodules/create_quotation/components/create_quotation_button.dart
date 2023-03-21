import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

class CreateQuotationButton extends ConsumerWidget {
  const CreateQuotationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: ElevatedButton(
              onPressed:
                  ref.watch(createQuotationProvider.notifier).createQuotation,
              child: Text("Create Quotation"))),
    );
  }
}
