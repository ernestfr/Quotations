import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:hive/hive.dart';
import 'package:quotations/modules/quotations/models/customer.dart';
import 'package:quotations/modules/quotations/models/line_item.dart';
part 'quotation.g.dart';

@DataClass()
@HiveType(typeId: 1)
class Quotation extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final Customer? customer;
  @HiveField(2)
  final List<LineItem> lineItems;
  @HiveField(3)
  final List<String> images;

  /// Shorthand constructor
  Quotation({
    required this.title,
    this.customer,
    required this.lineItems,
    required this.images,
  });

  Quotation.empty()
      : title = "",
        lineItems = [],
        images = [],
        customer = null;

  int get totalPrice {
    int price = 0;
    for (var item in lineItems) {
      price += item.totalPrice;
    }
    return price;
  }

  /// Returns a string with the properties of [Quotation]
  @override
  String toString() {
    String value = 'Quotation{<optimized out>}';
    assert(() {
      value =
          'Quotation@<$hexIdentity>{title: $title, customer: $customer, lineItems: $lineItems, images: $images}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      title,
      customer,
      lineItems,
      images,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        other is Quotation &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            customer == other.customer &&
            deepEquality(lineItems, other.lineItems) &&
            deepEquality(images, other.images);
  }

  /// Creates a new instance of [Quotation] with optional new values
  Quotation copyWith({
    final String? title,
    final Customer? customer,
    final List<LineItem>? lineItems,
    final List<String>? images,
  }) {
    return Quotation(
      title: title ?? this.title,
      customer: customer ?? this.customer,
      lineItems: lineItems ?? this.lineItems,
      images: images ?? this.images,
    );
  }
}
