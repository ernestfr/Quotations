import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/routes/routes.dart';

abstract class NavigatorInterface {
  bool pop();
  void _setStack(List<MaterialPage> stack);
  void goToPage(MaterialPage page);
}

class NavigatorProvider extends ChangeNotifier implements NavigatorInterface {
  List<MaterialPage> backstack = [createQuotationPage]; // current stack

  @override
  bool pop() {
    if (backstack != [quotationListPage]) {
      _setStack([...backstack..removeLast()]);
    }
    return backstack.length == 1;
  }

  @override
  void _setStack(List<MaterialPage> stack) {
    if (stack != backstack) {
      backstack = stack;
      notifyListeners();
    }
  }

  @override
  void goToPage(MaterialPage page) {
    if (!backstack.contains(page)) {
      _setStack([...backstack, page]);
    }
  }

}

final navigatorProvider = ChangeNotifierProvider<NavigatorProvider>((ref) {
  return NavigatorProvider();
});
