import 'package:flutter/material.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';
import 'package:quotations/modules/quotations/screens/quotation_list_screen.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/screens/add_line_item.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/screens/create_customer.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/screens/create_quotation.dart';
import 'package:quotations/modules/quotations/submodules/quotation_details/screens/quotation_details_screen.dart';
// HOME routes

final quotationListPage = MaterialPage(
  child: QuotationListScreen(),
);

MaterialPage quotationDetailsPage(Quotation quotation) {
  return MaterialPage(
    child: QuotationDetailsScreen(
      quotation: quotation,
    ),
  );
}

final createQuotationPage = MaterialPage(
  child: CreateQuotationScreen(),
);

final createCustomerPage =
    MaterialPage(fullscreenDialog: true, child: CreateCustomerScreen());

final addLineItemPage = MaterialPage(
  fullscreenDialog: true,
  child: AddLineItemScreen(),
);
