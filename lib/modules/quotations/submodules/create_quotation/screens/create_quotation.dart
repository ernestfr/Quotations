import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/components/custom_appbar.dart';
import 'package:quotations/modules/quotations/components/line_items_table.dart';
import 'package:quotations/modules/quotations/models/customer.dart';
import 'package:quotations/modules/quotations/providers/quotations_provider.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

final GlobalKey<ScaffoldState> createQuotationScreenKey =
    GlobalKey<ScaffoldState>();

class CreateQuotationScreen extends ConsumerWidget {
  CreateQuotationScreen({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      key: createQuotationScreenKey,
      appBar: CustomAppbar(
        title: "Create Quotation",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          QuotatiobTitleField(),
          LineItemsTable(
            lineItems: ref.watch(createQuotationProvider).quotation.lineItems,
          ),
          AddLineItemButton(),
          CreateCustomerPanel(),
          CreateQuotationButton()
        ]),
      ),
    );
  }
}

class QuotatiobTitleField extends ConsumerWidget {
  const QuotatiobTitleField({
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

class CreateCustomerPanel extends ConsumerWidget {
  const CreateCustomerPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (ref.watch(quotationsProvider).allCustomers.isNotEmpty)
                Expanded(
                  child: DropdownButton<Customer>(
                    onChanged: (Customer? customer) {
                      ref
                          .watch(createQuotationProvider.notifier)
                          .setCustomer(customer!);
                    },
                    value:
                        ref.watch(createQuotationProvider).quotation.customer,
                    items: ref
                        .watch(quotationsProvider)
                        .allCustomers
                        .map((Customer customer) => DropdownMenuItem(
                            value: customer, child: Text(customer.name)))
                        .toList(),
                  ),
                ),
              TextButton(
                  onPressed: ref
                      .read(createQuotationProvider.notifier)
                      .goToCreateCustomer,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (ref.watch(quotationsProvider).allCustomers.isEmpty)
                        Text("Create your first customer"),
                      Icon(
                        Icons.add,
                      )
                    ],
                  ))
            ],
          ),
        ),
        if (ref.watch(createQuotationProvider).quotation.customer != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ref.watch(createQuotationProvider).quotation.customer?.email ??
                    "-",
              ),
              Text(
                ref
                        .watch(createQuotationProvider)
                        .quotation
                        .customer
                        ?.vatNumber
                        .toString() ??
                    "-",
              ),
              Text(
                  "${ref.watch(createQuotationProvider).quotation.customer!.address.country}, ${ref.watch(createQuotationProvider).quotation.customer!.address.city}, ${ref.watch(createQuotationProvider).quotation.customer!.address.street}"),
            ],
          ),
      ],
    );
  }
}
