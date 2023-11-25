import 'dart:convert';

import 'package:events/features/event/domain/entities/eventEntity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EventModel {
  int id;
  String title;
  String description;
  String bannerImage;
  DateTime dateTime;
  String organiserName;
  String organiserIcon;
  String venueName;
  String venueCity;
  String venueCountry;
  
  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'bannerImage': bannerImage,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'organiserName': organiserName,
      'organiserIcon': organiserIcon,
      'venueName': venueName,
      'venueCity': venueCity,
      'venueCountry': venueCountry,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      bannerImage: map['banner_image'] as String,
      dateTime: DateTime.parse(map['date_time']),
      organiserName: map['organiser_name'] as String,
      organiserIcon: map['organiser_icon'] as String,
      venueName: map['venue_name'] as String,
      venueCity: map['venue_city'] as String,
      venueCountry: map['venue_country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  EventEntity toEntity(){
    return EventEntity(id: id, title: title, description: description, bannerImage: bannerImage, dateTime: dateTime, organiserName: organiserName, organiserIcon: organiserIcon, venueName: venueName, venueCity: venueCity, venueCountry: venueCountry);
  }
}


