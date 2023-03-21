import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/modules/quotations/components/quotation_image.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';

class ImagesListPanel extends ConsumerWidget {
  const ImagesListPanel({
    required this.quotation,
    super.key,
  });
  final Quotation quotation;
  @override
  Widget build(BuildContext context, ref) {
    return Container(
      height: 72,
      child: quotation.images.isEmpty
          ? Center(child: Text("Image list is empty"))
          : ListView(
        scrollDirection: Axis.horizontal,
        children: [
                for (var i = 0; i < quotation.images.length; i++)
                  QuotationImage(
                    file: File(quotation.images[i]),
            )
        ],
      ),
    );
  }
}
