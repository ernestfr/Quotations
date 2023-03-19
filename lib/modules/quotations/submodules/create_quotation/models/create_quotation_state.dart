import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:flutter/material.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';

@DataClass()
class CreateQuotationState {
  final Quotation quotation;
  final TextEditingController quotationTitleController;

  /// Shorthand constructor
  CreateQuotationState({
    required this.quotation,
    required this.quotationTitleController,
  });

  CreateQuotationState.initial()
      : quotation = Quotation.empty(),
        quotationTitleController = TextEditingController();

  /// Returns a string with the properties of [CreateQuotationState]
  @override
  String toString() {
    String value = 'CreateQuotationState{<optimized out>}';
    assert(() {
      value =
          'CreateQuotationState@<$hexIdentity>{quotation: $quotation, quotationTitleController: $quotationTitleController}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      quotation,
      quotationTitleController,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is CreateQuotationState &&
            runtimeType == other.runtimeType &&
            quotation == other.quotation &&
            quotationTitleController == other.quotationTitleController;
  }

  /// Creates a new instance of [CreateQuotationState] with optional new values
  CreateQuotationState copyWith({
    final Quotation? quotation,
    final TextEditingController? quotationTitleController,
  }) {
    return CreateQuotationState(
      quotation: quotation ?? this.quotation,
      quotationTitleController:
          quotationTitleController ?? this.quotationTitleController,
    );
  }
}
