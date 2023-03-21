import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/components/custom_appbar.dart';
import 'package:quotations/core/routes/routes.dart';
import 'package:quotations/core/services/navigation_service.dart';
import 'package:quotations/modules/quotations/components/quotation_card.dart';
import 'package:quotations/modules/quotations/providers/quotations_provider.dart';

class QuotationListScreen extends ConsumerWidget {
  const QuotationListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: CustomAppbar(),
      floatingActionButton: ref.watch(quotationsProvider).allQuotations.isEmpty
          ? null
          : FloatingActionButton(
              onPressed:
                  ref.read(quotationsProvider.notifier).goToCreateQuotation,
              child: Icon(Icons.add),
            ),
      body: ref.watch(quotationsProvider).allQuotations.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("Quotation list is empty")),
                SizedBox(height: 8),
                ElevatedButton(
                    onPressed: ref
                        .read(quotationsProvider.notifier)
                        .goToCreateQuotation,
                    child: Text("Create a new quotation"))
              ],
            )
          : ListView.builder(
              itemCount: ref.watch(quotationsProvider).allQuotations.length,
              itemBuilder: (context, index) {
                return QuotationCard(
                    quotation:
                        ref.watch(quotationsProvider).allQuotations[index],
                    onPressed: () {
                      ref.read(navigationProvider.notifier).goToPage(
                          quotationDetailsPage(ref
                              .read(quotationsProvider)
                              .allQuotations[index]));
                    });
              },
            ),
    );
  }
}
