import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/enums/box_type.dart';
import 'package:quotations/core/services/local_database_service.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppbar({
    this.title,
    super.key,
  });
  final String? title;
  @override
  Widget build(BuildContext context, ref) {
    return AppBar(
      title: Text(title ?? 'Quotations'),
      actions: [
        IconButton(
            onPressed: () {
              ref
                  .read(localDatabaseService)
                  .clear([BoxType.quotations, BoxType.customers]);
            },
            icon: Icon(Icons.delete))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
