import 'dart:collection';

import 'package:device_info/device_info.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Database{

  static Future<void> addToMongo(LinkedHashMap list) async{
    var db = await Db.create("mongodb+srv://rootx:rootx@cluster0.8wzsw.mongodb.net/myDat?retryWrites=true&w=majority");
    await db.open();
    print(db.toString());
    var data = db.collection('locData');
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    data.insert({
      "device_id":androidInfo.androidId,
      "a": list['a'],
      "b": list['b'],
      "location": list['Location']
    }).then((value) {
      print(value);
    });
  db.close();
  }
}