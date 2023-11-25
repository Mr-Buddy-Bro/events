import 'package:dio/dio.dart';
import 'package:events/features/event/data/models/event_model.dart';

class RemoteDataSource{

  String baseUrl = 'https://sde-007.api.assignment.theinternetfolks.works';
  String version = '/v1';

  Dio dio = Dio();

  Future<List<EventModel>> fetchEvents()async{
    String endPoint = '/event';
    Response response = await dio.get(baseUrl+version+endPoint);
    List<EventModel> events = [];
    List data = response.data['content']['data'].toList();
    for (var element in data) {
      EventModel event = EventModel.fromMap((element));
      events.add(event);
    }

    return events;
  }

  Future<EventModel> fetchEventDetails(int id)async{
    String endPoint = '/event/$id';
    Response response = await dio.get(baseUrl+version+endPoint);
    final data = response.data['content']['data'];
    EventModel event = EventModel.fromMap((data));

    return event;
  }

  Future<List<EventModel>> searchEvent(String text)async{
    String endPoint = '/event';
    Response response = await dio.get(baseUrl+version+endPoint, queryParameters: {'search':text});
    List<EventModel> events = [];
    List data = response.data['content']['data'].toList();
    for (var element in data) {
      EventModel event = EventModel.fromMap((element));
      events.add(event);
    }

    return events;
  }
}