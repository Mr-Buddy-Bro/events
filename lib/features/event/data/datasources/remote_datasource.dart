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
}