import 'package:events/core/constants/strings.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/presentation/bloc/event_list_bloc/event_bloc.dart';
import 'package:events/features/event/presentation/widgets/event_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EventBloc>(context).add(EventFetchEvent());
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleText(text: eventListTitle),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/event_search');
                          },
                          icon: Image.asset(
                            'assets/icons/search.png',
                            width: 24,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                               BlocProvider.of<EventBloc>(context)
                                .add(EventFetchEvent());
                            },
                            icon: const Icon(Icons.more_vert_rounded))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<EventBloc, EventState>(
                  builder: (context, state) {
                    // BlocProvider.of<EventBloc>(context).add();
                    if(state is EventFetchedState) {
                      List<EventEntity> events = state.events!;
                      return ListView.builder(
                      itemCount: events.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return EventItemCard(
                            event: events[index], onPressed: () {
                              Navigator.pushNamed(context, '/event_detailed', arguments: events[index].id);
                            });
                      },
                    );
                    }else if(state is EventInitial || state is EventFetchingFailedState){
                      return ElevatedButton(onPressed: (){}, child: const Text('Load events'));
                    }else{
                      return const LoadingCard();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
