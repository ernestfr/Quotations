import 'package:flutter/material.dart';
import 'package:quotations/core/components/custom_appbar.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';
import 'package:quotations/modules/quotations/submodules/quotation_details/components/customer_info_panel.dart';
import 'package:quotations/modules/quotations/submodules/quotation_details/components/images_list_panel.dart';
import 'package:quotations/modules/quotations/submodules/quotation_details/components/quotation_info_panel.dart';

class QuotationDetailsScreen extends StatelessWidget {
  const QuotationDetailsScreen({required this.quotation, super.key});

  final Quotation quotation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Quotation Details",
      ),
      body: ListView(
        children: [
          CustomerInfoPanel(
            quotation: quotation,
          ),
          ImagesListPanel(),
          QuotationInfoPanel(
            quotation: quotation,
          ),
        ],
      ),
    );
  }
}
