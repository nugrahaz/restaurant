import 'package:get_storage/get_storage.dart';

class StorageServices {
  var box = GetStorage();

  final String _idRestaurant = "id";
  final String _schedule = "schedule";

  //menandai page telah dilihat
  Future<void> pageHasSeen(String page) async {
    box.writeIfNull(page, true);
  }

  //check jika sudah dilihat
  bool checkPageSeen(String page) {
    var status = box.read(page) ?? false;
    return status;
  }

  //save schedule
  Future<void> saveSchedule(bool status) async {
    box.write(_schedule, status);
  }

  //read schedule
  bool readSchedule() {
    var status = box.read(_schedule) ?? false;
    return status;
  }

  Future<void> addListOfFavorite(List<dynamic> id) async {
    box.write(_idRestaurant, id);
  }

  List<dynamic> getListOfFavorite() {
    return box.read(_idRestaurant) ?? [];
  }
}
