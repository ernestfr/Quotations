import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/modules/quotations/models/customer.dart';
import 'package:quotations/modules/quotations/providers/quotations_provider.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

class CreateCustomerPanel extends ConsumerWidget {
  const CreateCustomerPanel({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
