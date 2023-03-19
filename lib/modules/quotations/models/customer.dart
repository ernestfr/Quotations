import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:hive/hive.dart';
import 'package:quotations/modules/quotations/models/address.dart';
part 'customer.g.dart';

@DataClass()
@HiveType(typeId: 4)
class Customer {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final Address address;
  @HiveField(3)
  final int vatNumber;

  /// Shorthand constructor
  Customer({
    required this.name,
    required this.email,
    required this.address,
    required this.vatNumber,
  });

  Customer.empty()
      : name = "",
        email = "",
        vatNumber = 0,
        address = Address.empty();

  /// Returns a string with the properties of [Customer]
  @override
  String toString() {
    String value = 'Customer{<optimized out>}';
    assert(() {
      value =
          'Customer@<$hexIdentity>{name: $name, email: $email, address: $address, vatNumber: $vatNumber}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      name,
      email,
      address,
      vatNumber,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is Customer &&
            runtimeType == other.runtimeType &&
            name == other.name &&
            email == other.email &&
            address == other.address &&
            vatNumber == other.vatNumber;
  }

  /// Creates a new instance of [Customer] with optional new values
  Customer copyWith({
    final String? name,
    final String? email,
    final Address? address,
    final int? vatNumber,
  }) {
    return Customer(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      vatNumber: vatNumber ?? this.vatNumber,
    );
  }
}
