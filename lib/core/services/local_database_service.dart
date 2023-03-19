import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotations/core/enums/box_type.dart';
import 'package:quotations/modules/quotations/models/address.dart';
import 'package:quotations/modules/quotations/models/customer.dart';
import 'package:quotations/modules/quotations/models/image_model.dart';
import 'package:quotations/modules/quotations/models/line_item.dart';
import 'package:quotations/modules/quotations/models/quotation.dart';

abstract class LocalDatabaseServiceInterface {
  void initialize();
  Future<Map> read({required BoxType type});
  Future<bool> create(Object object, {required BoxType type});
  Future<bool> clear(List<BoxType> types);
}

class HiveLocalDatabaseService implements LocalDatabaseServiceInterface {
  Future<Box> _openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  @override
  Future<Map> read({required BoxType type}) async {
    Box box = await _openHiveBox(type.string);
    return box.toMap();
  }

  @override
  Future<bool> create(Object object, {required BoxType type}) async {
    try {
      Box box = await _openHiveBox(type.string);
      await box.add(object);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  initialize() {
    _registerHiveAdapters();
  }

  _registerHiveAdapters() {
    Hive.registerAdapter(QuotationAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(ImageModelAdapter());
    Hive.registerAdapter(CustomerAdapter());
    Hive.registerAdapter(LineItemAdapter());
  }

  @override
  Future<bool> clear(List<BoxType> types) async {
    try {
      for (var type in types) {
        Box box = await _openHiveBox(type.string);
        box.deleteFromDisk();
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}

final localDatabaseService = Provider<LocalDatabaseServiceInterface>(
    (ref) => HiveLocalDatabaseService()..initialize());
