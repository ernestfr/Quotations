import 'package:flutter/material.dart';
import 'package:quotations/modules/quotations/screens/quotation_list_screen.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/screens/create_quotation.dart';
import 'package:quotations/modules/quotations/submodules/quotation_details/screens/quotation_details_screen.dart';
// HOME routes

final quotationListPage = MaterialPage(
  child: QuotationListScreen(),
);

final quotationDetailsPage = MaterialPage(
  child: QuotationDetailsScreen(),
);

final createQuotationPage = MaterialPage(
  child: CreateQuotation(),
);
