import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:quotations/modules/quotations/models/customer.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';

@DataClass()
class QuotationsState {
  /// Shorthand constructor
  QuotationsState({
    required this.allQuotations,
    required this.allCustomers,
  });

  final List<Quotation> allQuotations;
  final List<Customer> allCustomers;

  QuotationsState.initial()
      : allCustomers = [],
        allQuotations = [];

  /// Returns a string with the properties of [QuotationsState]
  @override
  String toString() {
    String value = 'QuotationsState{<optimized out>}';
    assert(() {
      value =
          'QuotationsState@<$hexIdentity>{allQuotations: $allQuotations, allCustomers: $allCustomers}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      allQuotations,
      allCustomers,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is QuotationsState &&
            runtimeType == other.runtimeType &&
            deepEquality(allQuotations, other.allQuotations) &&
            deepEquality(allCustomers, other.allCustomers);
  }

  /// Creates a new instance of [QuotationsState] with optional new values
  QuotationsState copyWith({
    final List<Quotation>? allQuotations,
    final List<Customer>? allCustomers,
  }) {
    return QuotationsState(
      allQuotations: allQuotations ?? this.allQuotations,
      allCustomers: allCustomers ?? this.allCustomers,
    );
  }
}
