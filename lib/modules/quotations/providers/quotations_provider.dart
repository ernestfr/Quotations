import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotations/core/enums/box_type.dart';
import 'package:quotations/core/routes/routes.dart';
import 'package:quotations/core/services/local_database_service.dart';
import 'package:quotations/core/services/navigation.dart';
import 'package:quotations/modules/quotations/models/customer.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';
import 'package:quotations/modules/quotations/models/quotations_state.dart';
import 'package:quotations/modules/quotations/submodules/create_quotation/providers/create_quotation_provider.dart';

class QuotationsProvider extends Notifier<QuotationsState> {
  late final LocalDatabaseServiceInterface _localDatabaseService;
  @override
  QuotationsState build() {
    _localDatabaseService = ref.read(localDatabaseService);
    state = QuotationsState.initial();
    getAllQuotations();
    return state;
  }

  goToCreateQuotation() async {
    await getAllCustomers().then((customers) {
      if (customers.isNotEmpty) {
        ref
            .read(createQuotationProvider.notifier)
            .setCustomer(state.allCustomers.first);
      }
    });
    ref.read(navigationProvider.notifier).goToPage(createQuotationPage);
  }

  Future<List<Customer>> getAllCustomers() async {
    state.allCustomers.clear();
    await _localDatabaseService
        .read(type: BoxType.customers)
        .then((allCustomers) {
      allCustomers.forEach((key, value) => state.allCustomers.add(value));
    });
    return state.allCustomers;
  }

  Future<List<Quotation>> getAllQuotations() async {
    state.allQuotations.clear();
    await _localDatabaseService
        .read(type: BoxType.quotations)
        .then((allQuotations) {
      allQuotations.forEach((key, value) => state.allQuotations.add(value));
    });
    state = state.copyWith(allQuotations: state.allQuotations);

    return state.allQuotations;
  }
}

final quotationsProvider =
    NotifierProvider<QuotationsProvider, QuotationsState>(
        () => QuotationsProvider());
