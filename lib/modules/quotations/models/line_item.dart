import 'package:hive/hive.dart';
part 'line_item.g.dart';

@HiveType(typeId: 2)
class LineItem {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int price;
  @HiveField(2)
  final int quantity;

  LineItem(this.title, this.price, this.quantity);

  int get totalPrice {
    return price * quantity;
  }
}
