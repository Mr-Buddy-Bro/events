// ignore_for_file: must_be_immutable

import 'package:events/core/config/myColors.dart';
import 'package:events/core/constants/strings.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItemCard extends StatelessWidget {
  EventEntity event;
  VoidCallback onPressed;
  EventItemCard({super.key, required this.event, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MyColors.cardBg,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Hero(
              tag: 'banner_image${event.id}',
              child: Container(
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(event.bannerImage), fit: BoxFit.cover)
                ),
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${DateFormat('EEE').format(event.dateTime)}, ${DateFormat('MMM').format(event.dateTime)} ${DateFormat('dd').format(event.dateTime)}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: MyColors.primary),),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.circle_rounded, size: 6, color: MyColors.primary,),
                      ),
                      Text(DateFormat.jm().format(event.dateTime), style: TextStyle(fontSize: 16, color: MyColors.primary, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Text(event.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(Icons.location_on_rounded, color: MyColors.grey, size: 18  ,),
                      const SizedBox(width: 5,),
                      Text(event.venueName, style: TextStyle(fontSize: 16, color: MyColors.grey),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.circle_rounded, size: 6, color: MyColors.grey,),
                      ),
                      Text('${event.venueCity}, ', style: TextStyle(fontSize: 16, color: MyColors.grey),),
                      Text('${event.venueCountry}', style: TextStyle(fontSize: 16, color: MyColors.grey), overflow: TextOverflow.ellipsis,),
                    ],
                  ),
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EventSearchItemCard extends StatelessWidget {
  EventEntity event;
  VoidCallback onPressed;
  EventSearchItemCard({super.key, required this.event, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MyColors.cardBg,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'banner_image${event.id}',
              child: Container(
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(event.bannerImage), fit: BoxFit.cover)
                ),
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Text('${DateFormat('dd').format(event.dateTime)} ${DateFormat('MMM').format(event.dateTime).toUpperCase()} - ${DateFormat('EEE').format(event.dateTime)} - ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: MyColors.primary),),
                      Text(DateFormat.jm().format(event.dateTime), style: TextStyle(fontSize: 16, color: MyColors.primary, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  const SizedBox(height: 3,), 
                  Text(event.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 150,),
          CircularProgressIndicator(),
          SizedBox(height: 10,),
          Text(loadingText)
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  String text;
  Color color;
  TitleText({super.key, required this.text, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: color),);
  }
}

class OrgInfoCard extends StatelessWidget {
  String title;
  String subTitle;
  String imageUrl;
  OrgInfoCard({super.key, required this.title, required this.subTitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(imageUrl))
        ),
      ),
      title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
      subtitle: Text(subTitle, style: TextStyle(fontSize: 16, color: MyColors.grey),),
    );
  }
}

class InfoCard extends StatelessWidget {
  String title;
  String subTitle;
  Widget icon;
  InfoCard({super.key, required this.title, required this.subTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: MyColors.primaryLight,
          borderRadius: BorderRadius.circular(12)
        ),
        child: icon,
      ),
      title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
      subtitle: Text(subTitle, style: TextStyle(fontSize: 16, color: MyColors.grey),),
    );
  }
}

class ArrowBack extends StatelessWidget {
  Color color;
  ArrowBack({super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back, color: color));
  }
}