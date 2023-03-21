import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/modules/quotations/components/quotation_image.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

class AddImagesPanel extends ConsumerWidget {
  const AddImagesPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          height: 72,
          child: ref.watch(createQuotationProvider).quotation.images.isEmpty
              ? Center(child: Text("Image list is empty"))
              : ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0;
                        i <
                            ref
                                .watch(createQuotationProvider)
                                .quotation
                                .images
                                .length;
                        i++)
                      QuotationImage(
                        file: File(ref
                            .watch(createQuotationProvider)
                            .quotation
                            .images[i]),
                      )
                  ],
                ),
        ),
        Center(
          child: TextButton(
            child: Text("Pick Image"),
            onPressed: ref.read(createQuotationProvider.notifier).addImage,
          ),
        ),
      ],
    );
  }
}
