// ignore_for_file: must_be_immutable

import 'package:events/core/config/myColors.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItemCard extends StatelessWidget {
  EventEntity event;
  VoidCallback onPressed;
  EventItemCard({super.key, required this.event, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MyColors.cardBg,
        borderRadius: BorderRadius.circular(20)
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: NetworkImage(event.bannerImage), fit: BoxFit.cover)
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
                        child: Icon(Icons.circle_rounded, size: 6, color: MyColors.grey,),
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

class TitleText extends StatelessWidget {
  String text;
  TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),);
  }
}