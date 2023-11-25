import 'package:events/core/config/myColors.dart';
import 'package:events/core/constants/strings.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/presentation/bloc/event_list_bloc/event_bloc.dart';
import 'package:events/features/event/presentation/bloc/event_search_bloc/bloc/event_search_bloc.dart';
import 'package:events/features/event/presentation/widgets/event_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventSearch extends StatelessWidget {
  const EventSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Row(
                children: [
                  ArrowBack(),
                  TitleText(text: 'Search')
                ],
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/search.png', color: MyColors.primary, width: 24,),
                        const SizedBox(width: 10,),
                        Container(
                          height: 24,
                          width: 1,
                          color: MyColors.primary,
                        ),
                        const SizedBox(width: 10,),
                        Expanded(child: TextField(
                          style: const TextStyle(fontSize: 20),
                          onChanged: (text){
                            BlocProvider.of<EventSearchBloc>(context).add(EventFetchSearchEvent(text));
                          },
                          decoration: InputDecoration(
                            hintText: eventSearchHint,
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 20, color: MyColors.hint)
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(height: 15,),
                    BlocBuilder<EventSearchBloc, EventSearchState>(
                      builder: (context, state) {
                        if(state is EventSearchFetchedState) {
                          List<EventEntity> events = state.searchedEvents!;
                          return ListView.builder(
                          itemCount: events.length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return EventSearchItemCard(
                                event: events[index], onPressed: () {
                                  Navigator.pushNamed(context, '/event_detailed', arguments: events[index].id);
                                });
                          },
                        );
                        }else if(state is EventInitial){
                          return ElevatedButton(onPressed: (){}, child: const Text('Load events'));
                        }else if(state is EventSearchFetchingFailedState){
                          return Column(
                            children: [
                              const SizedBox(height: 60,),
                              Text(notFound, style: TextStyle(fontSize: 18, color: MyColors.grey),),
                            ],
                          );
                        }else{
                          return const LoadingCard();
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}