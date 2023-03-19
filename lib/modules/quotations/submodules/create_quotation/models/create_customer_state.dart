import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:flutter/widgets.dart';
import 'package:quotations/modules/quotations/models/customer.dart';

@DataClass()
class CreateCustomerState {
  /// Shorthand constructor
  CreateCustomerState({
    required this.customer,
    required this.nameController,
    required this.emailController,
    required this.vatNumberController,
    required this.cityController,
    required this.countryController,
    required this.streetController,
  });

  final Customer customer;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController vatNumberController;
  final TextEditingController cityController;
  final TextEditingController countryController;
  final TextEditingController streetController;

  CreateCustomerState.initial()
      : customer = Customer.empty(),
        nameController = TextEditingController(),
        emailController = TextEditingController(),
        vatNumberController = TextEditingController(),
        cityController = TextEditingController(),
        countryController = TextEditingController(),
        streetController = TextEditingController();

  /// Returns a string with the properties of [CreateCustomerState]
  @override
  String toString() {
    String value = 'CreateCustomerState{<optimized out>}';
    assert(() {
      value =
          'CreateCustomerState@<$hexIdentity>{customer: $customer, nameController: $nameController, emailController: $emailController, vatNumberController: $vatNumberController, cityController: $cityController, countryController: $countryController, streetController: $streetController}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      customer,
      nameController,
      emailController,
      vatNumberController,
      cityController,
      countryController,
      streetController,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is CreateCustomerState &&
            runtimeType == other.runtimeType &&
            customer == other.customer &&
            nameController == other.nameController &&
            emailController == other.emailController &&
            vatNumberController == other.vatNumberController &&
            cityController == other.cityController &&
            countryController == other.countryController &&
            streetController == other.streetController;
  }

  /// Creates a new instance of [CreateCustomerState] with optional new values
  CreateCustomerState copyWith({
    final Customer? customer,
    final TextEditingController? nameController,
    final TextEditingController? emailController,
    final TextEditingController? vatNumberController,
    final TextEditingController? cityController,
    final TextEditingController? countryController,
    final TextEditingController? streetController,
  }) {
    return CreateCustomerState(
      customer: customer ?? this.customer,
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      vatNumberController: vatNumberController ?? this.vatNumberController,
      cityController: cityController ?? this.cityController,
      countryController: countryController ?? this.countryController,
      streetController: streetController ?? this.streetController,
    );
  }
}
