import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/components/custom_appbar.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_customer_provider.dart';

final GlobalKey<ScaffoldState> createCustomerScreenKey =
    GlobalKey<ScaffoldState>();

class CreateCustomerScreen extends ConsumerWidget {
  const CreateCustomerScreen([this.title]);
  final String? title;
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      key: createCustomerScreenKey,
      appBar: CustomAppbar(title: "Create Customer"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TextField(
              controller: ref.watch(createCustomerProvider).nameController,
              decoration: InputDecoration(
                  hintText: "Set a name for new customer",
                  label: Text("Customer")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TextField(
              controller: ref.watch(createCustomerProvider).emailController,
              decoration: InputDecoration(
                  hintText: "Set an email for new customer",
                  label: Text("Email")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TextField(
              controller: ref.watch(createCustomerProvider).vatNumberController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  hintText: "Set a VAT number for new customer",
                  label: Text("VAT Number")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: ref.watch(createCustomerProvider).cityController,
                  decoration: InputDecoration(label: Text("City")),
                )),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                    child: TextField(
                  controller:
                      ref.watch(createCustomerProvider).countryController,
                  decoration: InputDecoration(label: Text("Country")),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TextField(
              controller: ref.watch(createCustomerProvider).streetController,
              decoration: InputDecoration(label: Text("Street")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ElevatedButton(
              child: Text("Create Customer"),
              onPressed:
                  ref.read(createCustomerProvider.notifier).createCustomer,
            ),
          ),
        ]),
      ),
    );
  }
}
