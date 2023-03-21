import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/components/custom_appbar.dart';
import 'package:quotations/core/routes/routes.dart';

class QuotationImage extends ConsumerWidget {
  const QuotationImage({
    super.key,
    required this.file,
  });

  final File file;

  @override
  Widget build(BuildContext context, ref) {
    var navigationProvider;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => ref
            .read(navigationProvider.notifier)
            .goToPage(singleImagePage(file)),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(
            height: 64,
            width: 64,
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class SingleImageScreen extends StatelessWidget {
  const SingleImageScreen({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Image"),
      body: Image.file(file),
    );
  }
}
