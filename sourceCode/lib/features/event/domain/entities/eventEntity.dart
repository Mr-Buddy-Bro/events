// ignore_for_file: public_member_api_docs, sort_constructors_first
class EventEntity {
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
  
  EventEntity({
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

}
