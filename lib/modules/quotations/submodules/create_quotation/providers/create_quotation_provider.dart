import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/enums/box_type.dart';
import 'package:quotations/core/routes/routes.dart';
import 'package:quotations/core/services/local_database_service.dart';
import 'package:quotations/core/services/navigation.dart';
import 'package:quotations/modules/quotations/models/customer.dart';
import 'package:quotations/modules/quotations/models/line_item.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';
import 'package:quotations/modules/quotations/providers/quotations_provider.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/models/create_quotation_state.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/screens/create_quotation.dart';

class CreateQuotationProvider extends Notifier<CreateQuotationState> {
  late final LocalDatabaseServiceInterface _localDatabaseService;

  @override
  CreateQuotationState build() {
    _localDatabaseService = ref.read(localDatabaseService);
    state = CreateQuotationState.initial();
    return state;
  }

  showSnackBar(String text) {
    ScaffoldMessenger.of(createQuotationScreenKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  clear() {
    state = CreateQuotationState.initial();
  }

  goToCreateCustomer() async {
    ref.read(navigationProvider.notifier).goToPage(createCustomerPage);
  }

  goToAddLineItem() {
    ref.read(navigationProvider.notifier).goToPage(addLineItemPage);
  }

  setCustomer(Customer customer) {
    Quotation quotation = state.quotation.copyWith(customer: customer);
    state = state.copyWith(quotation: quotation);
  }

  addLineItem(LineItem lineItem) {
    List<LineItem> lineItems = state.quotation.lineItems;
    lineItems.add(lineItem);
    Quotation quotation = state.quotation.copyWith(lineItems: lineItems);
    state = state.copyWith(quotation: quotation);
    ref.read(navigationProvider.notifier).pop();
  }

  createQuotation() async {
    Quotation quotation =
        state.quotation.copyWith(title: state.quotationTitleController.text);
    if (quotation.customer == null) {
      showSnackBar("Customer cannot be empty");
      return;
    }
    if (quotation.title.isEmpty) {
      showSnackBar("Quotation Title cannot be empty");
      return;
    }

    _localDatabaseService.create(quotation, type: BoxType.quotations);

    ref.read(quotationsProvider.notifier).getAllQuotations();
    ref.read(navigationProvider.notifier).pop();
    showSnackBar("Quotation created succesfullly!");
  }
}

final createQuotationProvider =
    NotifierProvider<CreateQuotationProvider, CreateQuotationState>(
        () => CreateQuotationProvider());
