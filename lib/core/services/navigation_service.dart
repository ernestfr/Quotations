import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/routes/routes.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_customer_provider.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

abstract class NavigationInterface {
  bool pop();
  void _setStack(List<MaterialPage> stack);
  void goToPage(MaterialPage page);
}

class NavigationProvider extends Notifier<List<MaterialPage>>
    implements NavigationInterface {
  @override
  bool pop() {
    if (state != [quotationListPage]) {
      if (state.last == createQuotationPage) {
        ref.read(createQuotationProvider.notifier).clear();
      } else if (state.last == createCustomerPage) {
        ref.read(createCustomerProvider.notifier).clear();
      }
      _setStack([...state..removeLast()]);
    }
    return state.length == 1;
  }

  @override
  void _setStack(List<MaterialPage> stack) {
    if (stack != state) {
      state = stack;
    }
  }

  @override
  void goToPage(MaterialPage page) {
    if (!state.contains(page)) {
      _setStack([...state, page]);
    }
  }

  @override
  List<MaterialPage> build() {
    state = [quotationListPage];
    return state;
  }
}

final navigationProvider =
    NotifierProvider<NavigationProvider, List<MaterialPage>>(() {
  return NavigationProvider();
});
