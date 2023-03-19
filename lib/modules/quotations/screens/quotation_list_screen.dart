import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/components/custom_appbar.dart';
import 'package:quotations/core/routes/routes.dart';
import 'package:quotations/core/services/navigation.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(quotationsProvider.notifier).goToCreateQuotation,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: ref.watch(quotationsProvider).allQuotations.length,
        itemBuilder: (context, index) {
          // return Container();
          return ref.watch(quotationsProvider).allQuotations.isEmpty
              ? Container()
              : QuotationCard(
                  quotation: ref.watch(quotationsProvider).allQuotations[index],
                  onPressed: () {
                    ref.read(navigationProvider.notifier).goToPage(
                        quotationDetailsPage(
                            ref.read(quotationsProvider).allQuotations[index]));
                  });
        },
      ),
    );
  }
}
