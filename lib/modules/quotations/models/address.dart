import 'package:hive/hive.dart';
part 'address.g.dart';

@HiveType(typeId: 5)
class Address {
  @HiveField(0)
  final String city;
  @HiveField(1)
  final String country;
  @HiveField(2)
  final String street;

  Address({
    required this.city,
    required this.country,
    required this.street,
  });

  Address.empty()
      : city = "",
        country = "",
        street = "";
}
