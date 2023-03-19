import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/services/navigation.dart';
import 'package:quotations/core/theme/theme.dart';

void main() {
  runApp(ProviderScope(
      child: const MyApp(),
    ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      title: 'Quotations',
      theme: themeData,
      home: Navigator(
        pages: ref.watch(navigationProvider),
        onPopPage: (route, result) {
          route.didPop(result);
          return ref.watch(navigationProvider.notifier).pop();
        },
      ),
    );
  }
}
