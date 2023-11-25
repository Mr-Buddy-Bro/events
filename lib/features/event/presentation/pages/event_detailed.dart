import 'package:events/core/config/myColors.dart';
import 'package:events/core/constants/strings.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/presentation/bloc/event_detail_bloc/event_detail_bloc.dart';
import 'package:events/features/event/presentation/widgets/event_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class EventDetailed extends StatelessWidget {
  const EventDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    int eventId = ModalRoute.of(context)?.settings.arguments as int;
    BlocProvider.of<EventDetailBloc>(context)
        .add(EventDetailFetchEvent(eventId));
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<EventDetailBloc, EventDetailState>(
          builder: (context, state) {
            if(state is EventDetailFetchedSate) {
              EventEntity event = state.eventEntity!;
              return Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: Image.network(
                          event.bannerImage,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black54,
                            Colors.black45,
                            Colors.transparent
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ArrowBack(
                                  color: Colors.white,
                                ),
                                TitleText(
                                    text: eventDetailsTitle,
                                    color: Colors.white),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  color: MyColors.lightgrey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                Icons.bookmark,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: const TextStyle(fontSize: 28),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OrgInfoCard(
                          title: event.organiserName,
                          subTitle: organizer,
                          imageUrl: event.organiserIcon),
                      InfoCard(
                          title:
                              '${DateFormat('dd').format(event.dateTime)} ${DateFormat('MMMM').format(event.dateTime)}, ${DateFormat('yyyy').format(event.dateTime)}',
                          subTitle:
                              '${DateFormat('EEEE').format(event.dateTime)}, ${DateFormat.jm().format(event.dateTime)} - ${DateFormat.jm().format(event.dateTime.add(const Duration(hours: 3)))}',
                          icon: Image.asset('assets/icons/calendar.png')),
                      InfoCard(
                          title: event.venueName,
                          subTitle: '${event.venueCity}, ${event.venueCountry}',
                          icon: Image.asset('assets/icons/location.png')),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        aboutEvent,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ReadMoreText(
                        event.description,
                        trimLines: 4,
                        trimLength: 200,
                        style: const TextStyle(fontSize: 18, height: 1.6),
                        trimMode: TrimMode.Length,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Read less',
                        lessStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: MyColors.primary),
                        moreStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: MyColors.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 180,
                )
              ],
            );
            }else{
              return const LoadingCard();
            }
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 130,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.white70, Colors.white24],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          eventBookBtnLabel,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
