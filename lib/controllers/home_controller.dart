import 'package:get/get.dart';
import 'package:look_acara/api/api_service.dart';
import 'package:look_acara/models/event.dart';

class HomeController extends GetxController {
  var eventList = <Event>[].obs;

  @override
  void onInit() async {
    print("Fetching Events.....");
    await fetchEvents();
    super.onInit();
  }

  Future<List<Event>> fetchEvents() async {
    var events = await ApiService.fetchEvents();
    for (var i = 0; i < events!.length; i++) {
      print("Berhasil dapet ${events.length} event");
      print(events[i].eventName);
    }
    if (events != null) {
      eventList.assignAll(events);
      return events;
    } else {
      throw Exception("Failed to load events from API");
    }
  }
}
