import 'package:hive/hive.dart';
part 'image_model.g.dart';

@HiveType(typeId: 3)
class ImageModel {
  @HiveField(0)
  final String path;
  @HiveField(1)
  final String title;

  ImageModel(this.path, this.title);
}
