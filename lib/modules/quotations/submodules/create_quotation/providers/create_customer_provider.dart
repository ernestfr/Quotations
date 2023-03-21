import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/enums/box_type.dart';
import 'package:quotations/core/services/local_database_service.dart';
import 'package:quotations/core/services/navigation_service.dart';
import 'package:quotations/modules/quotations/models/address.dart';
import 'package:quotations/modules/quotations/models/customer.dart';
import 'package:quotations/modules/quotations/providers/quotations_provider.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/models/create_customer_state.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/screens/create_customer.dart';

class CreateCustomerProvider extends Notifier<CreateCustomerState> {
  late final LocalDatabaseServiceInterface _localDatabaseService;
  @override
  CreateCustomerState build() {
    _localDatabaseService = ref.read(localDatabaseService);
    state = CreateCustomerState.initial();
    return state;
  }

  clear() {
    state = CreateCustomerState.initial();
  }

  showSnackBar(String text) {
    ScaffoldMessenger.of(createCustomerScreenKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  createCustomer() async {
    if (state.nameController.text.isEmpty) {
      showSnackBar("Name cannot be empty");
      return;
    }
    if (state.vatNumberController.text.isEmpty) {
      showSnackBar("VAT number cannot be empty");
      return;
    }

    Address address = Address(
        city: state.cityController.text,
        country: state.countryController.text,
        street: state.streetController.text);
    Customer customer = Customer(
      name: state.nameController.text,
      address: address,
      email: state.emailController.text,
      vatNumber: int.parse(state.vatNumberController.text),
    );
    state = state.copyWith(customer: customer);
    await _localDatabaseService.create(state.customer, type: BoxType.customers);
    ref.read(quotationsProvider.notifier).getAllCustomers();
    ref.read(createQuotationProvider.notifier).setCustomer(state.customer);
    ref.read(navigationProvider.notifier).pop();
    showSnackBar("Customer created successfully");
  }
}

final createCustomerProvider =
    NotifierProvider<CreateCustomerProvider, CreateCustomerState>(
  () => CreateCustomerProvider(),
);
