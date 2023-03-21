import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/components/custom_appbar.dart';
import 'package:quotations/modules/quotations/components/line_items_table.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/components/add_images_panel.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/components/add_line_item_button.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/components/create_customer_panel.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/components/create_quotation_button.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/components/quotation_title_field.dart';
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
          QuotationTitleField(),
          Divider(),
          LineItemsTable(
            lineItems: ref.watch(createQuotationProvider).quotation.lineItems,
          ),
          AddLineItemButton(),
          Divider(),
          CreateCustomerPanel(),
          Divider(),
          AddImagesPanel(),
          CreateQuotationButton()
        ]),
      ),
    );
  }
}
